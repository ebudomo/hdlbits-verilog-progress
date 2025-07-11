module vector3(
	input [4:0] a, b, c, d, e, f,
	output [7:0] w, x, y, z
);
	//concatenating 30 bits of inputs to 32 bits of output
	assign {w, x, y, z} = {a, b, c, d, e, f, 2'b11};

endmodule 