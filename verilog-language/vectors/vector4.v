module vector4(
	input [7:0] in,
	output [31:0] out 
);
	//using replication operator to sign-extend
	assign out = {{24{in[7]}}, in};

endmodule 