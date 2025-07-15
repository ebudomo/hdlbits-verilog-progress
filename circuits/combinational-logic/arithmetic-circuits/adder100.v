module adder100(
	input [99:0] a, b, 
	input cin,
	output cout,
	output [99:0] sum
);
	// 100 bit binary adder using behavioural code
	// left-hand concatenate
	assign {cout, sum} = a + b + cin;

endmodule
	