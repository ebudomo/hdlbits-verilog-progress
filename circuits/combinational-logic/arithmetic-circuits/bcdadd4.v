module bcdadd4(
	input [15:0] a, b,
	input cin,
	output cout,
	output [15:0] sum 
);
	// 4 digit BCD ripple-carry adder
	// adds two 4 digit BCD numbers (packed into 16 bit vectors)
	// and cin to produce a 4 digit sum and cout
	
	// wire to connect carry outs between consecutive adders
	wire [4:0] bcd_fadd_cin;
	assign bcd_fadd_cin[0] = cin;
 
	genvar i;
	generate
		for(i=0; i<4; i=i+1) begin : bcd_fadd_array
			bcd_fadd u_bcd_fadd (
				a[4*i+3:4*i], b[4*i+3:4*i], bcd_fadd_cin[i],
				bcd_fadd_cin[i+1], sum[4*i+3:4*i] );
		end
	endgenerate
 
	assign cout = bcd_fadd_cin[4];
 
endmodule
