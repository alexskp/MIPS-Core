module control(i_instrCode, 
               o_regDst,
               o_jump, 
               o_branch,
               o_memToReg,
               o_memWrite,
               o_aluSrc,
               o_regWrite,
               o_extOp
               );
    
    input      [5:0] i_instrCode;
    output           o_regDst;
    output           o_jump; 
    output           o_branch;
    output           o_memToReg;
    output           o_memWrite;
    output           o_aluSrc;
    output           o_regWrite;
    output           o_extOp;


    localparam  R_TYPE_op = 6'b000000, ADDI_op = 6'b001000,          // opcode 
                ADDIU_op = 6'b001001, LW_op = 6'b100011,
                SW_op = 6'b101011,  BEQ_op = 6'b000100,
                J_op = 6'b000010, ANDI_op = 6'b001100,
                ORI_op = 6'b001101, SLTI_op = 6'b001010;

    assign o_regDst     = (i_instrCode == R_TYPE_op);
    assign o_jump       = (i_instrCode == J_op);
    assign o_branch     = (i_instrCode == BEQ_op);
    assign o_memToReg   = (i_instrCode == LW_op);
    assign o_memWrite   = (i_instrCode == SW_op);
    assign o_aluSrc     = (i_instrCode != BEQ_op && i_instrCode != R_TYPE_op);
    assign o_regWrite   = (i_instrCode != BEQ_op && i_instrCode != SW_op 
                                                && i_instrCode != J_op);
    assign o_extOp      = (i_instrCode != ANDI_op && i_instrCode != ORI_op);

endmodule
