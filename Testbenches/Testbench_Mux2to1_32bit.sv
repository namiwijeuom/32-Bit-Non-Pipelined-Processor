module Testbench_Mux2to1_32bit;

    logic select;
    logic [31:0] data_0;
    logic [31:0] data_1;
    logic [31:0] output_data;

    // Instantiate the Mux2to1_32bit module
    Mux2to1_32bit my_mux (
        .select(select),
        .data_0(data_0),
        .data_1(data_1),
        .output_data(output_data)
    );

    // Test sequence
    initial begin
        // Test case 1: Select input 0
        select = 0;
        data_0 = 32'h12345678;
        data_1 = 32'h87654321;
        #10;
        $display("Select = %b, Output = %h", select, output_data);

        // Test case 2: Select input 1
        select = 1;
        data_0 = 32'hABCDEF01;
        data_1 = 32'h543210FF;
        #10;
        $display("Select = %b, Output = %h", select, output_data);

        // Finish the simulation
        $finish;
    end

endmodule
