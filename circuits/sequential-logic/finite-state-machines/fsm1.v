module fsm1(
	input clk,
	input areset,
	input in,
	output out
);
	// simple Moore machine with async reset
	parameter A=1'b0, B=1'b1;
	reg state, next;
	
	// combinational block for state transition logic
	always @(*) begin
		case (state)
			A : next = in ? A : B;
			B : next = in ? B : B;
		endcase
	end
	
	// sequential block for state flip-flops
	always @(posedge clk, posedge areset) begin
		if (areset)
			state <= B;
		else
			state <= next;
	end

	// output logic
	assign out = (state == B);
	
endmodule
