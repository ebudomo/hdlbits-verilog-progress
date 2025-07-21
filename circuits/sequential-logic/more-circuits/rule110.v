module rule110(
	input clk,
	input load,
	input [511:0] data,
	output reg [511:0] q
);
	// rule 110 on 512-cell array, logical assignment was googled
	// using wires for left and right neighbours (zero-padded) for clarity
	wire [511:0] q_l  = {1'b0, q[511:1]};
	wire [511:0] q_r = {q[510:0], 1'b0};
	always @(posedge clk) begin
		if (load)
			q <= data;
		else
			q <= (q & ~q_r) | (~q_l & q_r) | (~q & q_r);
	end
 
endmodule
