module fsm2s(
	input clk,
	input reset,
	input j,
	input k,
	output out 
);
	// Moore machine of JKFF with sync reset
	parameter OFF = 1'b0, ON = 1'b1;
	reg state, next;
	
	// state transition logic, combinational block
	always @(*) begin
		case ({j,k})
			2'b00 : next = state;
			2'b01 : next = OFF;
			2'b10 : next = ON;
			2'b11 : next = ~state;
		endcase 
	end
	
	// state flip-flops with sync reset, sequential block
	always @(posedge clk) begin
		if (reset)
			state <= OFF;
		else
			state <= next;
	end
	
	assign out = (state == ON);

endmodule
