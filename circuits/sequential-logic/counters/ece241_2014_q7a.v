module ece241_2014_q7a(
	input clk,
	input reset,
	input enable,
	output [3:0] Q,
	output reg c_enable,
	output reg c_load,
	output reg [3:0] c_d
);
	// manage a 1-12 synchronous counter by controlling count4
	// use control signals to guide counting behaviour
	// output Q driven by output of count4, hence a wire
	count4 the_counter (clk, enable, c_load, c_d, Q);
	
	// combinational always block so output control signals are stable before clock edge
	always @(*) begin
	// default values for control signals
		c_enable = 0;
		c_load = 0;
		c_d = 4'd0;
		
	// two reset conditions: reset high or rollover
		if (reset) begin
			c_load = 1;
			c_d = 1;
		end
		else if (enable & Q == 12) begin
			c_load = 1;
			c_d = 1;
		end
		
	// one increment condition
		else if (enable) begin
			c_enable = 1;
			c_load = 0;
		end
	end
 
endmodule

module count4(
	input clk,
	input enable,
	input load,
	input [3:0] d,
	output reg [3:0] Q
);
	// 4-bit binary counter with load
	always @(posedge clk) begin
		if (load)
			Q <= d;
		else if (enable)
			Q <= Q+1;
	end

endmodule
