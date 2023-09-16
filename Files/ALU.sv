//input_A and input_B are the two 32-bit input operands.
//alu_ctrl is the 3-bit ALU controller input that selects the ALU operation.
//zero_flag is the output indicating whether the result is zero.
//output_result is the 32-bit output of the ALU, which performs the selected operation based on the alu_ctrl input.


module ALU(
    input logic [31:0] input_A,
    input logic [31:0] input_B,
    input logic [2:0] alu_ctrl,
    output logic zero_flag,
    output logic [31:0] output_result
);

    always_comb begin
        case (alu_ctrl)
            3'b000: output_result = input_A & input_B; // AND
            3'b001: output_result = input_A | input_B; // OR
            3'b010: output_result = input_A ^ input_B; // XOR
            3'b011: output_result = input_A + input_B; // ADD
            3'b100: output_result = input_A - input_B; // SUB
            3'b101: output_result = input_A << input_B; // SLL (Shift Left Logical)
            3'b110: output_result = input_A >> input_B; // SRL (Shift Right Logical)
            3'b111: output_result = input_A >>> input_B; // SRA (Shift Right Arithmetic)
            default: output_result = 32'b0; // Default to 0 for undefined control values
        endcase
    end

    // Zero flag generation
    assign zero_flag = (output_result == 32'b0) ? 1'b1 : 1'b0;

endmodule
