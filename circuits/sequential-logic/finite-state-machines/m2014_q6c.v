module m2014_q6c(
	input [6:1] y,
	input w,
	output Y2, 
	output Y4
);
	// give a state machine diagram and assuming states are one-hot encoded,
	// determine logic expressions for next-state bits Y[2] and Y[4] by inspection
	parameter A=6'b000001, B=6'b000010, C=6'b000100, D=6'b001000, E=6'b010000, F=6'b100000;
	reg [6:1] next;
	
	// by inspection: check which arrows point to the state based on w
	always @(*) begin
		next[1] <= w ? y[1] | y[4] : 1'b0;
		next[2] <= w ? 1'b0 : y[1];
		next[3] <= w ? 1'b0 : y[2] | y[6];
		next[4] <= w ? y[2] | y[3] | y[5] | y[6] : 1'b0;
		next[5] <= w ? 1'b0 : y[3] | y[5];
		next[6] <= w ? 1'b0 : y[4];
	end
	 
	assign Y2 = next[2];
	assign Y4 = next[4];

endmodule
