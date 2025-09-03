module gshare (
	input clk,
	input areset,
	
	input predict_valid,
	input  [6:0] predict_pc,
	output predict_taken,
	output [6:0] predict_history, // global history register
	
	input train_valid,
	input train_taken,
	input train_mispredicted,
	input [6:0] train_history,
	input [6:0] train_pc
);
	reg [1:0] PGT [127:0]; // memory array of 128 elements, each element 2-bits wide
	integer i;
	
	always @(posedge clk, posedge areset) begin
		if (areset) begin
			predict_history <= 7'b0;
			for (i=0; i<128; i=i+1)
				PGT[i] <= 2'b01;		// reset entire PHT to WNT
		end
	end
			
	
	// prediction interface (predict_valid == 1)
	// ask for branch direction predictions for the currently fetched instructions
	
	
	// training interface (train_valid == 1)
	// give pc, branch history, actual branch outcome, and misprediction check
	

endmodule
