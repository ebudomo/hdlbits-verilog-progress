module ece241_2014_q5a(
	input clk,
	input areset,
	input x,
	output reg z
);
	// Moore FSM: one-input one-output serial 2's complementer and async reset
	// accepts input of arbitrary length
	// conversion begins when areset low, stops when areset high
	parameter A = 2'b00, B = 2'b01, C = 2'b10;
	reg [1:0] state, next;
	
	// combinational state transition logic
	always @(*) begin
		case (state)
			A : next = x ? B : A;
			B : next = C;
			C : next = C;
			default : next = A;
		endcase
	end
	
	// sequential flipflop
	always @(posedge clk, posedge areset) begin
		state <= areset ? A : next;
	end
	
	// sequential output logic
	// 2's complement: invert input bits and add 1
	// A: output 0 until input is 1 -> accounts for +1 and carry during output conversion
	// B: first bit after string of output 0's is always 1
	// C: simply invert input bits
	always @(posedge clk, posedge areset) begin
		if (areset)
			z <= 1'b0;
		else begin
			case (next)
				A : z <= 1'b0;
				B : z <= 1'b1;
				C : z <= ~x;
			endcase
		end
	end
	
endmodule
	