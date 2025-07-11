module chip_7458(
	input p1a,
	input p1b,
	input p1c,
	input p1d,
	input p1e,
	input p1f,
	input p2a,
	input p2b,
	input p2c,
	input p2d,
	output p1y,
	output p2y
);

	wire w1, w2, w3, w4;
	
	assign w1 = p2a & p2b;
	assign w2 = p2c & p2d;
	assign p2y = w1 | w2;
	
	assign w3 = p1a & p1b & p1c;
	assign w4 = p1d & p1e & p1f;
	assign p1y = w3 | w4;
	
endmodule 