module mux256to1v(
	input [1023:1] in,
	input [7:0] sel,
	output [3:0] out
);
	// 4 bit wide 256to1 mux
	// can use sel as variable index, but must pay attention
	// to start and end indices since output is 4 bits
	// done using variable part-select operators
	
	// index starts at sel*4 and goes up for 4 wide
	assign out = in[(sel*4)+:4];

endmodule
