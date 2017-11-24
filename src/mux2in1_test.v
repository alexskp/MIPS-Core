
`timescale 1ns / 1ps

module mux2in1_test;
    parameter WIDTH = 32;

    reg i_control;
    reg [WIDTH-1:0] i_dat0, i_dat1;
    wire [WIDTH-1:0] o_dat;
    
    mux2in1 mux2in1(.i_dat0(i_dat0), .i_dat1(i_dat1), .i_control(i_control), .o_dat(o_dat));
  
    initial
        #1000 $stop;
  
    initial begin 
	i_control = 0;
        i_dat0 = 122;
        i_dat1 = 54;
        #50 i_dat0 = 331;
            i_dat1 = 20;
        #50 i_dat0 = 125;
	    i_dat1 = 574;
        #50 i_dat0 = 31;
            i_dat1 = 290;
        #50 i_dat0 = 62;
            i_dat1 = 5789;

        i_control = 1;

        #50 i_dat0 = 90;
	    i_dat1 = 64;
        #50 i_dat0 = 98;
            i_dat1 = 2546;
        #50 i_dat0 = 9422;
            i_dat1 = 876;
	#50 i_dat0 = 437;
            i_dat1 = 12;
        #50 i_dat0 = 976;
            i_dat1 = 210;
        #50 i_dat0 = 902;
            i_dat1 = 257;
    end

endmodule
