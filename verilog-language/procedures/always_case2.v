module always_case2(
	input [3:0] in,
	output reg [1:0] pos  
);
	// priority encoder using case
	// case order is important
	// since we are checking from LSB to MSB
	// default case unnecessary since all cases covered
	always @(*) begin
		case (in)
			4'h0 : pos = 2'h0;
			4'h1 : pos = 2'h0;
			4'h2 : pos = 2'h1;
			4'h3 : pos = 2'h0;
			4'h4 : pos = 2'h2;
			4'h5 : pos = 2'h0;
			4'h6 : pos = 2'h1;
			4'h7 : pos = 2'h0;
			4'h8 : pos = 2'h3;
			4'h9 : pos = 2'h0;
			4'ha : pos = 2'h1;
			4'hb : pos = 2'h0;
			4'hc : pos = 2'h2;
			4'hd : pos = 2'h0;
			4'he : pos = 2'h1;
			4'hf : pos = 2'h0;
		endcase
	end

endmodule
