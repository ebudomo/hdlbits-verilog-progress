module fsm_serial(
	input clk,
	input in,
	input reset,
	output done
);
	// delimit bytes from a stream of bits -- synchronous reset, idle at logic 1
	// identify start bit, wait for all 8 data bits, then verify stop bit
	// if stop bit not present when expected, wait for next stop bit before reading next byte
	parameter START = 3'b000, STOP = 3'b001, DATA = 3'b010, IDLE = 3'b011, ERROR = 3'b100;
	reg [2:0] state, next;
	reg [3:0] count;
	
	// combinational block for state transition logic
	always @(*) begin
		case (state)
			IDLE : next = in ? IDLE : START;
			START : next = DATA;
			DATA : next = (count == 8) ? (in ? STOP : ERROR) : DATA;
			STOP : next = in ? IDLE : START;
			ERROR : next = in ? IDLE : ERROR;
			default : next = IDLE;
		endcase
	end
	
	// sequential block for state flipflops
	always @(posedge clk) begin
		if (reset)
			state <= IDLE;
		else
			state <= next;
	end
	
	// only count when receiving data bits
	always @(posedge clk) begin
		if (reset)
			count <= 0;
		else begin
			case (next)
				START : count <= 0;
				DATA : count <= count + 1;
				default : count <= count;
			endcase
		end
	end
	
	// output logic
	assign done = (state == STOP);
	
endmodule
	