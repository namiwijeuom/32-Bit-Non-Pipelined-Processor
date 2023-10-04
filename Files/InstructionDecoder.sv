module InstructionDecoder (
    input wire [5:0] opcode,         // Opcode field of the instruction
    output wire regWrite,            // Control signal for register write
    output wire memRead,             // Control signal for memory read
    output wire memWrite,            // Control signal for memory write
    output wire [2:0] aluOp,         // Control signal for ALU operation
    output wire [1:0] aluSrc,        // Control signal for ALU source
    output wire [4:0] writeReg,      // Control signal for destination register
    output wire [1:0] memToReg,      // Control signal for memory to register
    output wire [1:0] branch,        // Control signal for branch
    output wire [1:0] jump           // Control signal for jump
);

    always @(*) begin
        // Default values
        regWrite  = 1'b0;
        memRead   = 1'b0;
        memWrite  = 1'b0;
        aluOp     = 3'b000;
        aluSrc    = 2'b00;
        writeReg  = 5'b00000;
        memToReg  = 2'b00;
        branch    = 2'b00;
        jump      = 2'b00;

        // Decode the opcode to generate control signals
        case (opcode)
            // R-Type instructions
            6'b000000: begin
                regWrite  = 1'b1;
                memRead   = 1'b0;
                memWrite  = 1'b0;
                aluOp     = 3'bxxx; // Specify the ALU operation for R-Type
                aluSrc    = 2'b00;
                writeReg  = 5'bxxxxx; // Specify the destination register
                memToReg  = 2'b00;
                branch    = 2'b00;
                jump      = 2'b00;
            end

            // Load instruction
            6'b100011: begin
                regWrite  = 1'b1;
                memRead   = 1'b1;
                memWrite  = 1'b0;
                aluOp     = 3'bxxx; // Specify the ALU operation for load
                aluSrc    = 2'b01;
                writeReg  = 5'bxxxxx; // Specify the destination register
                memToReg  = 2'b10;
                branch    = 2'b00;
                jump      = 2'b00;
            end

            // Store instruction
            6'b101011: begin
                regWrite  = 1'b0;
                memRead   = 1'b0;
                memWrite  = 1'b1;
                aluOp     = 3'bxxx; // Specify the ALU operation for store
                aluSrc    = 2'b01;
                writeReg  = 5'bxxxxx; // Specify the destination register (not used)
                memToReg  = 2'b00;
                branch    = 2'b00;
                jump      = 2'b00;
            end

            // Branch instruction
            6'b000100: begin
                regWrite  = 1'b0;
                memRead   = 1'b0;
                memWrite  = 1'b0;
                aluOp     = 3'bxxx; // Specify the ALU operation for branch
                aluSrc    = 2'b00;
                writeReg  = 5'bxxxxx; // Specify the destination register (not used)
                memToReg  = 2'b00;
                branch    = 2'b01; // Branch control signal is set
                jump      = 2'b00;
            end

            // Jump instruction
            6'b000010: begin
                regWrite  = 1'b0;
                memRead   = 1'b0;
                memWrite  = 1'b0;
                aluOp     = 3'bxxx; // Specify the ALU operation for jump
                aluSrc    = 2'b00;
                writeReg  = 5'bxxxxx; // Specify the destination register (not used)
                memToReg  = 2'b00;
                branch    = 2'b00;
                jump      = 2'b10; // Jump control signal is set
            end

            // Add more cases for other instruction types as needed

            // Default case for unsupported instructions
            default: begin
                regWrite  = 1'b0;
                memRead   = 1'b0;
                memWrite  = 1'b0;
                aluOp     = 3'b000;
                aluSrc    = 2'b00;
                writeReg  = 5'b00000;
                memToReg  = 2'b00;
                branch    = 2'b00;
                jump      = 2'b00;
            end
        endcase
    end

endmodule
