module review2015_fsmshift (
	input clk,
	input reset, 	// sync reset
	output shift_ena
);
	// when reset high, assert shift_ena for 4 clock cycles, then 0 until reset
	parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4;
	reg [2:0] state, next;
	
	// combinational state transition logic
	always @(*) begin
		case (state)
			A: next = B;
			B: next = C;
			C: next = D;
			D: next = E;
			E: next = E; // after 4 states, stay in E until reset
			default: next = A;
		endcase
	end

	// sequential flipflop logic
	always @(posedge clk)
		state <= reset ? A : next;

	// combinational output logic
	assign shift_ena = state != E;

endmodule
