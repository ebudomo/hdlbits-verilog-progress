module ece241_2013_q2(
	input a,
	input b,
	input c,
	input d,
	output out_sop,
	output out_pos
);
	// given minterms, maxterms, and don't cares
	// determine minimum SOP and POS using kmap
	assign out_sop = (c & d) | (~a & ~b & c);
   assign out_pos = c & (~a | b) & (~b | ~c | d);
	
endmodule
