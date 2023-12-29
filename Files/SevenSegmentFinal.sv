module SevenSegmentFinal(
	input logic [3:0] in_bcd, 
	output logic [6:0] out_ssd
);
	//logic [6:0] out_ssd;
	
	always @(in_bcd) 
	
	begin
		case (in_bcd)
		0:out_ssd=7'b1000000;
		1:out_ssd=7'b1111001;
		2:out_ssd=7'b0100100;
		3:out_ssd=7'b0110000;
		4:out_ssd=7'b0011001;
		5:out_ssd=7'b0010010;
		6:out_ssd=7'b0000010;
		7:out_ssd=7'b1111000;
		8:out_ssd=7'b0000000;
		9:out_ssd=7'b0010000;
		
			default out_ssd = 7'b1111111;          // no ssd
		endcase
	end

endmodule
