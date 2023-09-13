//clk is the clock signal.
//address is the input that specifies the memory address of the instruction to be read.
//instruction is the output that provides the 32-bit instruction at the specified address.


module InstructionMemory(
    input logic clk,
    input logic [31:0] address,
    output logic [31:0] instruction
);

    // Define an array to store instructions
    reg [31:0] memory [0:31];

    // Initialize the instruction memory with sample instructions
    initial begin
        memory[0] = 32'h00000001; // Sample R-type instruction
        memory[1] = 32'h00000002; // Sample I-type instruction
		  memory[2] = 32'h00000003; // Sample I-type instruction
		  memory[3] = 32'h00000004; // Sample I-type instruction
		  memory[4] = 32'h00000005; // Sample I-type instruction
		  memory[5] = 32'h00000006; // Sample I-type instruction
		  memory[6] = 32'h00000007; // Sample I-type instruction
		  memory[7] = 32'h00000008; // Sample I-type instruction
		  memory[8] = 32'h00000009; // Sample I-type instruction
		  memory[9] = 32'h0000000a; // Sample I-type instruction
		  memory[10] = 32'h0000000b; // Sample I-type instruction
		  memory[11] = 32'h0000000c; // Sample I-type instruction
        // Add more instructions as needed
    end

    // Read the instruction at the specified address
    always_ff @(posedge clk)
    begin
        instruction = memory[address];
    end

endmodule
