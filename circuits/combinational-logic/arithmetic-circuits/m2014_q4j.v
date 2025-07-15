module m2014_q4j(
	input [3:0] x,
   input [3:0] y, 
   output [4:0] sum
);
	// adding two 4 bit vectors with initial cin = 0
	// instantiating 4 full adders
   wire [4:0] cin;
   assign cin[0] = 1'b0;
   genvar i;
   generate
       for(i=0; i<4; i=i+1) begin : fadd_array
           fadd u_fadd (
               .a (x[i]),
               .b (y[i]),
               .cin (cin[i]),
					.cout (cin[i+1]),
               .sum (sum[i])
           );
       end
   endgenerate
   assign sum[4] = cin[4];

endmodule
