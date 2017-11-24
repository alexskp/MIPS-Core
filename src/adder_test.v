
`timescale 1ns / 1ps

module adder_test;

    reg [29:0] i_op1, i_op2;
    wire [29:0] o_result;
    
    adder adder(.i_op1(i_op1), .i_op2(i_op2), .o_result(o_result));

    initial begin 
        i_op1 = 22;
        i_op2 = 67;
        #50 
        i_op1 = 600;
        i_op2 = -80;
        #50 
        i_op1 = 244;
        i_op2 = -244;
        #50 
        i_op1 = -790;
        i_op2 = 90;
        #50 
        i_op1 = 1234;
        i_op2 = -234;
    end

    initial
        #1000 $stop;
endmodule
