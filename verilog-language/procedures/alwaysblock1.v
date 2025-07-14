module alwaysblock1(
	input a,
	input b,
	output wire out_assign,
	output reg out_alwaysblock
);
	// building AND gate using both assign and always block
	assign out_assign = a & b;
	always @(*) out_alwaysblock = a & b;

endmodule
