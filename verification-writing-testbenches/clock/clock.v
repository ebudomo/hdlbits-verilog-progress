// provided with module dut ( input clk ) ;
// this is a testbench that creates one instance of dut with a clock signal period 10 ps

`timescale 1ps / 1ps // defines time unit / precision
module clock;

	reg clk;
	
	dut dut1 ( clk ); // one instance of dut module
	
	// clock generation: period = 10 ps, initialized to 0
	initial begin
		clk = 0;
	end
	
	// toggle clk every 5 ps
	always begin
		#5 clk = ~clk;
	end
	
endmodule
