module full_adder_1bit(
	input a, b, 
	input carry_in,
	output carry_out, 
	output sum
);

assign{carry_out, sum} = a + b + carry_in;

endmodule
		


