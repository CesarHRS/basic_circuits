// Rising edge sensible flipflop with synchronous reset
module DFlipFlop (
    input reset,
    input clk,
    input D,
    output Q,
    output Qn
);

reg r;

always @(posedge clk) begin
    if (reset)
        r <= 1'b0;
    else
        r <= D;
end

assign Q = r;
assign Qn = ~r;

endmodule
