//clk is the clock signal.
//read_register1 and read_register2 are the inputs specifying which registers to read.
//write_register specifies the register to write to.
//write_enable is a control signal that enables or disables the write operation.
//write_data is the data to be written into the specified register.
//read_data1 and read_data2 are the outputs that provide the data read from the specified registers.


module RegisterFile(
    input logic clk,
    input logic [4:0] read_register1,
    input logic [4:0] read_register2,
    input logic [4:0] write_register,
    input logic write_enable,
    input logic [31:0] write_data,
    output logic [31:0] read_data1,
    output logic [31:0] read_data2
);

    logic [31:0] registers [31:0];

    // Write data to registers
    always_ff @(posedge clk)
    begin
        if (write_enable)
            registers[write_register] <= write_data;
    end
	 
	 // Read data from registers
    assign read_data1 = (read_register1 != 0) ? registers[read_register1]:0 ;
    assign read_data2 = (read_register2 != 0) ? registers[read_register2]:0 ;


endmodule
