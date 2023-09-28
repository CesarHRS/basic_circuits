`include "decoder_4x16.v"

module decoder_16x64 (
    input [15:0] decoder_in,
    output reg [63:0] decoder_out
);

wire [15:0] decoder_in_0, decoder_in_1, decoder_in_2, decoder_in_3;
wire [15:0] decoder_out_0, decoder_out_1, decoder_out_2, decoder_out_3;

assign decoder_in_0 = decoder_in[3:0];
assign decoder_in_1 = decoder_in[7:4];
assign decoder_in_2 = decoder_in[11:8];
assign decoder_in_3 = decoder_in[15:12];

decoder_4x16 decoder_0 (.decoder_in(decoder_in_0), .decoder_out(decoder_out_0));
decoder_4x16 decoder_1 (.decoder_in(decoder_in_1), .decoder_out(decoder_out_1));
decoder_4x16 decoder_2 (.decoder_in(decoder_in_2), .decoder_out(decoder_out_2));
decoder_4x16 decoder_3 (.decoder_in(decoder_in_3), .decoder_out(decoder_out_3));

assign decoder_out = {decoder_out_3, decoder_out_2, decoder_out_1, decoder_out_0};

endmodule