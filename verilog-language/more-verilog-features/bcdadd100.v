module bcdadd100(
	input [399:0] a, b,
	input cin,
	output cout,
	output [399:0] sum 
);
	// provided with a BCD one-digit adder (from HDLBits)
	// instantiating 100 BCD adders to create 100-digit BCD ripple-carry adder
	// adding two 100-digit BCD numbers packed into 400-bit vectors
	wire [100:0] bcd_fadd_cin;
	assign bcd_fadd_cin[0] = cin;
	
	// using generate block to instantiate 100 bcd_fadd modules
	// using module array
	// since 4 bits are converted to 1 bit binary, 4*i+3:4*i bounds used
	// makes it easier to read loop as 100 4-bit numbers read
	genvar i;
	generate
		for(i=0; i<100; i=i+1) begin : bcd_fadd_array
		bcd_fadd u_bcd_fadd (
			a[4*i+3:4*i], b[4*i+3:4*i], bcd_fadd_cin[i],
			bcd_fadd_cin[i+1], sum[4*i+3:4*i] 
			);
		end
	endgenerate
	 
	assign cout = bcd_fadd_cin[100];
                
endmodule
