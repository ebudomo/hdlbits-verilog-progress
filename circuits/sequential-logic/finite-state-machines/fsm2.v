module fsm2(
	input clk,
	input areset,
	input j,
	input k,
	output out
);
	// Moore machine of JKFF with async reset
	parameter OFF = 1'b0, ON = 1'b1;
	reg state, next;
	
	// combinational block for state transition logic
	always @(*) begin
		case ({j,k})
			2'b00 : next = state;
			2'b01 : next = OFF;
			2'b10 : next = ON;
			2'b11 : next = ~state;
		endcase 
	end 
	
	// sequential block for state flip-flops
	always @(posedge clk, posedge areset) begin
		if (areset)
			state <= OFF;
		else 
			state <= next;
	end
	
	// output logic
	assign out = (state == ON);
	
endmodule 
