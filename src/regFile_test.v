
`timescale 1ns / 1ps

module regFile_test;
    parameter period = 20;

    reg i_clk, i_we;
    reg [4:0] i_raddr1, i_raddr2, i_waddr;
    reg [31:0] i_wdata;
    wire [31:0] o_rdata1, o_rdata2;

    regFile regFile(.i_clk(i_clk), 
                    .i_raddr1(i_raddr1), 
               	    .i_raddr2(i_raddr2), 
               	    .i_waddr(i_waddr), 
               	    .i_wdata(i_wdata), 
               	    .i_we(i_we),
               	    .o_rdata1(o_rdata1),
               	    .o_rdata2(o_rdata2) 
               	    );
    initial begin
        i_clk = 0;
        forever #(period/2) i_clk = ~i_clk;
    end
	
    initial begin	
    end

    
    reg	[31:0] reg_data [31:0];
    initial $readmemh("reg_data.dat", reg_data);
    reg [5:0] count = 0;

    initial begin
        i_we = 1;
        i_raddr1 = 0;
        i_raddr2 = 2;
        while (count != 32) begin
            i_waddr = count;
            i_wdata = reg_data[count];
            #30 count = count + 1;
        end
        
        i_we = 0;
        count = 0;
        while (count != 32) begin
            i_raddr1 = count;
            i_raddr2 = count + 1;
            #23 count = count + 1;
        end
    end

    initial #1400 $stop;

endmodule


