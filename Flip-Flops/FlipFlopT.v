module FlipFlopT (
  input wire clk,
  input wire t,
  output reg Q,
  output reg NotQ
);

	always @(posedge clk) begin
	if (t) begin
		Q <= ~Q;
		NotQ <= Q;
   end
	else begin
		Q <= Q;
      NotQ <= NotQ;
   end
end

endmodule
