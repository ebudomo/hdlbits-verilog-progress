module bugs_nand3(
	input a,
	input b,
	input c,
	output out
);
	// must make 3-input NAND gate given the 5-input AND gate given below:
	// module andgate ( output out, input a, input b, input c, input d, input e );"
	// incorrect code: andgate inst1 ( a, b, c, out );
	// issues: portlist order is incorrect, and only three inputs are listed
	wire notout;
	andgate inst1 (notout, a, b, c, (a&b&c), (a&b&c));
	assign out = !notout;
	
endmodule

module andgate ( output out, input a, input b, input c, input d, input e );

	assign out = a & b & c & d & e;
	
endmodule
