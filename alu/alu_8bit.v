module alu_8bit(
         input [7:0] a,b,                  
         input [2:0] f,
         output [7:0] alu_8bit_output,
			output equal
    );
	reg[7:0] result;
	reg equal_aux;
	assign alu_8bit_output = result;
	assign equal = equal_aux;
	
   always @(f)
		begin
			case(f)
				4'b000:
					result = a + b;
				4'b001:
					result = a - b;
				4'b010: 
					result = ~a;	
				4'b011: 
					result = ~b;
				4'b100:
					result = (a & b);
				4'b101:
					result = (a | b);
				4'b110:
					result = (a ^ b);
				4'b111:
					equal_aux = (a == b);
		endcase
	end
endmodule	