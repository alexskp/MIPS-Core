

`timescale 1ns / 1ps

module signExtend_test;
    
    reg i_sign;
    reg [15:0] i_data;
    wire [31:0] o_data;
    
    signExtend signExtend(.i_data(i_data), .i_sign(i_sign), .o_data(o_data));

  
    initial begin 
        i_sign = 0;
        i_data = 2;
        #50 i_data = -1;
        #50 i_data = -50;
        i_sign = 1;
        #50 i_data = -16;
        #50 i_data = 20;
    end


    initial
        #1000 $stop;
endmodule
