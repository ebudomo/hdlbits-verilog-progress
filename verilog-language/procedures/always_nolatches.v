module always_nolatches(
	input [15:0] scancode,
	output reg left,
	output reg down,
	output reg right,
	output reg up  
); 
	// processing scancodes from PS/2 keyboard
	// last two bytes of scancodes correspond to arrow keys
	// arrow keys are declared as variables since they must always
	// have a value inside procedural block
	// scancode is read as 16 bits in hex, overrides initial assignment
	// default case unnecessary
	always @(*) begin
		left = 1'b0;
		down = 1'b0;
		right = 1'b0;
		up = 1'b0;
		case ( scancode )
			16'he06b : left = 1'b1;
			16'he072 : down = 1'b1;
			16'he074 : right = 1'b1;
			16'he075 : up = 1'b1;
		endcase
	end

endmodule
