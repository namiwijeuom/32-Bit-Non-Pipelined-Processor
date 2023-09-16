//select remains the select input, which is a 1-bit control signal that determines which data input to pass to the output.
//data_0 is one of the 32-bit data inputs.
//data_1 is the other 32-bit data input.
//output is the 32-bit output of the multiplexer, which will be equal to either data_0 or data_1 based on the value of select.


module Mux2to1_32bit(
    input logic select,        // Select input (1-bit)
    input logic [31:0] data_0, // Input 0 (32-bit)
    input logic [31:0] data_1, // Input 1 (32-bit)
    output logic [31:0] output_data // Output (32-bit)
);

    always_comb begin
        if (select)
            output_data = data_1; // Select input 1
        else
            output_data = data_0; // Select input 0
    end

endmodule
