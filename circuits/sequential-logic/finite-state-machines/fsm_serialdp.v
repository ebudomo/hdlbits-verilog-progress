module fsm_serialdp(
	input clk,
	input in,
	input reset,
	output [7:0] out_byte,
	output done
);
	// serial receiver with odd parity
	// similar to fsm_serial, after START there will be 8 DATA bits and 1 PARITY bit
	// uses module "parity" to calculate parity of input stream
	parameter START = 3'b000, STOP = 3'b001, DATA = 3'b010, IDLE = 3'b011, ERROR = 3'b100, PARITY = 3'b101;
	reg [2:0] state, next;
	reg [3:0] count;
	reg [7:0] read;
	
	// FSM
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
	
	always @(posedge clk) begin
		if (reset)
			state <= IDLE;
		else
			state <= next;
	end
	
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
	
	assign done = (state == STOP);
	
	// datapath for out_byte, requires register since out_byte is a signal
	// when in DATA state, shift current in bit into register
	always @(posedge clk) begin
		if (reset)
			read <= 0;
		else begin
			case (next)
				START : read <= 0;
				DATA : read <= {in, read[7:1]};
				default : read <= read;
			endcase
		end
	end
	
	// assert read data to output_byte when in STOP state
	always @(posedge clk) begin
		if (reset)
			out_byte <= 0;
		else begin
			case (next)
				STOP : out_byte <= read;
				default : out_byte <= 0;
			endcase
		end
	end
	
endmodule
