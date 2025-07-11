//force explicit declaration of every net
`default_nettype none

//modelling (a & b) | (c & d), outputting the result and the negation
//demonstrating use of wires
module wire_decl(
	input a,
	input b,
	input c,
	input d,
	output out,
	output out_n
);

	wire and_1, and_2;
	assign and_1 = a & b;
	assign and_2 = c & d;
	assign out = and_1 | and_2;
	assign out_n = ~out;
	
endmodule 