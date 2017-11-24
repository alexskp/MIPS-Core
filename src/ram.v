
module ram(i_clk, i_addr, i_data, i_we, o_data);
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 5; //32 4-byte words

input                     i_clk, i_we;
input   [ADDR_WIDTH-1:0]  i_addr;
input   [DATA_WIDTH-1:0]  i_data;
output  [DATA_WIDTH-1:0]  o_data;

reg [DATA_WIDTH-1:0] ram [(2**ADDR_WIDTH)-1:0];
initial $readmemh("init/ram_init.dat", ram);

always @ (posedge i_clk) begin
    if (i_we)
        ram[i_addr] <= i_data;
end

// assign o_data = (!i_we) ? ram[i_addr] : 0;

assign o_data = ram[i_addr];

endmodule
