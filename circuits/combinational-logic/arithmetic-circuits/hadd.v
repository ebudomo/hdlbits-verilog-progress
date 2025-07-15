module hadd(
	input a, b,
	output cout, sum
);
	// half adder
	assign sum = a ^ b;
	assign cout = a & b;
	
endmodule
