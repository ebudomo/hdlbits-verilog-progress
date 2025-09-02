module tff_tb ();
	// given a TFF module, instantiate one tff, reset the tff, then toggle to the '1' state
	reg clk;
	reg reset;
	reg t;
	wire q;
	 
	tff tff_dut (
		.clk (clk),
		.reset (reset),
		.t (t),
		.q (q)
	);
	 
	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end

	initial begin
		reset = 1'b1;
		#20
		reset = 1'b0;
	end

	initial begin
		#20
		t = 1'b1;
	end

endmodule

// DUT, a T flip-flop
module tff (
	input clk,
	input reset, // active-high sync reset
	input t,		 // toggle
	output q
);