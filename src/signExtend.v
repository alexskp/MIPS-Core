module signExtend(i_data, i_sign, o_data);
input   i_sign;
input   [15:0]  i_data;
output  [31:0]  o_data;

assign o_data[15:0] = i_data[15:0];
assign o_data[31:16] = (i_data[15] && i_sign ? 16'hFFFF : 16'h0);

endmodule
