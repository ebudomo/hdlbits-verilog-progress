module truthtable1(
	input x3, 
	input x2, 
	input x1,
	output f
);
	// this exercise provides a truth table
	// using SOP, the combinational circuit below is realized
	assign f = (~x3 & x2 & ~x1) 
		| (~x3 & x2 & x1) 
		| (x3 & ~x2 & x1) 
		| (x3 & x2 & x1);
	
endmodule
