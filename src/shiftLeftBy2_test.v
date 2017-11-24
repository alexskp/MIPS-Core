

`timescale 1ns / 1ps

module shiftLeftBy2_test;
    parameter WIDTH = 32;

    reg [WIDTH-1:0] i_data;
    wire [WIDTH-1:0] o_data;
    
    shiftLeftBy2 shiftLeftBy2(.i_data(i_data), .o_data(o_data));

  
    initial begin 
	i_data = 1;
        #50 i_data = 2;
        #50 i_data = 4;
        #50 i_data = 8;
        #50 i_data = 16;
        #50 i_data = 32;
    end


    initial
        #1000 $stop;
endmodule