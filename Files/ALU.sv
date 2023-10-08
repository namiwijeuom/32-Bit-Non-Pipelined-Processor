module ALU(
    input logic [31:0] operand1,
    input logic [31:0] operand2,
    input logic [2:0] alucontrol,
    output logic [31:0] result,
    output logic zero
);

    always_comb begin
        case (alucontrol)
            3'b000: result = operand1 & operand2; // AND
            3'b001: result = operand1 | operand2; // OR
            3'b010: result = operand1 + operand2; // ADD
            3'b110: result = operand1 - operand2; // SUB
            3'b111: result = (operand1 < operand2) ? 32'b1 : 32'b0; // SLT
            default: result = 32'b0; // Unknown or no operation
        endcase

        // Check if the result is zero
        zero = (result == 32'b0);
    end

endmodule
