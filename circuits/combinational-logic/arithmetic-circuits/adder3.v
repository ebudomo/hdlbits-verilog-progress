module adder3(
	input [2:0] a, b,
	input cin,
	output [2:0] cout,
	output [2:0] sum
);
	// 3 bit adder by instantiating 3 fadd modules
	wire [3:0] fadd_cin;
   assign fadd_cin[0] = cin;
   genvar i;
   generate
       for (i=0; i<3; i=i+1) begin : fadd_array
           fadd u_fadd (
               .a (a[i]),
               .b (b[i]),
               .cin (fadd_cin[i]),
               .cout (cout[i]),
               .sum (sum[i])
           );
           assign fadd_cin[i+1] = cout[i];
       end
   endgenerate

endmodule
