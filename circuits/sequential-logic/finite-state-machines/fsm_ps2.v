module fsm_ps2(
	input clk,
	input [7:0] in,
	input reset,
	output done
);
	// PS/2 packet parser
	// Mealy FSM to search for PS/2 input message boundaries with sync reset
	// PS/2 msgs are three bytes long, first byte always has bit[3]=1 (testbench sends bytes)
	// signal receipt of all 3 bytes after finding start byte
	// FSM cycles immediately after third byte of each successful message
	
	parameter BYTE1=2'b00, BYTE2=2'b01, BYTE3=2'b10, DONE=2'b11;
   reg [1:0] state, next;

	// State transition logic (combinational)
	// find BYTE1, transition to BYTE2 then BYTE3 then DONE state
	// if in[3]=1 while in DONE state, then new message boundary found: go to BYTE2
	always @(*) begin
		case (state)
			BYTE1: next = in[3] ? BYTE2 : BYTE1;
			BYTE2: next = BYTE3;
			BYTE3: next = DONE;
			DONE: next = in[3] ? BYTE2 : BYTE1;
		endcase
	end

	// State flip-flops (sequential)
	always @(posedge clk) begin
		if (reset)
			state <= BYTE1;
		else
			state <= next;
	end
	 
	// Output logic
	assign done = (state == DONE);

endmodule
