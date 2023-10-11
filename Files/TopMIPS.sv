// MIPS Top Module

module TopMIPS(input logic clk, reset,
            output logic [31:0] writedata, dataadr,
            output logic memwrite);

logic [31:0] pc, instr, readdata;

// instantiate processor and memories
MIPS mips(clk, reset, pc, instr, memwrite, 
        dataadr, writedata, readdata);

InsructionMemory2 imem(pc[7:2], instr);

DataMemory dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule 