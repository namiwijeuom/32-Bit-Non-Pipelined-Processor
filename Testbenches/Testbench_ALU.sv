module Testbench_ALU;

    logic [31:0] input_A;
    logic [31:0] input_B;
    logic [2:0] alu_ctrl;
    logic zero_flag;
    logic [31:0] output_result;

    // Instantiate the ALU module
    ALU my_ALU (
        .input_A(input_A),
        .input_B(input_B),
        .alu_ctrl(alu_ctrl),
        .zero_flag(zero_flag),
        .output_result(output_result)
    );

    // Test sequence
    initial begin
        // Test AND operation
        input_A = 32'b10110010101011101000010011100101;
        input_B = 32'b10111101010001101010000111101010;
        alu_ctrl = 3'b000; // AND
        #10;
        $display("AND Result: %h, Zero Flag: %b", output_result, zero_flag);

        // Test ADD operation
        input_A = 32'b10110010101011101000010011100101;
        input_B = 32'b10111101010001101010000111101010;
        alu_ctrl = 3'b011; // ADD
        #10;
        $display("ADD Result: %h, Zero Flag: %b", output_result, zero_flag);

        // Add more test cases for different operations
		  
		  // Test OR operation
        input_A = 32'b10110010101011101000010011100101;
        input_B = 32'b10111101010001101010000111101010;
        alu_ctrl = 3'b001; // OR
        #10;
        $display("OR Result: %h, Zero Flag: %b", output_result, zero_flag);
		  
		  // Test XOR operation
        input_A = 32'b10110010101011101000010011100101;
        input_B = 32'b10111101010001101010000111101010;
        alu_ctrl = 3'b010; // XOR
        #10;
        $display("XOR Result: %h, Zero Flag: %b", output_result, zero_flag);
		  
		  
		  // Test SUB operation
        input_A = 32'b10110010101011101000010011100101;
        input_B = 32'b10111101010001101010000111101010;
        alu_ctrl = 3'b100; // SUB
        #10;
        $display("SUB Result: %h, Zero Flag: %b", output_result, zero_flag);
		 
		 
			// Test SLL operation
        input_A = 32'b10110010101011101000010011100101;
        input_B = 32'b10111101010001101010000111101010;
        alu_ctrl = 3'b101; // SLL
        #10;
        $display("SLL Result: %h, Zero Flag: %b", output_result, zero_flag);
		 
        // Finish the simulation
        $finish;
    end

endmodule
