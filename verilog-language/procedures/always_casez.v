module always_casez (
	input [7:0] in,
	output reg [2:0] pos 
);
	// rather than writing out all 256 possible cases
	// use "casez" and z don't cares
	// binary literals used to specify z bits
	// default case is for other 248 cases
	always @(*) begin
		casez ( in[7:0] )
			8'bzzzzzzz1 : pos = 3'h0;
			8'bzzzzzz10 : pos = 3'h1;
			8'bzzzzz100 : pos = 3'h2;
			8'bzzzz1000 : pos = 3'h3;
			8'bzzz10000 : pos = 3'h4;
			8'bzz100000 : pos = 3'h5;
			8'bz1000000 : pos = 3'h6;
			8'b10000000 : pos = 3'h7;
			default : pos = 0;
		endcase
	end
	
	// comment: replacing 0's with z's results in warning 10935:
	// "casex/casez item expression overlaps with a previous casex/casez item "
	// i.e. using z instead of 0 means case order is important
	// whereas specifying 0's means case order is not important

endmodule
