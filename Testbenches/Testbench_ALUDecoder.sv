module Testbench_ALUDecoder;
    reg [5:0] funct;         // Input: Function code
    reg [1:0] aluop;         // Input: ALU operation code
    wire [2:0] alucontrol;   // Output: ALU control signals

    // Instantiate the ALU decoder module
    ALUDecoder uut (
        .funct(funct),
        .aluop(aluop),
        .alucontrol(alucontrol)
    );

    // Initial stimulus
    initial begin
        // Test 1: R-type instruction (add)
        funct = 6'b100000;
        aluop = 2'b00;
        $display("Test 1: ALU Control = %b", alucontrol);
        
        // Test 2: R-type instruction (sub)
        funct = 6'b100010;
        aluop = 2'b00;
        $display("Test 2: ALU Control = %b", alucontrol);
        
        // Test 3: I-type instruction (addi)
        funct = 6'bxxxxxx; // Not used for I-type
        aluop = 2'b00;
        $display("Test 3: ALU Control = %b", alucontrol);
        
        // Test 4: Branch instruction (beq)
        funct = 6'bxxxxxx; // Not used for branches
        aluop = 2'b01;
        $display("Test 4: ALU Control = %b", alucontrol);
        
        // Add more tests as needed
        
        // Stop simulation
        $stop;
    end

endmodule
