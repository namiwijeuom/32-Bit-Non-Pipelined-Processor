//We generate a clock signal (clk) and apply it to the DataMemory module.
//We write data into specific memory locations, read data from memory, and display the results using $display.

module Testbench_DataMemory;

    logic clk;
    logic [31:0] address;
    logic [31:0] write_data;
    logic write_enable;
    logic [31:0] read_data;

    // Instantiate the DataMemory module
    DataMemory DM (
        .clk(clk),
        .address(address),
        .write_data(write_data),
        .write_enable(write_enable),
        .read_data(read_data)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        clk = 0;

        // Write data into memory locations
        write_enable = 1;
        address = 8'h00;
        write_data = 32'h12345678;
        #10;
        
        // Read data from memory
        address = 8'h00;
        write_enable = 0;
        #10;
        $display("Read Data 1 = %h", read_data);
        
        // Change address and read again
        address = 8'h04;
        #10;
        $display("Read Data 2 = %h", read_data);

        // Finish the simulation
        $finish;
    end

endmodule
