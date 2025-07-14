module vector100r(
	input [99:0] in,
	output reg [99:0] out
);
	// output reverse bit order of input
	// large width gates
	// using for loop in combinational always block
	integer i;
	always @(*) begin
		for (i = 0; i < 100; i = i+1)
			out[i] = in[99-i];
	end

endmodule
