module m2014_q3(
	input [4:1] x,
	output f
);
	// given a kmap, implement the function
	assign f = (!x[1] & x[3]) | (x[2] & x[4]);
	
endmodule
