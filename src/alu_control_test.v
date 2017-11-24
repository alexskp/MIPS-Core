
`timescale 1ns / 1ps

module alu_control_test;

    localparam  R_TYPE_op = 6'b000000, ADDI_op = 6'b001000, ADDIU_op = 6'b001001,               // opcode 
            LW_op = 6'b100011, SW_op = 6'b101011, BEQ_op = 6'b000100, J_op = 6'b000010,
            ANDI_op = 6'b001100, ORI_op = 6'b001101, SLTI_op = 6'b001010;

    localparam ADD_f =  6'b100000, SUB_f = 6'b100010, AND_f = 6'b100100, // instruction operation 
               OR_f = 6'b100101, SLT_f = 6'b101010;   

    reg  [5:0]   i_op;
    reg  [5:0]   i_func;
    wire [3:0]   o_aluControl;
    
    alu_control alu_control(.i_op(i_op), .i_func(i_func), .o_aluControl(o_aluControl));

    initial begin 
        i_op = ADDI_op;
        #50
        i_op = ADDIU_op;
        #50
        i_op = LW_op;
        #50
        i_op = SW_op;
        #50
        i_op = BEQ_op;
        #50
        i_op = J_op;
        #50
        i_op = ANDI_op;
        #50
        i_op = ORI_op;
        #50
        i_op = SLTI_op;
        #50

        i_op = R_TYPE_op;
        i_func = ADD_f;
        #50
        i_op = R_TYPE_op;
        i_func = SUB_f;
        #50
        i_op = R_TYPE_op;
        i_func = AND_f;
        #50
        i_op = R_TYPE_op;
        i_func = OR_f;
        #50
        i_op = R_TYPE_op;
        i_func = SLT_f;

    end


    initial
        #1000 $stop;
endmodule
