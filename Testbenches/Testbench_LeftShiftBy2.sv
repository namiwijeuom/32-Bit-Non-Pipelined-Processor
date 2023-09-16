module Testbench_LeftShiftBy2;

    logic [31:0] input_data;
    logic [31:0] shifted_data;

    // Instantiate the LeftShiftBy2 module
    LeftShiftBy2 my_shifter (
        .input_data(input_data),
        .shifted_data(shifted_data)
    );

    // Test sequence
    initial begin
        // Test case 1: Shift a positive number
        input_data = 32'b00000000000000000000000000000010;
        #10;
        $display("Input: %h, Shifted: %h", input_data, shifted_data);

        // Test case 2: Shift a negative number
        input_data = 32'b11111111111111111111111111111100;
        #10;
        $display("Input: %h, Shifted: %h", input_data, shifted_data);

        // Finish the simulation
        $finish;
    end

endmodule
