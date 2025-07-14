module adder100i(
	input [99:0] a, b,
	input cin,
	output [99:0] cout,
	output [99:0] sum 
);
	// 100-bit binary ripple-carry adder
	// instatiating 100 fulladders in bottom module
	wire [100:0] fadd_cin;
	assign fadd_cin[0] = cin;
	
	// using generate block to instantiate 100 adder modules
	// using module array
	genvar i;
	generate
		for (i=0; i<100; i=i+1) begin : fadd_array
		fadd u_fadd (
				a[i], b[i], fadd_cin[i],
				cout[i], sum[i]
			);
			assign fadd_cin[i+1] = cout[i];
		end
	endgenerate

endmodule

// 1-bit forward adder module
module fadd(
	input in1, in2, cin,
	output cout, sum 
);
	 
	assign sum = in1 ^ in2 ^ cin;
	assign cout = (in1 & in2) | (in1 & cin) | (in2 & cin);
 
endmodule
