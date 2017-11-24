module alu_control(i_op, i_func, o_aluControl);
 
input       [5:0]   i_op;
input       [5:0]   i_func;
output  reg [3:0]   o_aluControl;

localparam  R_TYPE_op = 6'b000000, ADDI_op = 6'b001000,              // opcode 
            ADDIU_op = 6'b001001, LW_op = 6'b100011,
            SW_op = 6'b101011, BEQ_op = 6'b000100, 
            J_op = 6'b000010, ANDI_op = 6'b001100,
            ORI_op = 6'b001101, SLTI_op = 6'b001010;

localparam ADD_f = 6'b100000, ADDU_f =  6'b100001,                   // instruction function
           SUB_f = 6'b100010, SUBU_f = 6'b100011,
           AND_f = 6'b100100, OR_f = 6'b100101, 
           SLT_f = 6'b101010, NOR_f = 6'b100111;

localparam AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010,               // ALU control outputs
           SUB = 4'b0110, SLT = 4'b0111, NOR = 4'b1100;

always @ (*) begin
    case (i_op)
        R_TYPE_op:
            case (i_func)
                ADD_f:      o_aluControl <= ADD;
                ADDU_f:     o_aluControl <= ADD;
                SUB_f:      o_aluControl <= SUB;
                SUBU_f:     o_aluControl <= SUB;
                AND_f:      o_aluControl <= AND;
                OR_f:       o_aluControl <= OR;
                NOR_f:      o_aluControl <= NOR;
                SLT_f:      o_aluControl <= SLT;
                default:    o_aluControl <= ADD;
            endcase
        ADDI_op:    o_aluControl <= ADD;
        ADDIU_op:   o_aluControl <= ADD;
        LW_op:      o_aluControl <= ADD;
        SW_op:      o_aluControl <= ADD;
        BEQ_op:     o_aluControl <= SUB;
        ANDI_op:    o_aluControl <= AND;
        ORI_op:     o_aluControl <= OR;
        SLTI_op:    o_aluControl <= SLT;
        default:    o_aluControl <= ADD;
    endcase
end
endmodule
