//In this SystemVerilog testbench:
//
//We generate a clock signal (clk) and apply it to the RegisterFile module.
//We write data into a specific register, read data from registers, and display the results using $display.


module Testbench_RegisterFile;

    logic clk;
    logic [4:0] read_register1;
    logic [4:0] read_register2;
    logic [4:0] write_register;
    logic write_enable;
    logic [31:0] write_data;
    logic [31:0] read_data1;
    logic [31:0] read_data2;

    // Instantiate the RegisterFile module
    RegisterFile RF (
        .clk(clk),
        .read_register1(read_register1),
        .read_register2(read_register2),
        .write_register(write_register),
        .write_enable(write_enable),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        clk = 0;

        // Write data into registers
        write_enable = 1;
        write_register = 5;
        write_data = 32'h12345678;
        #10;
        
        // Read data from registers
        read_register1 = 5;
        read_register2 = 0;
        #10;
        $display("Read Data 1 = %h", read_data1);
        
        // Change read registers and read again
        read_register1 = 2;
        read_register2 = 5;
        #10;
        $display("Read Data 1 = %h, Read Data 2 = %h", read_data1, read_data2);

        // Finish the simulation
        $finish;
    end

endmodule
