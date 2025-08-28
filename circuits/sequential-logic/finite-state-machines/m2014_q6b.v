module m2014_q6b(
	input [3:1] y,
	input w,
	output Y2
);
	// given a state machine diagram, implement the next-state logic for y[2]
	parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4, F=3'd5;
	reg out;
	
	always @(*) begin
		case (y)
			A: out = 0;
			B: out = 1;
			C: out = w;
			D: out = 0;
			E: out = w;
			F: out = 1;
			default: out = 0;
		endcase
	end
	
	assign Y2 = out;
	
endmodule
