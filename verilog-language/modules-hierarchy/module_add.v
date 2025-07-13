module module_add(
	input [31:0] a,
   input [31:0] b,
   output [31:0] sum
);
	// instantiating two add16 modules to create 32bit adder
	wire [15:0] sum1, sum2;
	wire cout;
	add16 add16_1 (a[15:0], b[15:0], 0, sum1, cout);
	add16 add16_2 (a[31:16], b[31:16], cout, sum2, 0);
	assign sum = {sum2, sum1};

endmodule

module add16(
	input [15:0] a,
	input [15:0] b,
	input cin,
	output [15:0] sum,
	output cout
);
	// module body
endmodule
