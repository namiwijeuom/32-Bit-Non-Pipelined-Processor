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

module Datapath(input logic clk, reset,
                input logic memtoreg, pcsrc,
                input logic [1:0] alusrc,
                input logic ne,
                input logic regdst, lbu, link,
                input logic regwrite, jump,jr, half,b,
                input logic [3:0] alucontrol,
                output logic zero,
                output logic [31:0] pc,
                input logic [31:0] instr,
                output logic [31:0] aluout, writedata,
                input logic [31:0] readdata);


    logic [4:0] writereg;
    logic [31:0] pcnext, pcnextbr, pcplus4, pcbranch,pcnextj;
    logic [31:0] signimm, signimmsh;
    logic [31:0] srca, srcb;
    logic [31:0] result; // datamemory after the one byte design
    logic [31:0] result_T; 
    logic [31:0] bfresult ;
    logic [4:0] outwrite;
    logic [31:0] half_result_extended;
    logic [31:0] hw_dataMemeoryOutput; // datamemory after the half word design
    logic [31:0] one_byte_result_sign_extended;


    // next PC logic
    ResetableFF #(32) 		pcreg(clk, reset, pcnext, pc);

    Adder 						pcadd1(pc, 32'b100, pcplus4); //normal +4

    LeftShiftBy2  			immsh(signimm, signimmsh); //jumb

    Adder 						pcadd2(pcplus4, signimmsh, pcbranch); //branch or jumb

    //half
    SignExtender 				se2(result_T[15:0], half_result_extended); //extend sign
    
	 //mux after the halfword
    mux2 #(32) 				halfmux(result_T,half_result_extended,half,hw_dataMemeoryOutput);
    
	 // one byte
    SignExtender #(24,8) 	se3(result_T[7:0], one_byte_result_sign_extended);
    
	 //mux after the one byte word
    mux2 #(32) 				ob_mux(hw_dataMemeoryOutput,
                    one_byte_result_sign_extended,
                    b,
                    bfresult);
    mux2 #(32) 				jal_resmux(bfresult, pcplus4, link, result);

    mux2 #(32) 				pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
    mux2 #(32) 				pcmux(pcnextbr, {pcplus4[31:28],
									instr[25:0], 2'b00}, jump, pcnextj);
    mux2 #(32) 				pcjrmux(pcnextj, srca, jr, pcnext);

    RegisterFile 				rf(clk, regwrite, instr[25:21], instr[20:16],writereg, result, srca, writedata);

    mux2 #(5) 					wrmux(instr[20:16], instr[15:11], regdst, outwrite);
    
	 mux2 #(5) 					linkmux(outwrite, 5'b11111, link, writereg);
    // mux2 #(32) resmux(aluout, readdata, memtoreg, result_T);
    
	 mux4 #(32) 				resmux(aluout, readdata, {24'b0,readdata[7:0]},{32'bx}, {lbu,memtoreg},result_T);////hey....:)from mux 2 to 4 and zero ext is modified with parameters ...good luck :)

    SignExtender 				se(instr[15:0], signimm); //extend sign

    logic [31:0] extimm;
    logic [31:0] zeroimm;
    ExtNext 		ex(instr[15:0], zeroimm);
	 
    // ALU logic
    mux2 #(32) 	srcbmux(writedata, extimm, alusrc[0], srcb);
    mux2 #(32) 	extimux(signimm ,  zeroimm, alusrc[1], extimm);
    ALU			 	alu(srca, srcb, instr[10:6], alucontrol, aluout, zero); //inst[10:6] shamt
	 
endmodule 