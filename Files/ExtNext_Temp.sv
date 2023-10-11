// sign-extending a 5-bit value to a 32-bit value
 
module ExtNext_Temp(input logic [4:0] a,
                output logic [31:0] y);

logic zero;
assign zero = 0;
assign y = {{27{zero}}, a};

endmodule 