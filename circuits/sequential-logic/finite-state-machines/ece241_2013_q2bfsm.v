module ece241_2013_q2bfsm (
	input clk,
	input resetn, // active low sync reset
	input x,
	input y,
	output f,
	output g
);
	// FSM for motor control
	parameter A=4'd0, B=4'd1, C=4'd2, D=4'd3, E=4'd4, F=4'd5, G=4'd6, H=4'd7, I=4'd8;
	reg [3:0] state, next;
	
	// state transition logic
	always @(*) begin
		case (state)
			A: next = B; // reset not asserted
			B: next = C; // f = 1 for one cycle
			C: next = x ? D : C; // monitor x
			D: next = x ? D : E; // received x = 1, is next x = 0?
			E: next = x ? F : C; // received x = 10, is next x = 1?
			F: next = y ? I : G; // received x = 101, set g = 1 and monitor y
			G: next = y ? I : H; // received y = 0, is next y = 1?
			H: next = H; // y =/= 1 within 2 clock cycles, set g = 0 until reset
			I: next = I; // y = 1 within 2 clock cycles, set g = 1 until reset
			default: next =  A;
		endcase
	end
	
	// sequential flipflop logic
	always @(posedge clk)
		state <= !resetn ? A : next;
		
	// combinational output logic
	assign f = (state == B);
	assign g = (state == F) || (state == G) || (state == I);

endmodule
