module gatesv(
	input [3:0] in,
	output [2:0] out_both,
	output [3:1] out_any,
	output [3:0] out_different
);
	// implement circuit that checks relationship between each
	// input bit and their neighbour
	// recall reduction to do bitwise operations for vectors!
	
	// this ANDs in[2] and in[3], in[1] and in[2], ...
	assign out_both = in[2:0] & in[3:1];
	
	// this ORs in[3] and in[2], in[2] and in[1], ...
	assign out_any = in[3:1] | in[2:0];
	
	// this XORs in with in rotated 1 bit to the right
	// rotation is accomplished using concatentation
	// i.e. putting i[0] in MSB
	assign out_different = in ^ {in[0], in[3:1]};
	
	
endmodule
