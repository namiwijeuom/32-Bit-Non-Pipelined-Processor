module InsructionMemory2(
	input logic [5:0] a,
	output logic [31:0] readdata
	);

	logic [31:0] ram[63:0];

	initial

	$readmemh("C:/Verilog_and_SystemVerilog/memfile_lh_lb.dat", ram);

	assign readdata = ram[a]; // word aligned

endmodule 