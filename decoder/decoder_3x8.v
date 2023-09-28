
module decoder_3x8(
	input [2:0] decoder_in,
	output reg [7:0] decoder_out
);

always @(decoder_in) 
begin	
	case(decoder_in)
		3'b000 : decoder_out = 8'b00000001;
		3'b001 : decoder_out = 8'b00000010;
		3'b010 : decoder_out = 8'b00000100;
		3'b011 : decoder_out = 8'b00001000;
		3'b100 : decoder_out = 8'b00010000;
		3'b101 : decoder_out = 8'b00100000;
		3'b110 : decoder_out = 8'b01000000;
		3'b111 : decoder_out = 8'b10000000;
	endcase
end	

endmodule
		




