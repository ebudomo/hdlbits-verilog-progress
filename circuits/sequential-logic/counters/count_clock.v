module count_clock(
	input clk,
	input reset,
	input ena,
	output reg pm,
	output [7:0] hh,
	output [7:0] mm,
	output [7:0] ss
); 
	// very janky implementation of 12 hour clock, I believe there's room for improvement
	// logic to enable next digit count
	wire [5:0] enable;
	assign enable[0] = ena;
	assign enable[1] = ena && (ss[3:0] == 9);
	assign enable[2] = ena && (ss[7:4] == 5) && (ss[3:0] == 9);
	assign enable[3] = ena && (mm[3:0] == 9) && (ss[7:4] == 5) && (ss[3:0] == 9);
	assign enable[4] = ena && (mm[7:4] == 5) && (mm[3:0] == 9) && (ss[7:4] == 5) && (ss[3:0] == 9);
	assign enable[5] = ena && (((hh[7:4] == 1) && (hh[3:0] == 2)) || hh[3:0] == 9) && (mm[7:4] == 5) && (mm[3:0] == 9) && (ss[7:4] == 5) && (ss[3:0] == 9);
	
	// rollover to track transition from AM to PM and vice versa
	wire rollover;
	assign rollover = (hh[7:4] == 1) &&(hh[3:0] == 1) && (mm[7:4] == 5) && (mm[3:0] == 9) && (ss[7:4] == 5) && (ss[3:0] == 9);
	always @(posedge clk or posedge reset) begin
		if (reset)
			pm <= 1'b0;
		else if (rollover)
			pm <= ~pm;
	end

	one s_one(clk, reset, enable[0], ss[3:0]);
	ten s_ten(clk, reset, enable[1], ss[7:4]);
	one m_one(clk, reset, enable[2], mm[3:0]);
	ten m_ten(clk, reset, enable[3], mm[7:4]);
	hour_one h_one(clk, reset, enable[4], hh[7:4], hh[3:0]);
	hour_ten h_ten(clk, reset, enable[5], hh[3:0], hh[7:4]);

endmodule

module hour_ten(
	input clk,
	input reset,
	input ena,
	input [3:0] one,
	output reg [3:0] q
);
	always @(posedge clk) begin
		if (reset)
			q <= 4'd1;
		else if (ena) begin
			if (q == 1 & one == 2)
				q <= 4'd0;
			else
				q <= q + 1'b1;
		end
	end
endmodule

module hour_one(
	input clk,
	input reset,
	input ena,
	input [3:0] ten,
	output reg [3:0] q
);
	always @(posedge clk) begin
		if (reset)
			q <= 4'd2;
		else if (ena) begin
			if (ten == 1 & q == 2)
				q <= 4'd1;
			else if (q == 9)
				q <= 4'd0;
			else
				q <= q + 1'b1;
		end
	end
endmodule

module one(
	input clk,
	input reset,
	input ena,
	output reg [3:0] q
);
	always @(posedge clk) begin
		if (reset)
			q <= 4'd0;
		else if (ena) begin
			if (q == 9)
				q <= 4'd0;
			else
				q <= q + 1'b1;
		end
	end
endmodule

module ten(
	input clk,
	input reset,
	input ena,
	output reg [3:0] q
);
	always @(posedge clk) begin
		if (reset)
			q <= 4'd0;
		else if (ena) begin
			if (q == 5)
				q <= 4'd0;
			else
				q <= q + 1'b1;
		end
	end
endmodule
