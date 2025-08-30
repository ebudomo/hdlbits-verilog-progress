module review2015_fsm (
	input clk,
	input reset,	// sync reset
	input data,
	input done_counting,
	input ack,
	output shift_ena,
	output counting,
	output done
);
	// FSM: after reset, read data input stream until sequence 1101 detected
	// then, assert shift_ena high for 4 clock cycles
	// then, assert counting high until done_counting = 1
	// then, assert done high until ack = 1
	parameter IDLE=4'd0, D1=4'd1, D11=4'd2, D110=4'd3, SHIFT1=4'd4, SHIFT2=4'd5, SHIFT3=4'd6, SHIFT4=4'd7, COUNTING=4'd8, DONE=4'd9;
	reg [3:0] state, next;

	// sequential flipflop logic
	always @(posedge clk)
		state <= reset ? IDLE : next;
	
	// combinational state transition logic
	always @(*) begin
		case (state)
			IDLE: next = data ? D1 : IDLE; // scan data input stream
			D1: next = data ? D11 : IDLE; // received data = 1, is next data = 1?
			D11: next = data ? D11 : D110; // received data = 11, is next data = 0?
			D110: next = data ? SHIFT1 : IDLE; // received data = 110, is next data = 1?
			SHIFT1: next = SHIFT2; // received data = 1101, assert shift_ena
			SHIFT2: next = SHIFT3;
			SHIFT3: next = SHIFT4;
			SHIFT4: next = COUNTING;
			COUNTING: next = done_counting ? DONE : COUNTING;
			DONE: next = ack ? IDLE : DONE;
			default: next = IDLE;
		endcase
	end
	
	// combinational output logic
	assign shift_ena = (state == SHIFT1) | (state == SHIFT2) | (state == SHIFT3) | (state == SHIFT4);
	assign counting = (state == COUNTING);
	assign done = (state == DONE);
 
endmodule
