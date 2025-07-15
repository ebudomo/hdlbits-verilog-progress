module fadd(
	input a, b, cin,
	output cout, sum
);
	// full adder
	assign sum = a ^ b ^ cin;
	assign cout = (a & b) | (a & cin) | (b & cin);
	
endmodule
