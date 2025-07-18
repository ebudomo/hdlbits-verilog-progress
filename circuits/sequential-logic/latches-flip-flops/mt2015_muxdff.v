module mt2015_muxdff(
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q
);
	// implement a DFF with a 2to1 mux at the input
	// case statement for clarity
	// since L is 1 bit, can also use ternary operator
	always @(posedge clk) begin
		case (L)
			1'b0 : Q <= q_in;
			1'b1 : Q <= r_in;
		endcase
	end

endmodule
