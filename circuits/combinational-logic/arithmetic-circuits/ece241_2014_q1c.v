module ece241_2014_q1c (
	input [7:0] a,
   input [7:0] b,
   output [7:0] s,
   output overflow
); 
	// compute the sum of two 8bit 2's complements numbers
	// detect if overflow has occurred
   assign s = a + b;
   assign overflow = (a[7] ^ s[7]) & (b[7] ^ s[7]);
    
endmodule
