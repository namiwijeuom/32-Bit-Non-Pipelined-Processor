module Testbench_InstructionMemory2;

    // Define the signals
    logic [5:0] a;
    logic [31:0] readdata;

    // Instantiate the InstructionMemory2 module
    InsructionMemory2 uut (
        .a(a),
        .readdata(readdata)
    );

    // Initialize signals
    initial begin
        a = 6'h000000; // Initialize address to 0
        #10; // Wait a few simulation cycles

        // Read data from memory
        $display("Read data at address %h: %h", a, readdata);

        // Change the address and read data again
        a = 6'h000001; // Change address to 1
        #10; // Wait a few simulation cycles

        // Read data from memory again
        $display("Read data at address %h: %h", a, readdata);

        // You can continue changing the address and reading data as needed

        $finish;
    end

endmodule
