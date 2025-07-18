module exams_2012_q1g(
	input [4:1] x,
	output f
);
	// given a kmap implement the function
	assign f = (~x[2] & ~x[4]) | (~x[1] & x[3]) | (x[2] & x[3] & x[4]);

endmodule
