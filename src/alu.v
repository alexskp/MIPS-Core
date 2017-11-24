module alu(i_op1, i_op2, i_control, o_result, o_zf);

localparam AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010,
           SUB = 4'b0110, SOLT = 4'b0111, NOR = 4'b1100; //SOLT - Set On Less then
  
input       [31:0]  i_op1, i_op2;
input       [3:0]   i_control;
output  reg [31:0]  o_result;
output              o_zf;

assign o_zf = !o_result;

always @ (*) begin
    case (i_control)
        AND:
            o_result <= i_op1 & i_op2;
        OR: 
            o_result <= i_op1 | i_op2;
        ADD:
            o_result <= i_op1 + i_op2;
        SUB:
            o_result <= i_op1 - i_op2;
        SOLT:
            if (i_op1 < i_op2)
                o_result <= 1;
            else
                o_result <= 0;
        NOR:
            o_result <= ~(i_op1 | i_op2);
    endcase
end

endmodule
