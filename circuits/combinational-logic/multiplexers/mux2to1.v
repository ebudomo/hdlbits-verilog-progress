module mux2to1(
	input a, 
	input b, 
	input sel,
   output out 
);
	// implementing 2to1 mux using ternary operator
   assign out = sel ? b : a;

endmodule
