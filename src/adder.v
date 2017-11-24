module adder(i_op1, i_op2, o_result);
    parameter WIDTH = 32;
    input [WIDTH-1:0] i_op1, i_op2;
    output [WIDTH-1:0] o_result;

    assign o_result = i_op1 + i_op2;
  
endmodule
