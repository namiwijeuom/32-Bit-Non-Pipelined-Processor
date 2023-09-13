//We generate a clock signal (clk) and apply it to the ProgramCounter module.
//We apply a reset signal (reset) to initialize the PC to 0.
//We set the increment signal to 4, meaning the PC will increment by 4 in each clock cycle.
//We simulate 10 clock cycles and display the PC value at each cycle using $display.


module ProgramCounter_Testbench;

    logic clk;
    logic reset;
    logic [31:0] increment;
    logic [31:0] pc_out;

    // Instantiate the ProgramCounter module
    ProgramCounter PC (
        .clk(clk),
        .reset(reset),
        .increment(increment),
        .pc_out(pc_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        clk = 0;
        reset = 0;
        increment = 32'h4;  // Increment by 4 in each cycle

        // Reset the PC
        reset = 1;
        #10 reset = 0;

        // Simulate 10 clock cycles
        for (int i = 0; i < 10; i = i + 1) begin
            #5;
            $display("Cycle %d: PC = %d", i, pc_out);
        end

        // Finish the simulation
        $finish;
    end

endmodule
