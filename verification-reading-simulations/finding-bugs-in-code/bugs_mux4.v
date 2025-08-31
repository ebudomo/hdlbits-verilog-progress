module bugs_mux4(
	input [1:0] sel,
   input [7:0] a,
   input [7:0] b,
   input [7:0] c,
   input [7:0] d,
   output [7:0] out  
); 
	// given a 2-1 mux, fix the 4-1 mux
	// incorrect code:
	// wire mux0, mux1;
   // mux2 mux0 ( sel[0],    a,    b, mux0 );
   // mux2 mux1 ( sel[1],    c,    d, mux1 );
   // mux2 mux2 ( sel[1], mux0, mux1,  out );
	// obvious issue is duplicate identifiers for instances and wires
	// other issue is incorrect assignment of sel signal
	// last issue is mux2 out is a vector
	
	wire [7:0] mux0, mux1;
   mux2 mux2_0 ( sel[0],    a,    b, mux0 );
   mux2 mux2_1 ( sel[0],    c,    d, mux1 );
   mux2 mux2_2 ( sel[1], mux0, mux1,  out );
	
endmodule

module mux2 (
   input sel,
   input [7:0] a,
   input [7:0] b,
   output [7:0] out
);

	assign out = sel ? a : b;

endmodule
