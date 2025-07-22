module fsm1s(
	input clk,
	input reset,
	input in,
	output out
);
	// simple Moore machine with sync reset - a TFF
	parameter A=1'b0, B=1'b1;
	reg state, next;

	// combinational block for state transition logic
	always @(*) begin
		case (state)
		A : next = in ? A : B;
		B : next = in ? B : A;
		endcase
	end

	// sequential block for state flip-flops
	always @(posedge clk) begin
		if (reset)
			state <= B;
		else
			state <= next;
	end

	// output logic
	assign out = (state == B);

endmodule
