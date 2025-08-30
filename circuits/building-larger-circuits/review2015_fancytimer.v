module review2015_fancytimer (
	input clk,
	input reset,	// sync reset
	input data,
	input ack,
	output [3:0] count,
	output counting,
	output done
);
	// complex timer, combines hardware from review2015_fsm/count1k/shiftcount plus additional logic
	// timer starts when data input sequence 1101 is detected
	// then next 4 bits in data input determine delay
	// then timer waits for counters to finish counting
	// then timer notifies user, waits for acknowledgement to reset
	
	// logic from FSM
	parameter IDLE=4'd0, D1=4'd1, D11=4'd2, D110=4'd3, DELAY1=4'd4, DELAY2=4'd5, DELAY3=4'd6, DELAY4=4'd7, COUNTING=4'd8, DONE=4'd9;
	reg [3:0] state, next;
	wire delay_ena;

	// sequential flipflop logic
	always @(posedge clk)
		state <= reset ? IDLE : next;
	
	// combinational state transition logic, with modifications to integrate with other modules
	always @(*) begin
		case (state)
			IDLE: next = data ? D1 : IDLE; // scan data input stream
			D1: next = data ? D11 : IDLE; // received data = 1, is next data = 1?
			D11: next = data ? D11 : D110; // received data = 11, is next data = 0?
			D110: next = data ? DELAY1 : IDLE; // received data = 110, is next data = 1?
			DELAY1: next = DELAY2; // received data = 1101, assert delay_ena
			DELAY2: next = DELAY3;
			DELAY3: next = DELAY4;
			DELAY4: next = COUNTING;
			COUNTING: next = (delay == 4'd0 && count1000 == 10'd999) ? DONE : COUNTING;
			DONE: next = ack ? IDLE : DONE;
			default: next = IDLE;
		endcase
	end
	
	// combinational output logic
	assign delay_ena = (state == DELAY1) | (state == DELAY2) | (state == DELAY3) | (state == DELAY4);
	assign counting = (state == COUNTING);
	assign done = (state == DONE);
	
	// logic from shiftcount, with modifications to determine delay
	reg [3:0] delay;
	
	always @(posedge clk) begin
		if (delay_ena)
			delay <= {delay[2:0], data};
		else if (counting && count1000 == 10'd999)
			delay <= delay - 1'b1;
		else
			delay <= delay;
	end
	
	assign count = delay;
	
	// logic from count1k, with modifications
	reg [9:0] count1000;
    
	always @(posedge clk) begin
		if (reset) 
			count1000 <= 10'd0;
		else if (count1000 == 10'd999) 
			count1000 <= 10'd0;
		else if (counting)
			count1000 <= count1000 + 10'd1;
	end
	
endmodule
