module countbcd(
	input clk,
	input reset,
	output [3:1] ena,
	output [15:0] q
);
	// 4 digit BCD counter with ena signal indicating increments
	wire [3:0] q0, q1, q2, q3;
	// concatenate digit outputs
	assign q = {q3, q2, q1, q0};
	// enable counter when previous digit rolls over
	assign ena[1] = (q0 == 9);
	assign ena[2] = (q0 == 9) && (q1 == 9);
	assign ena[3] = (q0 == 9) && (q1 == 9) && (q2 == 9);
	
	bcdcount counter0 (clk, reset, 1'b1, q0);
	bcdcount counter1 (clk, reset, ena[1], q1);
	bcdcount counter2 (clk, reset, ena[2], q2);
	bcdcount counter3 (clk, reset, ena[3], q3);
    
endmodule

module bcdcount(
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
