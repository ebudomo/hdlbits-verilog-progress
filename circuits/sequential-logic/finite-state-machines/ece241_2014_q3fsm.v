module ece241_2014_q3fsm(
	input clk,
	input reset,
	input s,
	input w,
	output z
);
	// FSM that outputs z=1 when in state B and there are exactly 2 clock cycles
	// where w=1, with sync reset
	parameter A=1'b0, B=1'b1;
	reg state, next;
	reg [1:0] clock, count;
	
	// combinational state transition logic 
	always @(*) begin
		case (state)
			A: next = s ? B : A;
			B: next = B;
			default: next = A;
		endcase
	end
	 
	// sequential flipflop
	always @(posedge clk) begin
		state <= reset ? A : next;
	end
	
	// counting every 3 clock cycles
	always @(posedge clk) begin
		if (reset)
			clock <= 2'd0;
		else if (clock == 2'd2)
			clock <= 2'd0;
		else if (state == B)
			clock <= clock + 2'd1;
	end
	
	// counting number of times w is asserted high every 3 clock cycles
	always @(posedge clk) begin
		if (reset)
			count <= 2'd0;
		else if (clock == 2'd0 && w == 1'b0)
			count <= 2'd0;
		else if (clock == 2'd0 && w == 1'b1)
			count <= 2'd1;
		else if (state == B && w == 1'b1)
			count <= count + 2'd1;
	end
	
	// assert output z high when exactly 2 counts of w=1 occurs in previous 3 clock cycles
	assign z = (state == B && count == 2'd2 && clock == 2'd0);
 
endmodule
