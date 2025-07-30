module fsm_ps2data(
	input clk,
	input [7:0] in,
	input reset,
	output reg [23:0] out_bytes,
	output done
);
	// building on fsm_ps2 by adding a datapath that outputs 3 byte message when packet is received
	
	// FSM from fsm_ps2
	parameter BYTE1=2'b00, BYTE2=2'b01, BYTE3=2'b10, DONE=2'b11;
   reg [1:0] state, next;

	always @(*) begin
		case (state)
			BYTE1: next = in[3] ? BYTE2 : BYTE1;
			BYTE2: next = BYTE3;
			BYTE3: next = DONE;
			DONE: next = in[3] ? BYTE2 : BYTE1;
		endcase
	end

	always @(posedge clk) begin
		if (reset)
			state <= BYTE1;
		else
			state <= next;
	end
	 
	assign done = (state == DONE);
	
	// datapath to store incoming bytes
	// assume that input stream is valid contiuously
	// i.e. after 3 byte message and state == DONE, record first byte of next message
	always @(posedge clk) begin
		if (reset)
			out_bytes <= 0;
		else begin
			case (state)
				BYTE1: out_bytes[23:16] <= in;
				BYTE2: out_bytes[15:8] <= in;
				BYTE3: out_bytes[7:0] <= in;
				DONE: out_bytes[23:16] <= in;
			endcase
		end
	end

endmodule

	