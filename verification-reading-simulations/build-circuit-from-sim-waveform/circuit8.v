module circuit8 (
	input clock,
	input a,
	output reg p,
	output reg q
);
	// sequential circuit
	// when clock is high, p = a. when clock is low, q = p.
	always @(*) begin
		p = clock ? a : p;
		q = ~clock  ? p : q;
   end
	
endmodule
