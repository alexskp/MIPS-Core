
`timescale 1ns / 1ps

module mips_core_test;

    reg i_clk, i_rst_n;

    mips_core mips_core(.i_clk(i_clk), .i_rst_n(i_rst_n));


    parameter period = 100;

    initial begin
        i_rst_n = 0;
        #70 i_rst_n = 1;
    end

    initial begin
        i_clk = 0;
        forever #(period/2) i_clk = ~i_clk;
    end

    initial #2400 $stop;

endmodule
