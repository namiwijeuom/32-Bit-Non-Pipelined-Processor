module Testbench_ALU;

    // Define the ALU module inputs and outputs
    logic [31:0] operand1, operand2;
    logic [2:0] alucontrol;
    wire [31:0] result;
    wire zero;

    // Instantiate the ALU module
    ALU uut (
        .operand1(operand1),
        .operand2(operand2),
        .alucontrol(alucontrol),
        .result(result),
        .zero(zero)
    );

    // Clock generation
    logic clk = 0;
    always begin
        #5 clk = ~clk;
    end

    // Test cases
    initial begin
        // Test case 1: AND operation
        operand1 = 32'b11001100;
        operand2 = 32'b10101010;
        alucontrol = 3'b000;
        #10;
        if (result === 32'b10001000 && zero === 0)
            $display("Test case 1 passed");
        else
            $display("Test case 1 failed");

        // Test case 2: OR operation
        operand1 = 32'b11001100;
        operand2 = 32'b10101010;
        alucontrol = 3'b001;
        #10;
        if (result === 32'b11101110 && zero === 0)
            $display("Test case 2 passed");
        else
            $display("Test case 2 failed");

        // Test case 3: ADD operation
        operand1 = 32'b11001100;
        operand2 = 32'b10101010;
        alucontrol = 3'b010;
        #10;
        if (result === 32'b101110110 && zero === 0)
            $display("Test case 3 passed");
        else
            $display("Test case 3 failed");

        // Test case 4: SUB operation
        operand1 = 32'b11001100;
        operand2 = 32'b10101010;
        alucontrol = 3'b110;
        #10;
        if (result === 32'b00100010 && zero === 0)
            $display("Test case 4 passed");
        else
            $display("Test case 4 failed");

        // Test case 5: SLT operation (operand1 < operand2)
        operand1 = 32'b00110000;
        operand2 = 32'b11000000;
        alucontrol = 3'b111;
        #10;
        if (result === 32'b1 && zero === 0)
            $display("Test case 5 passed");
        else
            $display("Test case 5 failed");

        // Test case 6: SLT operation (operand1 >= operand2)
        operand1 = 32'b11000000;
        operand2 = 32'b00110000;
        alucontrol = 3'b111;
        #10;
        if (result === 32'b0 && zero === 1)
            $display("Test case 6 passed");
        else
            $display("Test case 6 failed");

        // Add more test cases as needed...

        $finish;
    end

endmodule
