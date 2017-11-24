
module mips_core(i_clk, i_rst_n);

    input       i_clk, i_rst_n;
    wire [29:0] pc, pc_inc_res, pc_adder_res, j_target_mux_out, next_pc_mux_out;
    wire [31:0] instr, alu_res, bus_A, bus_B, ram_out;
    wire [4:0]  Rs =    instr[25:21];
    wire [4:0]  Rt =    instr[20:16];
    wire [4:0]  Rd =    instr[15:11];
    wire [5:0]  op =    instr[31:26];
    wire [5:0]  funct = instr[5:0];
    wire [15:0] imm =   instr[15:0];
    wire [25:0] imm26 = instr[25:0];
    wire [3:0]  alu_ctrl;
    wire        regDst, jump, branch, memToReg, memWrite, aluSrc, regWrite, extOp, zf;
    wire [4:0]  reg_dst_mux_out;
    wire [31:0] alu_src_mux_out, sign_extend_out, memtoreg_mux_out, addr_sign_ext_res;

    pc          pc_(.i_clk(i_clk),
                    .i_rst_n(i_rst_n),
                    .i_pc(next_pc_mux_out),
                    .o_pc(pc));
    
    defparam    pc_inc.WIDTH = 30;
    adder       pc_inc(.i_op1(pc),
                       .i_op2(30'b1),
                       .o_result(pc_inc_res));
    
    defparam    prog_rom.ADDR_WIDTH = 20;
    defparam    prog_rom.DATA_WIDTH = 32;
    rom         prog_rom(.i_addr(pc[19:0]),
                         .o_data(instr));

    regFile     regFile(.i_clk(i_clk), 
                        .i_raddr1(Rs), 
                        .i_raddr2(Rt), 
                        .i_waddr(reg_dst_mux_out), 
                        .i_wdata(memtoreg_mux_out), 
                        .i_we(regWrite),
                        .o_rdata1(bus_A),
                        .o_rdata2(bus_B));

    alu_control alu_control(.i_op(op),
                            .i_func(funct),
                            .o_aluControl(alu_ctrl));

    alu         alu(.i_op1(bus_A),
                    .i_op2(alu_src_mux_out),
                    .i_control(alu_ctrl),
                    .o_result(alu_res),
                    .o_zf(zf));

    control     control(.i_instrCode(op),
                        .o_regDst(regDst),
                        .o_jump(jump), 
                        .o_branch(branch),
                        .o_memToReg(memToReg),
                        .o_memWrite(memWrite),
                        .o_aluSrc(aluSrc),
                        .o_regWrite(regWrite),
                        .o_extOp(extOp));

    defparam    reg_dst_mux.WIDTH = 5;
    mux2in1     reg_dst_mux(.i_dat0(Rt),
                            .i_dat1(Rd),
                            .i_control(regDst),
                            .o_dat(reg_dst_mux_out));

    mux2in1     alu_src_mux(.i_dat0(bus_B),
                            .i_dat1(sign_extend_out),
                            .i_control(aluSrc),
                            .o_dat(alu_src_mux_out));

    signExtend  immSignExtend(.i_data(imm),
                              .i_sign(extOp),
                              .o_data(sign_extend_out));

    defparam    ram.ADDR_WIDTH = 20;
    ram         ram(.i_clk(i_clk),
                    .i_addr(alu_res[19:0]),
                    .i_data(bus_B),
                    .i_we(memWrite),
                    .o_data(ram_out));

    mux2in1     memtoreg_mux(.i_dat0(alu_res),
                             .i_dat1(ram_out),
                             .i_control(memToReg),
                             .o_dat(memtoreg_mux_out));
    


    defparam    next_pc_mux.WIDTH = 30;
    mux2in1     next_pc_mux(.i_dat0(pc_inc_res),
                            .i_dat1(j_target_mux_out),
                            .i_control( (zf & branch) | jump ),
                            .o_dat(next_pc_mux_out));

    defparam    j_target_mux.WIDTH = 30;             
    mux2in1     j_target_mux(.i_dat0(pc_adder_res),
                             .i_dat1( {pc_inc_res[29:26], imm26} ),
                             .i_control(jump),
                             .o_dat(j_target_mux_out));

    signExtend  addr_sign_ext(.i_data(imm),
                              .i_sign(1'b1),
                              .o_data(addr_sign_ext_res));

    defparam    pc_adder.WIDTH = 30;
    adder       pc_adder(.i_op1(pc_inc_res),
                         .i_op2(addr_sign_ext_res[29:0]),    //// !!!
                         .o_result(pc_adder_res));

endmodule
