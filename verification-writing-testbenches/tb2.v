module tb2 ();
	// given a waveform and module to be tested, generate the signals as shown
	reg clk;
	reg in;
	reg [2:0] s;
	wire out;
	
	q7 dut (
		.clk (clk),
		.in (in),
		.s (s),
		.out (out)
	);
	 
	// setting clock
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	 
	// setting in
	initial begin
		in = 1'b0;
		#20
		in = 1'b1;
		#10
		in = 1'b0;
		#10
		in = 1'b1;
		#30
		in =1'b0;
	end
	 
	// setting s
	initial begin
		s = 3'd2;
		#10
		s = 3'd6;
		#10
		s = 3'd2;
		#10
		s = 3'd7;
		#10
		s = 3'd0;
	end

endmodule

// device under test, provided
module q7 (
	input clk,
	input in,
	input [2:0] s,
	output out
);
