
`timescale 1ns / 1ps

module control_test;

    reg [5:0] i_instrCode;
    wire o_regDst, o_jump, o_branch, o_memToReg, o_memWrite, o_aluSrc, o_regWrite, o_extOp;

    control control(.i_instrCode(i_instrCode), 
                    .o_regDst(o_regDst),
                    .o_jump(o_jump), 
                    .o_branch(o_branch),
                    .o_memToReg(o_memToReg),
                    .o_memWrite(o_memWrite),
                    .o_aluSrc(o_aluSrc),
                    .o_regWrite(o_regWrite),
                    .o_extOp(o_extOp)
                   );

    initial begin
        i_instrCode = 6'b000000;
        #50
        i_instrCode = 6'b001000;
        #50
        i_instrCode = 6'b001001;
        #50
        i_instrCode = 6'b100011;
        #50
        i_instrCode = 6'b101011;
        #50
        i_instrCode = 6'b000100;
        #50
        i_instrCode = 6'b000010;
    end

    initial
        #1000 $stop;
endmodule