//sign-extending a 16-bit value to a 32-bit value 

module ExtNext(input logic [15:0] a,
                output logic [31:0] y);

logic zero;
assign zero = 0;
assign y = {{16{zero}}, a};

endmodule 