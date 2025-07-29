module lemmings2(
	input clk,
	input areset,
	input bump_left,
	input bump_right,
	input ground,
	output walk_left,
	output walk_right,
	output aaah
);
	// Moore FSM of walking lemmings that can also fall
	// check first if they are falling, then if there is ground, then if there is a bump_left
	parameter LEFT=2'b00, RIGHT=2'b01, FALL_L=2'b10, FALL_R=2'b11;
	reg [1:0] state, next;
	 
	always @(*) begin
		case (state)
			FALL_L: next = ground ? LEFT : FALL_L;
			FALL_R: next = ground ? RIGHT : FALL_R;
			LEFT: next = ground ? (bump_left ? RIGHT : LEFT) : FALL_L;
			RIGHT: next = ground ? (bump_right ? LEFT : RIGHT) : FALL_R;
		endcase
	end
	 
	always @(posedge clk, posedge areset) begin
		if (areset)
			state <= LEFT;
		else
			state <= next;
	end
	 
	assign walk_left = (state == LEFT);
	assign walk_right = (state == RIGHT);
	assign aaah = (state == FALL_L || state == FALL_R);

endmodule
