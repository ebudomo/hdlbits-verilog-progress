module shift4(
	input clk,
	input areset,
	input load,
	input ena,
	input [3:0] data,
	output reg [3:0] q
);
	// 4-bit right shift register with async reset
	// load input has higher priority
	always @(posedge clk or posedge areset) begin
		if (areset)
			q <= 4'b0;
		else if (load)
			q <= data;
		else if (ena) begin
			q[3] <= 1'b0;
			q[2] <= q[3];
			q[1] <= q[2];
			q[0] <= q[1];
		end
	end
	
endmodule
