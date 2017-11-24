
`timescale 1ns / 1ps

module pc_test;
    reg i_clk, i_rst_n;
    reg [29:0] i_pc;
    wire [29:0] o_pc;
    
    pc pc(.i_clk(i_clk), .i_rst_n(i_rst_n), .i_pc(i_pc), .o_pc(o_pc));
  
    parameter period = 50;
  
    initial
        #1000 $stop;
    
    initial begin
        i_clk = 1'b0;
        forever #(period /2) i_clk = ~i_clk;
    end
  
    initial begin 
	i_rst_n = 1;
        #8 i_pc = 122;
        #50 i_pc = 54;
        #50 i_pc = 331;
        #50 i_pc = 20;
        #50 i_pc = 125;
	#50 i_pc = 574;
        #50 i_pc = 31;
        #50 i_pc = 290;
        #50 i_pc = 62;
        #50 i_pc = 5789;
        #50 i_pc = 90;
    end

    initial begin 
	#345 i_rst_n = 0;
	#40 i_rst_n = 1;
    end

endmodule
