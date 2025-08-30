module review2015_count1k (
	input clk,
	input reset, // sync reset
	output reg [9:0] q
);
	// count 0 to 999 inclusive with a period of 1000 cycles
	reg [9:0] count;
    
	always @(posedge clk) begin
		if (reset) begin
			q <= 10'd0;
			count <= 10'd0;
		end
		else if (q == 10'd999 || count == 10'd999) begin
			q <= 10'd0;
			count <= 10'd0;
		end
		else begin
			q <= q + 10'd1;
			count <= count + 10'd1;
		end
	end

endmodule
