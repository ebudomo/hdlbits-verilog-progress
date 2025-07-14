module conditional(
	input [7:0] a, b, c, d,
	output [7:0] min
);
	// using ternary operators to find minimum of four unsigned numbers
	wire [7:0] min_ab, min_abc;
	assign min_ab = (a < b) ? a : b;
	assign min_abc = (min_ab < c) ? min_ab : c;
	assign min = (min_abc < d) ? min_abc : d;

endmodule
