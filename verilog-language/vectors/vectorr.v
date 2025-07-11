module vectorr(
	input [7:0] in,
	output [7:0] out
);
	//reversing bit order of an input
	
	/*tedious version
	//use output [7:0] out
	assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};
	*/
	
	/*using combinational block
	//use output reg [7:0] out
	integer i;
	always @(*) begin	
		for (i=0; i<8; i=i+1)
			out[i] = in[8-i-1];
	end
	*/
	
	//using generate-for loop
	//use output reg [7:0] out
	generate
		genvar i;
		for (i=0; i<8; i = i+1) begin: my_block_name
			assign out[i] = in[8-i-1];
		end
	endgenerate
	
endmodule 