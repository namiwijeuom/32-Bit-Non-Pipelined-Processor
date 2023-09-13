//We generate a clock signal (clk) and apply it to the InstructionMemory module.
//We apply different memory addresses to address and display the instructions retrieved using $display

module Testbench_InstructionMemory;

    logic clk;
    logic [31:0] address;
    logic [31:0] instruction;

    // Instantiate the InstructionMemory module
    InstructionMemory IM (
        .clk(clk),
        .address(address),
        .instruction(instruction)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        clk = 0;

        // Read instructions at different memory addresses
        for (int i = 0; i < 5; i = i + 1) begin
            address = i;
            #10;
            $display("Address %d: Instruction = %h", address, instruction);
        end

        // Finish the simulation
        $finish;
    end

endmodule
