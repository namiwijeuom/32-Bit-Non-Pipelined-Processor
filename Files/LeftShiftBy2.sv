// Performs a left shift operation on a 32-bit input data by 2 bits.

module LeftShiftBy2(
    input logic [31:0] input_data,
    output logic [31:0] shifted_data
);

    always_comb begin
        shifted_data = input_data << 2;
    end

endmodule
