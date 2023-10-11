// a is a 16-bit input signal which represents the original value that is needed to sign-extend to 32 bits.
// y is a 32-bit output signal which contains the sign-extended version of the input a

module SignExtender #(parameter extamount = 16,parameter inputsize = 16)
			   (input [inputsize-1:0]x,
			   output [inputsize+extamount-1:0]o);

assign o = {{extamount{x[inputsize-1]}},x};

endmodule 