module Testbench_PC_InstructionMemory;

    logic clk;
    logic reset;
    logic [31:0] instruction;

    // Instantiate the PC_InstructionMemory module
    PC_InstructionMemory PIM (
        .clk(clk),
        .reset(reset),
        .instruction(instruction)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        clk = 0;
        reset = 0;

        // Reset the PC
        reset = 1;
        #10 reset = 0;

        // Simulate fetching and displaying instructions
        for (int i = 0; i < 5; i = i + 1) begin
            #10;
            $display("Cycle %d: Instruction = %h", i, instruction);
        end

        // Finish the simulation
        $finish;
    end

endmodule
