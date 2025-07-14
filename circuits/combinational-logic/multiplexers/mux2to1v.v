module mux2to1v(
	 input [99:0] a, b,
	 input sel, 
	 output [99:0] out 
);
    // 2to1 mux with vector input
	 // since output and input ports are same size
	 // we can use ternary operator
    assign out = sel ? b : a;

endmodule
