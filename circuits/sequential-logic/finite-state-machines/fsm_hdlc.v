module fsm_hdlc(
	input clk,
	input reset,
	input in,
	output disc,
	output flag,
	output err
);
	// synchronous HDLC framing with discard, flag, and error signals
	parameter NONE=4'd0, ONE=4'd1, TWO=4'd2, THREE=4'd3, FOUR=4'd4, FIVE=4'd5, SIX=4'd6, ERROR=4'd7, DISCARD=4'd8, FLAG=4'd9;
	reg [3:0] state, next;
	 
	// state transition logic
	always @(*) begin
		case (state)
			NONE : next = in ? ONE : NONE;
			ONE : next = in ? TWO : NONE;
			TWO : next = in ? THREE : NONE;
			THREE : next = in ? FOUR : NONE;
			FOUR : next = in ? FIVE : NONE;
			FIVE : next = in ? SIX : DISCARD;
			SIX : next = in ? ERROR : FLAG;
			DISCARD : next = in ? ONE : NONE;
			FLAG : next = in ? ONE : NONE;
			ERROR : next = in ? ERROR : NONE;
			default : next = NONE;
		endcase
	end
	 
	 // transition flip-flops
	always @(posedge clk) begin
		if (reset)
			state <= NONE;
		else
			state <= next;
	end
	 
	// output logic
	assign disc = (state == DISCARD);
	assign flag = (state == FLAG);
	assign err = (state == ERROR);

endmodule
