// Rising edge sensible flipflop with synchronous reset
module JKFlipFlop (
	input reset,
	input clk,
	input J, 
	input K,
	output Q,
	output Qn
	);
	
reg r;

 always @(posedge clk) begin 

 if (reset) 
  r <= 1'b0;
 else
 
  case({J,K})
	2'b00:  r <= r;
	2'b01:  r <= 0;
	2'b10:  r <= 1;
	2'b11:  r <=~r;
  endcase
  
 end
 
 assign Q = r;
 assign Qn = ~r;
  
endmodule