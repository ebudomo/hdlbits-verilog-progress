module ece241_2012_q2b (
	input [5:0] y,
	input w,
	output Y1,
	output Y3
);
	// assuming one-hot encoding for given state diagram, derive logic expressions for Y1 and Y3, inputs of state FF y[1] and y[3], respectively
	reg [5:0] next;
	
	// combinational next-state logic for all states
	always @(*) begin
		next[0] = w ? 1'b0 : y[0] | y[3];
		next[1] = w ? y[0] : 1'b0;
		next[2] = w ? y[1] | y[5] : 1'b0;
		next[3] = w ? 1'b0 : y[1] | y[2] | y[4] | y[5];
		next[4] = w ? y[2] | y[4] : 1'b0;
		next[5] = w ? y[3] : 1'b0;
	end
	
	// what we actually want
	assign Y1 = next[1];
	assign Y3 = next[3];

endmodule
