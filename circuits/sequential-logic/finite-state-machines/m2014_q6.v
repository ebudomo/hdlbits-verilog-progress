module m2014_q6 (
	input clk,
	input reset,
	input w,
	output z
);
	// given a state diagram, implement the state machine
	parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4, F=3'd5;
	reg [2:0] state, next;
	
	// sequential state flipflop
	always @(posedge clk)
		state <= reset ? A : next;
	
	// combinational state transition logic
	always @(*) begin
		case (state)
			A: next = w ? A : B;
			B: next = w ? D : C;
			C: next = w ? D : E;
			D: next = w ? A : F;
			E: next = w ? D : E;
			F: next = w ? D : C;
			default: next = A;
		endcase
	end
	
	// combinational output logic
	assign z = (state == E || state == F);

endmodule
