module m2014_q4k(
	input clk,
	input resetn,
	input in,
	output out
);
	// 4-bit left shift register with active low sync reset
	// push in at LSB, output MSB
	reg [3:0] sr;
	always @(posedge clk) begin
		if(~resetn)
			sr <= 4'b0;
		else
			sr <= {sr[2:0], in};
	end
	
	assign out = sr[3];
	
endmodule
