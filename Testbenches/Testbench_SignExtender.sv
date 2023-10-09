module Testbench_SignExtender;

    logic [15:0] input_data;
    logic [31:0] output_data;

    // Instantiate the SignExtender module
    SignExtender SE (
        .input_data(input_data),
        .output_data(output_data)
    );

    // Test sequence
    initial begin
        // Test positive number (no sign extension)
        input_data = 16'b0010101010101010;
        #10;
        $display("Input: %h, Output: %h", input_data, output_data);

        // Test negative number (sign extension)
        input_data = 16'b1111101010101011;
        #10;
        $display("Input: %h, Output: %h", input_data, output_data);

        // Finish the simulation
        $finish;
    end

endmodule
