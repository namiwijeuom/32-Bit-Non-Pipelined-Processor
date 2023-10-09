//clk is the clock signal.
//ra1 and ra2 are the inputs specifying which registers to read.
//wa3 specifies the register to write to.
//we3 is a control signal that enables or disables the write operation.
//write_data is the data to be written into the specified register.
//read_data1 and read_data2 are the outputs that provide the data read from the specified registers.


module RegisterFile(
   input logic clk,
	input logic we3,
	input logic [4:0] ra1, ra2, wa3,
	input logic [31:0] write_data,
	output logic [31:0] read_data1, read_data2);


	logic [31:0] rf[31:0];
// three ported register file
// read two ports combinationally
// writes to third port on rising edge of clk
// register 0 is hardwired to 0

	always_ff @(posedge clk)
	if (we3) rf[wa3] <= write_data;
		assign read_data1 = (ra1 != 0) ? rf[ra1] : 0;
		assign read_data2 = (ra2 != 0) ? rf[ra2] : 0;

endmodule
