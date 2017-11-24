
module regFile(i_clk, 
               i_raddr1, 
               i_raddr2, 
               i_waddr, 
               i_wdata, 
               i_we,
               o_rdata1,
               o_rdata2 
               );
               
input           i_clk, i_we;
input   [4:0]   i_raddr1, i_raddr2, i_waddr;
input   [31:0]  i_wdata;           
output  [31:0]  o_rdata1, o_rdata2;

reg [31:0] reg_file [31:1];

assign o_rdata1 = (i_raddr1 == 0 ? 0 : reg_file[i_raddr1]);
assign o_rdata2 = (i_raddr2 == 0 ? 0 : reg_file[i_raddr2]);

always @ (posedge i_clk) begin
    if (i_we && i_waddr)
        reg_file[i_waddr] <= i_wdata;
end

endmodule
