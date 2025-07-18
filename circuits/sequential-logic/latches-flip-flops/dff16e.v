module dff16e(
	input clk,
	input resetn,
	input [1:0] byteena,
	input [15:0] d,
	output reg [15:0] q
);
	// 16 DFFs with active low synchronous reset
	// byte-enable input to change upper, lower, or both bytes
	always @(posedge clk) begin
		if (~resetn)
			q <= 16'b0;
		else begin
			case (byteena)
				2'b11 : q <= d;
				2'b10 : q <= {d[15:8], q[7:0]}; // change upper only
				2'b01 : q <= {q[15:8], d[7:0]}; // change lower only
				default : q <= q;					  // hold
			endcase
		end
	end
	
endmodule
