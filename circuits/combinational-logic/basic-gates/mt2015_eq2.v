module mt2015_eq2(
	input [1:0] A,
	input [1:0] B,
	output z
);
	// z = 1 if A = B, otherwise z = 0
	assign z = (A == B) ? 1'b1 : 1'b0;
	
endmodule
