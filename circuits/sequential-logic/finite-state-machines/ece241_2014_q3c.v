module ece241_2014_q3c (
	input clk,
	input [2:0] y,
	input x,
	output Y0,
	output z
);
	// given state-assigned table (same as q3bfsm), implement logic functions Y[0] and z
	parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4;
	reg [2:0] Y;
	 
	always @(*) begin
		case (y)
			A: Y = x ? B : A;
			B: Y = x ? E : B;
			C: Y = x ? B : C;
			D: Y = x ? C : B;
			E: Y = x ? E : D;
			default: Y = A;
		endcase
	end
	 
	assign z = (y == D || y == E);
	assign Y0 = Y[0];

endmodule
