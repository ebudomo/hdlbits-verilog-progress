module fsm_serialdp(
	input clk,
	input in,
	input reset,
	output [7:0] out_byte,
	output done
);
	// serial receiver with odd parity
	// similar to fsm_serial, after START there will be 8 DATA bits and 1 PARITY bits
	// HDLBits provides a module "parity" to calculate parity of input stream
	
endmodule
