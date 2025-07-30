module lemmings4(
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
	// Moore FSM modelling lemmings that can walk, dig, fall, and SPLAT! with async reset
	// lemmings that fall for >20 clock cycles and hit the ground are considered "dead" until reset
	parameter LEFT=3'b000, RIGHT=3'b001, FALL_L=3'b010, FALL_R=3'b011, DIG_L=3'b100, DIG_R=3'b101, SPLAT=3'b110;
	reg [2:0] state, next;
	reg [7:0] count;
	
	// combinational block for state transitions. SPLAT is permanent (until reset) 
	always @(*) begin
		case (state)
			FALL_L: next = ground ? ((count>20) ? SPLAT : LEFT) : FALL_L;
			FALL_R: next = ground ? ((count>20) ? SPLAT : RIGHT) : FALL_R;
			DIG_L: next = ground ? DIG_L : FALL_L;
			DIG_R: next = ground ? DIG_R : FALL_R;
			LEFT: next = ground ? (dig ? DIG_L : (bump_left ? RIGHT : LEFT)) : FALL_L;
			RIGHT: next = ground ? (dig ? DIG_R : (bump_right ? LEFT : RIGHT)) : FALL_R;
			SPLAT: next = SPLAT;
		endcase
	end

	// sequential block for DFFs, includes counter that increments while lemming is falling
	// counter resets when lemming is no longer falling or areset high
	always @(posedge clk, posedge areset) begin
		if (areset) begin
			state <= LEFT;
			count <= 8'h0;
		end
		else begin
			state <= next;
				if (next == FALL_L || next == FALL_R)
					count <= count + 8'h1;
				else
					count <= 8'h0;
		end
	end
	
	// combinational output logic
	assign walk_left = (state == LEFT && state != SPLAT);
	assign walk_right = (state == RIGHT && state != SPLAT);
	assign aaah = ((state == FALL_L || state == FALL_R) && state != SPLAT);
	assign digging = ((state == DIG_L || state == DIG_R) && state != SPLAT);

endmodule
