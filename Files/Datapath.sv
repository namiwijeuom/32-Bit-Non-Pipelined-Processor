//Input Ports:
//
//clk and reset: Clock and reset signals for the processor.
//memtoreg, pcsrc, alusrc, regdst, regwrite, and jump: Control signals from the controller to configure the data path.
//alucontrol: A 3-bit control signal for the ALU operations.
//instr: Input instruction to the processor.
//readdata: Data read from memory.

//Output Ports:
//
//zero: A flag indicating whether the result of the ALU operation is zero.
//pc: The program counter.
//aluout: The result of the ALU operation.
//writedata: Data to be written to memory.

module Datapath(
	
	input logic clk, reset,
	
	input logic memtoreg, pcsrc,
	input logic alusrc, regdst,
	input logic regwrite, jump,
	input logic [2:0] alucontrol,
	
	output logic zero,
	output logic [31:0] pc,
	
	input logic [31:0] instr,
	
	output logic [31:0] aluout, writedata,
	
	input logic [31:0] readdata 
);
	//Internal Signals:
	//
	//writereg: A 5-bit signal used for selecting the destination register.
	//pcnext, pcnextbr, pcplus4, pcbranch: Signals related to program counter calculations.
	//signimm, signimmsh: Signals for sign-extending immediate values.
	//srca and srcb: Source operands for the ALU.
	//result: Result of ALU or register read.

	logic [4:0] writereg;
	logic [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
	logic [31:0] signimm, signimmsh;
	logic [31:0] srca, srcb;
	logic [31:0] result;

	// Next PC logic
	//pcreg: A 32-bit register to store the program counter.
	//pcadd1: Adds 32 to the program counter, calculating pcplus4.
	//immsh: Left-shifts the sign-extended immediate value.
	//pcadd2: Adds pcplus4 and the left-shifted immediate value to calculate pcbranch.
	//pcbrmux: Selects the next program counter value (pcnextbr) based on the pcsrc control signal.
	//pcmux: Selects the final next program counter value (pcnext) based on the jump control signal.
	ResetableFF #(32) 	pcreg(clk, reset, pcnext, pc);
	Adder 					pcadd1(pc, 32'b100, pcplus4);
	LeftShiftBy2 			immsh(signimm, signimmsh);
	Adder 					pcadd2(pcplus4, signimmsh, pcbranch);
	mux2 #(32) 				pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
	mux2 #(32) 				pcmux(pcnextbr, {pcplus4[31:28],instr[25:0], 2'b00}, jump, pcnext);

	// Register file logic
	
	//rf: Represents the register file, which reads registers (srca, srcb), writes to a register (writereg), and provides the result (result).
	//wrmux: Selects the register to be written based on the regdst control signal.
	//resmux: Selects the result to be used based on the memtoreg control signal.
	RegisterFile 			rf(clk, regwrite, instr[25:21], instr[20:16],writereg, result, srca, writedata);
	//RegisterFile 			rf(clk, write_enable, instr[25:21], instr[20:16],writereg, result, srca, writedata);
	mux2 #(5) 				wrmux(instr[20:16], instr[15:11],regdst, writereg);
	mux2 #(32) 				resmux(aluout, readdata, memtoreg, result);
	
	//se: Sign-extends the lower 16 bits of the instruction to a 32-bit value (signimm).
	SignExtender se(instr[15:0], signimm);

	// ALU logic
	//	srcbmux: Selects the second ALU operand (srcb) based on the alusrc control signal.
	//alu: Represents the Arithmetic Logic Unit (ALU) that performs operations on srca and srcb based on the alucontrol signal, producing aluout as the output.
	mux2 #(32) 				srcbmux(writedata, signimm, alusrc, srcb);
	ALU 						alu(srca, srcb, alucontrol, aluout, zero);

endmodule 