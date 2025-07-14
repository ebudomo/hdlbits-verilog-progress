module popcount3(
	input [2:0] in,
	output reg [1:0] out
);
	// count the number of ones in the input vector
	integer i;
	always @(*) begin
		out = 0;
		for (i = 0; i < 3; i = i + 1)
			out = out + in[i];
	end
	
	// HDLBits solution does not use out as a reg
	// loop version above is scalable for larger vectors
	// a simple solution for this problem is:
	// assign out = in[0]+in[1]+in[2];
	// other solutions include:
	// using 8-entry truth table, use SOP for out[0] and out[1]
	// using combinational always block, directly implement truth table

endmodule
