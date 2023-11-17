module binary_counter (
  input wire clk,        // Clock signal
  input wire reset,      // Reset signal
  output reg [3:0] count  // 4-bit counter output
);

  always @(posedge clk or posedge reset) begin

    if (reset) begin
      count <= 4'b0000;
    end
	 
    else begin
      count <= count + 1;
    end
  end

endmodule
