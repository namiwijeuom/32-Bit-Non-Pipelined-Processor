module TOP_MIPS_SS(
	//////////// SEG7 //////////
	input [31:0] data,
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,  		//comment this using "//" if you are using Altera DE0 
	output		     [6:0]		HEX5,		//comment this using "//" if you are using Altera DE0
   output		     [6:0]     HEX6,
   output		     [6:0]     HEX7
);


wire [6:0] out_ssd;
wire [6:0] out_ssd1;
wire [6:0] out_ssd2;
wire [6:0] out_ssd3;
wire [6:0] out_ssd4;
wire [6:0] out_ssd5;
wire [6:0] out_ssd6;
wire [6:0] out_ssd7;


//=======================================================
//  REG/WIRE declarations
//=======================================================
sevenseg s0(data[3:0],out_ssd);
sevenseg s1(data[7:4],out_ssd1);
sevenseg s2(data[11:8],out_ssd2);
sevenseg s3(data[15:12],out_ssd3);
sevenseg s4(data[19:16],out_ssd4);
sevenseg s5(data[23:20],out_ssd5);
sevenseg s6(data[27:24],out_ssd6);
sevenseg s7(data[31:28],out_ssd7);

assign HEX0 = out_ssd;
assign HEX1 = out_ssd1;
assign HEX2 = out_ssd2;
assign HEX3 = out_ssd3;
assign HEX4 = out_ssd4;
assign HEX5 = out_ssd5;
assign HEX6 = out_ssd6;
assign HEX7 = out_ssd7;

endmodule