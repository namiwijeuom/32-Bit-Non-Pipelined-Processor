module Top_MIPS_IO
(
    input logic clk,
    input logic reset,
    input logic clkEnable,
	 
    output logic [6:0] led_segment_0,
	 output logic [6:0] led_segment_1,
	 output logic [6:0] led_segment_2,
	 output logic [6:0] led_segment_3,
	 output logic [6:0] led_segment_4,
	 output logic [6:0] led_segment_5,
	 output logic [6:0] led_segment_6,
	 output logic [6:0] led_segment_7,
	 
    output logic memwrite,
    output logic slow_clk
);

    logic [31:0] writedata;
    logic [31:0] dataadr;

    SlowClock slowClock(clk, clkEnable, slow_clk);

    TopMIPS mips
		(
			slow_clk, 
			reset, 
			writedata, 
			dataadr, 
			memwrite
		);

//    SevenSegmentTop sevenSegmentTop(
//        .clk(clk),
//        .displayed_number(displayed_number),
//        .led_segment(led_segment),
//        .anode_activate(anode_activate),
//        .dp(dp));
		SevenSegmentFinal ssI1(.in_bcd(writedata[3:0]),.out_ssd(led_segment_0));
		SevenSegmentFinal ssI2(.in_bcd(writedata[7:4]),.out_ssd(led_segment_1));
		SevenSegmentFinal ssI3(.in_bcd(writedata[11:8]),.out_ssd(led_segment_2));
		SevenSegmentFinal ssI4(.in_bcd(writedata[15:12]),.out_ssd(led_segment_3));
		SevenSegmentFinal ssI5(.in_bcd(writedata[19:16]),.out_ssd(led_segment_4));
		SevenSegmentFinal ssI6(.in_bcd(writedata[23:20]),.out_ssd(led_segment_5));
		SevenSegmentFinal ssI7(.in_bcd(writedata[27:24]),.out_ssd(led_segment_6));
		SevenSegmentFinal ssI8(.in_bcd(writedata[31:28]),.out_ssd(led_segment_7));

//    always_comb begin
//        case (btns)
//            0: displayedReg <= instr;
//            1: displayedReg <= aluout;
//            2: displayedReg <= rd2;
//            default: displayedReg <= 0;
//        endcase
//        case (selector)
//            0: displayed_number <= displayedReg[15:0];
//            1: displayed_number <= displayedReg[31:16];
//        endcase
//    end

endmodule