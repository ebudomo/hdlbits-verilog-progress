module ece241_2013_q2afsm (
	input clk,
	input resetn, // active-low sync reset
	input [3:1] r, // request
	output [3:1] g // grant
);
	// given an state diagram, implement the FSM
	// FSM is an arbiter circuit: allocates resources based on request and priority of devices
	parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
	reg [1:0] state, next;
	
	// combinational state transition logic
	always @(*) begin
		case (state)
			A: next = r[1] ? B : (r[2] ? C : (r[3] ? D : A));
			B: next = r[1] ? B : A;
			C: next = r[2] ? C : A;
			D: next = r[3] ? D : A;
			default: next = A;
		endcase
	end
	
	// sequential flipflop logic
	always @(posedge clk)
		state <= !resetn ? A : next;
		
	// continuous output logic
	assign g[1] = (state == B);
	assign g[2] = (state == C);
	assign g[3] = (state == D);

endmodule
