
`timescale 1ns / 1ps

module rom_test;    
    reg  [7:0]    i_addr;
    wire [31:0]   o_data;
    
    rom rom(.i_addr(i_addr), .o_data(o_data));

    initial begin 
        i_addr = 0;
        #50
        i_addr = 1;
        #50
        i_addr = 2;
        #50
        i_addr = 3;
        #50
        i_addr = 4;
        #50
        i_addr = 5;
        #50
        i_addr = 6;
        #50
        i_addr = 7;
        #50
        i_addr = 8;
        #50
        i_addr = 9;
        #50
        i_addr = 10;
        #50
        i_addr = 11;
        #50
        i_addr = 12;
    end

    initial
        #1000 $stop;
endmodule

