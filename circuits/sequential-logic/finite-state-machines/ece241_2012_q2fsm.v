module ece241_2012_q2fsm (
	input clk,
	input reset,
	input w,
	output z
);
	// given a state diagram, implement the state machine
	// note that the state diagram is identical to m2014_q6, however transition logic is inverted
	parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4, F=3'd5;
	reg [2:0] state, next;
	
	// sequential state flipflop
	always @(posedge clk)
		state <= reset ? A : next;
	
	// combinational state transition logic
	always @(*) begin
		case (state)
			A: next = w ? B : A;
			B: next = w ? C : D;
			C: next = w ? E : D;
			D: next = w ? F : A;
			E: next = w ? E : D;
			F: next = w ? C : D;
			default: next = A;
		endcase
	end
	
	// combinational output logic
	assign z = (state == E || state == F);

endmodule
