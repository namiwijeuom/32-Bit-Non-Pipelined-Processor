module SignExtender(
    input logic [15:0] input_data, // Input data (16 bits)
    output logic [31:0] output_data // Output data (32 bits)
);

    // Sign extend logic
    always_comb begin
        if (input_data[15] == 1'b1) // If the sign bit is 1 (negative)
            output_data = {{16{1'b1}}, input_data};
        else // If the sign bit is 0 (positive or zero)
            output_data = {{16{1'b0}}, input_data};
    end

endmodule
