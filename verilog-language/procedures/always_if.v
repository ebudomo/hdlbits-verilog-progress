module always_if(
	input a,
	input b,
	input sel_b1,
	input sel_b2,
	output wire out_assign,
	output reg out_always
);
	// 2-1 mux: output b if sel_b1 & sel_b2, a otherwise
	
	// continuous assignment using ternary operator
	assign out_assign = (sel_b1 & sel_b2) ? b : a;
	
	// procedural assignment using if
	always @(*) begin
		if (sel_b1 & sel_b2)
			out_always = b;
		else
			out_always = a;
	end
	
endmodule
