module circuit5 (
	input [3:0] a,
	input [3:0] b,
	input [3:0] c,
	input [3:0] d,
	input [3:0] e,
	output [3:0] q
);
	// appears that c is the select signal for inputs a, b, d, and e i.e. a 4-1 mux
	always @(*) begin
		case (c)
			4'd0: q = b;
			4'd1: q = e;
			4'd2: q = a;
			4'd3: q = d;
			default: q = 4'hf;
		endcase
	end

endmodule
