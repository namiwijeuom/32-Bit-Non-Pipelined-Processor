// A simple Arithmetic and Logical Unit
module ALU(
    input logic [31:0] operand1,operand2,
	 input logic [4:0] shamt,
    input logic [3:0] alucontrol,
    output logic [31:0] result,
    output logic zero
);

    always_comb begin
        case (alucontrol)
            4'b0000: result = operand1 & operand2; // AND
            4'b0001: result = operand1 | operand2; // OR
            4'b0010: result = operand1 + operand2; // ADD
				4'b0011: result = (operand2<<shamt); //SLL
				4'b0100: result = operand1 +(~ operand2); //
            4'b0101: result = operand1 |(~ operand2); //
				4'b0110: result = operand1 - operand2; // SUB
            4'b0111: result = (operand1 < operand2) ? 32'b1 : 32'b0; // SLT
				//4'b1001: result = ~(operand1 | operand2); // NOR
				4'b1000: result = (operand2<<16); //LUI
				4'b1001: result = operand1 ^ operand2; //XOR
				4'b1010: begin     //BLEZ
						if((operand1[31]==1)|(operand1==0))
                        result=0 ;
						else
                        result=1;
						end
	              	  
				4'b1011: result = ( operand2 >> (operand1[4:0]) ); //SLRV
				4'b1100: result = (operand2>>shamt) ;
				
            default: result = 32'b0; // Unknown or no operation
        endcase

        // Check if the result is zero
        zero = (result == 32'b0);
    end

endmodule
