module exams_2014_q4a(
	input clk,
	input w, R, E, L,
	output reg Q
);
	// DFF with two 2-1 muxes at D port
	wire D;
	assign D = L ? R :
				  E ? w : Q;
	
	always @(posedge clk) begin
		Q <= D;
	end

endmodule
