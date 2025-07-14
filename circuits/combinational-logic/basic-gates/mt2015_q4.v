module mt2015_q4(
	input x, 
	input y,
	output z
);
	// based on submodules use in mt2015_q4a and mt2015_q4b
	// a given top-level design must be realized using the above submodules
	wire a1_out;
	mt2015_q4a ia1(.x(x), .y(y), .z(a1_out));
	
	wire b1_out;
	mt2015_q4b ib1(.x(x), .y(y), .z(b1_out));
	
	wire a1_or_b1;
	assign a1_or_b1 = a1_out | b1_out;
	
	wire a2_out;
	mt2015_q4a ia2(.x(x), .y(y), .z(a2_out));
	
	wire b2_out;
	mt2015_q4b ib2(.x(x), .y(y), .z(b2_out));
	
	wire a2_and_b2;
	assign a2_and_b2 = a2_out & b2_out;
	
	assign z = a1_or_b1 ^ a2_and_b2;
	
	/*
	// solution is much easier to read, take note
	// HDLBits calls submodules A and B
	// 4 wire that carries outputs from submodules
	wire o1, o2, o3, o4;
	
	// output of wires is assigned automaticlaly when submodules instantiated
	A ia1 (x, y, o1);
	B ib1 (x, y, o2);
	A ia2 (x, y, o3);
	B ib2 (x, y, o4);
	
	// no need to create wires for gates, just use operators!
	assign z = (o1 | o2) ^ (o3 & o4);

	// Or you could simplify the circuit including the sub-modules:
	// assign z = x|~y;
	*/

endmodule
