//clk is the clock signal.
//reset is the reset signal. When reset is asserted, the PC is reset to 0.
//increment is the input that determines how much the PC should increment in each clock cycle.
//pc_out is the 32-bit output of the PC.

module ProgramCounter(
    input logic clk,
    input logic reset,
    input logic [31:0] increment,
    output logic [31:0] pc_out
);

    logic [31:0] pc;

    always_ff @(posedge clk or posedge reset)
    begin
        if (reset)
            pc <= 32'h0;  // Reset the PC to 0 when reset is active
        else
            pc <= pc + increment; // Increment the PC when not reset
    end

    assign pc_out = pc;

endmodule
