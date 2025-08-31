module circuit5 (
	input [3:0] a,
	input [3:0] b,
	input [3:0] c,
	input [3:0] d,
	input [3:0] e,
	output [3:0] q
);
	// appears that c is the select signal for inputs a, b, d, and e i.e. a 4-1 mux
	reg [3:0] x;
	always @(*) begin
		case (c)
			4'd0: x = b;
			4'd1: x = e;
			4'd2: x = a;
			4'd3: x = d;
			default: x = 4'hf;
		endcase
	end
	
	assign q = x;
	
endmodule
