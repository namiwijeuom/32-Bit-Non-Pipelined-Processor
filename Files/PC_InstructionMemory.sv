module PC_InstructionMemory(
    input logic clk,
    input logic reset,
    output logic [31:0] instruction
);

    logic [31:0] pc;
    logic [31:0] address; // Connect this to the instruction memory's address input

    // Instantiate the ProgramCounter module
    ProgramCounter PC (
        .clk(clk),
        .reset(reset),
        .increment(32'b100), // Assuming PC increments by 4 for each instruction fetch
        .pc_out(pc)
    );
	 
	assign address = pc;
    
	 // Instantiate the InstructionMemory module
    InstructionMemory IM (
        .clk(clk),
        .address(address), // Connect the PC output to the instruction memory's address input
        .instruction(instruction)
    );

endmodule
