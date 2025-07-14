module gates(
	input a, b,
	output out_and,
	output out_or,
   output out_xor,
   output out_nand,
   output out_nor,
   output out_xnor,
   output out_anotb
);
	// implement several two input gates
	assign out_and = a & b;
   assign out_or = a | b;
   assign out_xor = a ^ b;
   assign out_nand = ~(a & b);
   assign out_nor = ~(a | b);
   assign out_xnor = ~(a ^ b);
   assign out_anotb = a & ~b;

endmodule
