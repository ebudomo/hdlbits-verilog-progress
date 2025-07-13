module module_fadd(
	input [31:0] a,
   input [31:0] b,
   output [31:0] sum,
	output cout
);
   // 32bit adder
	// two levels of hierarchy
	// module_fadd implements two copies of add16
	// add16 implements 16 copies of add1
   wire [15:0] sum1, sum2;
   wire cout_1;
   add16 add16_1 (a[15:0], b[15:0], 0, sum1, cout_1);
   add16 add16_2 (a[31:16], b[31:16], cout_1, sum2, cout);
   assign sum = {sum2, sum1};

endmodule

module add1 ( 
	input a, 
	input b, 
	input cin, 
	output sum, 
	output cout 
);
    
    assign sum = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule
