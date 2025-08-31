module circuit6 (
	input [2:0] a,
	output [15:0] q
);
	// looks like a combinational case circuit
	reg [15:0] x;
	always @(*) begin
		case (a)
			3'd0: x = 16'h1232;
			3'd1: x = 16'haee0;
			3'd2: x = 16'h27d4;
			3'd3: x = 16'h5a0e;
			3'd4: x = 16'h2066;
			3'd5: x = 16'h64ce;
			3'd6: x = 16'hc526;
			3'd7: x = 16'h2f19;
			default: x = 16'bx;
		endcase
	end
	
	assign q = x;

endmodule
