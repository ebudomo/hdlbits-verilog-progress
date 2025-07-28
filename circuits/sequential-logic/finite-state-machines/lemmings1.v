module lemmings1(
	input clk,
	input areset,
	input bump_left,
	input bump_right,
	output walk_left,
	output walk_right
);
	// Moore FSM modelling a simple game of Lemmings with async reset
	// lemmings walk either left or right until they bump into something, then switch directions
	
	parameter LEFT=1'b0, RIGHT=1'b1;
	reg state, next;
	
	// combinational block for state transition logic
	always @(*) begin
		case (state)
			LEFT : next = bump_left ? RIGHT : LEFT;
			RIGHT : next = bump_right ? LEFT : RIGHT;
		endcase
	end
	
	// sequential block for state DFFs
	always @(posedge clk, posedge areset) begin
		if (areset)
			state <= LEFT; // lemmings walk left by default
		else
			state <= next;
	end
	
	// combinational output logic
	assign walk_left = (state == LEFT);
	assign walk_right = (state == RIGHT);
	
endmodule
