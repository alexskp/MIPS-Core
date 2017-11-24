
`timescale 1ns / 1ps

module alu_test;
    localparam AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010,
               SUB = 4'b0110, SOLT = 4'b0111, NOR = 4'b1100;           
    reg  [31:0]  i_op1, i_op2;
    reg  [3:0]   i_control;
    wire [31:0]  o_result;
    wire         o_zf;
    
    alu alu(.i_op1(i_op1), .i_op2(i_op2), .i_control(i_control), .o_result(o_result), .o_zf(o_zf));

  
    initial begin 
        i_op1 = 32'd512;
        i_op2 = 32'd300;
        i_control = ADD;
        #50 
        i_op1 = 32'd1234;
        i_op2 = 32'd1111;
        i_control = ADD;
        #50 
        i_op1 = 32'd1000;
        i_op2 = 32'd5000;
        i_control = SUB;
        #50 
        i_op1 = 32'd3211;
        i_op2 = 32'd3011;
        i_control = SUB;
        #50 
        i_op1 = 32'b1111111100000000;
        i_op2 = 32'b1011000100001111;
        i_control = AND;
        #50 
        i_op1 = 32'b1010101010101010;
        i_op2 = 32'b0101010101010101;
        i_control = AND;
        #50
        i_op1 = 32'b1111111111111111;
        i_op2 = 32'b0000000111000011;
        i_control = OR;
        #50 
        i_op1 = 32'b0000001100000000;
        i_op2 = 32'b1111000000111111;
        i_control = OR;
        #50 
        i_op1 = 32'b1111111111111111;
        i_op2 = 32'b0000000111000011;
        i_control = NOR;
        #50 
        i_op1 = 32'b0000001100000000;
        i_op2 = 32'b1111000000111111;
        i_control = NOR;
        #50 
        i_op1 = 32'b0000000000000011;
        i_op2 = 32'b0000000000111111;
        i_control = SOLT;
        #50 
        i_op1 = 32'b0001100001111000;
        i_op2 = 32'b0000000001111000;
        i_control = SOLT;
    end


    initial
        #1000 $stop;
endmodule
