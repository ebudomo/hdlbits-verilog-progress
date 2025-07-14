module popcount255(
	input [254:0] in,
	output reg [7:0] out 
);
	// counting number of high bits in input
	// out = 0 is "default case"
	// fulfils requirement for variable to always have a value
	integer i;
	always @(*) begin
		out = 0;
		for (i = 0; i < 255; i = i + 1)
			out = out + in[i];
	end
 
endmodule
