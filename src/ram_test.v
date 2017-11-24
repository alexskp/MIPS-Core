
`timescale 1ns / 1ps

module ram_test;
    parameter period = 100;
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 5;

    reg i_clk, i_we;
    reg  [ADDR_WIDTH-1:0] i_addr;
    reg  [DATA_WIDTH-1:0] i_data;
    wire [DATA_WIDTH-1:0] o_data;

    ram ram(.i_clk(i_clk), .i_addr(i_addr), .i_data(i_data), .i_we(i_we), .o_data(o_data));

    initial begin
        i_clk = 0;
        forever #(period/2) i_clk = ~i_clk;
    end

    initial begin
        #5
        i_we = 1;
        i_addr = 0;
        i_data = 1111;
        #120
        i_addr = 1;
        i_data = 2222;
        #120
        i_addr = 2;
        i_data = 3333;
        #120
        i_addr = 3;
        i_data = 4444;
        #120
        i_addr = 4;
        i_data = 5555;
        #120
        i_addr = 5;
        i_data = 6666;
        
        #120
        i_we = 0;
        i_addr = 0;
        #120
        i_addr = 1;
        #120
        i_addr = 2;
        #120
        i_addr = 3;
        #120
        i_addr = 4;
        #120
        i_addr = 5;
        
    end

    initial #1700 $stop;

endmodule


