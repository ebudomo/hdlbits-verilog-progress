module vector5(
	input a, b, c, d, e,
	output [24:0] out 
);
	//computing all 25 pairwise one-bit XNOR comparisons
	//using replication and concatenation operators
	//comparing 5 repeats of each input to 5 repeats of concatenation of 5 inputs
	assign out = ~{{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}} ^ {5{a, b, c, d, e}};
	
endmodule 