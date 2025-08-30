module review2015_fsmseq (
	input clk,
	input reset, // sync reset
	input data,
	output start_shifting
);
	// Moore FSM: when sequence 1101 is detected, set start_shifting = 1 until reset
	parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4;
	reg [2:0] state, next;
	
	// state transition logic
	always @(*) begin
		case (state)
			A: next = data ? B : A; // monitor data
			B: next = data ? C : A; // received data = 1, is next data = 1?
			C: next = data ? C : D; // received data = 11, is next data = 0?
			D: next = data ? E : A; // received data = 110, is next data = 1?
			E: next = E;				// received data = 1101
			default: next = A;
		endcase
	end
	
	always @(posedge clk)
		state <= reset ? A : next;
		
	assign start_shifting = state == E;

endmodule
