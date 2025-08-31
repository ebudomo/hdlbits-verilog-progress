module circuit10 (
	input clk,
	input a,
	input b,
	output q,
	output reg state
);
	// sequential circuit with combinational logic and memory
	// q follows combinational logic
	// state follows sequential logic
	always @(posedge clk) begin
		if (a == 1'b1 && b == 1'b1 && state == 1'b0)
			state <= 1'b1;
		if (a == 1'b0 && b == 1'b0 && state == 1'b1)
			state <= 1'b0;
	end
	 
	assign q = a ^ b ^ state;

endmodule
