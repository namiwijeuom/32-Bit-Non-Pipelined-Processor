//clk is the clock signal.
//address is the 32-bit address specifying the memory location to read from or write to.
//write_data is the 32-bit data to be written into the memory.
//write_enable is a control signal that enables or disables the write operation.
//read_data is the 32-bit output that provides the data read from the specified memory location.


module DataMemory(
    input logic clk,write_enable,
    input logic [31:0] address,write_data,
    output logic [31:0] read_data
);

    logic [31:0]  ram [63:0]; 
	 
    // Read data from memory
    assign read_data = ram[address[31:2]];

    // Write data to memory
    always_ff @(posedge clk)
    begin
        if (write_enable)
            ram[address[31:2]] <= write_data;
    end

endmodule
