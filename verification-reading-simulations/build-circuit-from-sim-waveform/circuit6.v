module circuit6 (
	input [2:0] a,
	output [15:0] q
);
	// looks like a combinational case circuit
	reg [15:0] x;
	always @(*) begin
		case (a)
			3'd0: x = 0;
			3'd1: x = 0;
			3'd2: x = 0;
			3'd3: x = 0;
			3'd4: x = 0;
			3'd5: x = 0;
			3'd6: x = 0;
			3'd7: x = 0;
			default: x = 16'dx;
		endcase
	end
	
	assign q = x;

endmodule
