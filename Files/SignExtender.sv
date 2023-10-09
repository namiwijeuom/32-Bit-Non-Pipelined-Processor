// a is a 16-bit input signal which represents the original value that is needed to sign-extend to 32 bits.
// y is a 32-bit output signal which contains the sign-extended version of the input a

module SignExtender(
	input logic [15:0] a,
	output logic [31:0] y);

	assign y = {{16{a[15]}}, a};


endmodule 