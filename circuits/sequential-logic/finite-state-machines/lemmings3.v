module lemmings3(
	input clk,
	input areset,
	input bump_left,
	input bump_right,
	input ground,
	input dig,
	output walk_left,
	output walk_right,
	output aaah,
	output digging
);
	// Moore FSM for lemmings that can fall, dig, or walk with async reset
	// falling has precedence over digging which has precedence over walking
	parameter LEFT=3'b000, RIGHT=3'b001, FALL_L=3'b010, FALL_R=3'b011, DIG_L=3'b100, DIG_R=3'b101;
   reg [2:0] state, next;
	 
	always @(*) begin
		case (state)
			FALL_L: next = ground ? LEFT : FALL_L;
			FALL_R: next = ground ? RIGHT : FALL_R;
			DIG_L: next = ground ? DIG_L : FALL_L;
			DIG_R: next = ground ? DIG_R : FALL_R;
			LEFT: next = ground ? (dig ? DIG_L : (bump_left ? RIGHT : LEFT)) : FALL_L;
			RIGHT: next = ground ? (dig ? DIG_R : (bump_right ? LEFT : RIGHT)) : FALL_R;
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
   assign digging = (state == DIG_L | state == DIG_R);
	
endmodule
