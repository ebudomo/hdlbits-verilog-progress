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
	always @(posedge clk, posedge areset) begin
		if (areset)
			q <= 4'b0;
		else if (load)
			q <= data;
		else if (ena) 
			q <= q[3:1]; // top 3 bits become lower 3 bits
			// vector q will be zero-extended
	end
	
endmodule
