module ece241_2014_q5b(
	input clk,
	input areset,
	input x,
	output reg z
);
	// Mealy FSM of serial 2's complementer with async reset using one-hot encoding
	parameter A = 2'b01, B = 2'b10;
	reg [1:0] state, next;
	
	// combinational state transition logic
	always @(*) begin
		case (state)
			A : next = x ? B : A;
			B : next = B;
			default : next = A;
		endcase
	end
	
	// sequential flipflop
	always @(posedge clk, posedge areset) begin
		state <= areset ? A : next;
	end
	
	// combinational output logic
	always @(*) begin
		if (areset)
			z = x;
		else begin
			case (state)
				A : z = x;
				B : z = !x;
				default : z = x;
			endcase
		end
	end
	
endmodule
