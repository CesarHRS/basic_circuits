

module full_adder_4bit(
    input [3:0] a, b,
    input carry_in,
    output carry_out, 
    output [3:0] sum
);

wire carry_out_wire[3:0];
wire sum_wire[3:0];

full_adder_1bit FA0(a[0], b[0], carry_in, carry_out_wire[0], sum_wire[0]);
full_adder_1bit FA1(a[1], b[1], carry_out_wire[0], carry_out_wire[1], sum_wire[1]);
full_adder_1bit FA2(a[2], b[2], carry_out_wire[1], carry_out_wire[2], sum_wire[2]);
full_adder_1bit FA3(a[3], b[3], carry_out_wire[2], carry_out_wire[3], sum_wire[3]);

assign carry_out = carry_out_wire[3];
assign sum[0] = sum_wire[0];
assign sum[1] = sum_wire[1];
assign sum[2] = sum_wire[2];
assign sum[3] = sum_wire[3];

endmodule
