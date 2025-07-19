module ece241_2014_q7b(
	input clk,
	input reset,
	output OneHertz,
	output [2:0] c_enable
);
	// from 1000 Hz clock, derive a 1 Hz signal
	// frequency divider using modulo-10 (BCD) counters and gates
	// bcdcount module provided
	wire [3:0] q0, q1, q2;
   assign c_enable[0] = 1'b1;
	assign c_enable[1] = (q0 == 4'd9);
	assign c_enable[2] = (q0 == 4'd9) && (q1 == 4'd9);
	assign OneHertz = (q0 == 4'd9) && (q1 == 4'd9) && (q2 == 4'd9);
	
	// 3 BCD counters divide by 10*10*10=1000
   bcdcount counter0 (clk, reset, c_enable[0], q0);
   bcdcount counter1 (clk, reset, c_enable[1], q1);
   bcdcount counter2 (clk, reset, c_enable[2], q2);

endmodule

module bcdcount (
	input clk,
	input reset,
	input enable,
	output reg [3:0] Q
);
	// BCD counter counts from 0-9 decimal
	always @(posedge clk) begin
		if (reset)
			Q <= 4'd0;
		else if (enable) begin
			if (Q == 4'd9)
				Q <= 4'd0;
			else
				Q <= Q + 1'b1;
		end
	end
endmodule
