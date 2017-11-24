module pc(i_clk, i_rst_n, i_pc, o_pc);

input               i_clk, i_rst_n;
input       [29:0]  i_pc;
output  reg [29:0]  o_pc;

always @ (posedge i_clk) begin
    if (!i_rst_n)
        o_pc <= 0;
    else
        o_pc <= i_pc;
end
   
endmodule
