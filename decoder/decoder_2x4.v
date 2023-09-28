
module decoder_2x4(
	input [1:0] decoder_in,
	output reg [3:0] decoder_out
);

always @(decoder_in) 
begin	
	case(decoder_in)
		2'b00 : decoder_out = 4'b0001;
		2'b01 : decoder_out = 4'b0010;
		2'b10 : decoder_out = 4'b0100;
		2'b11 : decoder_out = 4'b1000;
	endcase
end	

endmodule
		




