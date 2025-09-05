module gshare (
	input clk,
	input areset,
	
	input predict_valid,				// branch prediction request
	input  [6:0] predict_pc,		// program counter to be predicted
	output predict_taken,			// T or NT
	output reg [6:0] predict_history, // branch prediction history
	
	input train_valid,				// branch training request
	input train_taken, 				// T or NT
	input train_mispredicted,		// training mispediction flag
	input [6:0] train_history,		// branch training history
	input [6:0] train_pc				// program counter to be trained
);

	reg [1:0] PHT [127:0]; // Pattern History Table: memory array of 128 2-bit saturated counters (SNT, WNT, WT, ST)
	integer i;
	
	always @(posedge clk, posedge areset) begin
		if (areset) begin
			predict_history <= 7'd0;
			for (i=0; i<128; i=i+1)
				PHT[i] <= 2'b01;	// reset all counters to WNT
		end
		else begin
			if (train_valid && train_mispredicted) 
				predict_history <= {train_history[5:0], train_taken};		 // recovering branch prediction history after misprediction
			else if (predict_valid) 
				predict_history <= {predict_history[5:0], predict_taken}; // updating branch prediction history
			if (train_valid) begin // sequential training interface to update 2-bit saturated counters in PHT
				if (train_taken)
					PHT[train_pc ^ train_history] <= (PHT[train_pc ^ train_history] == 2'b11) ? 2'b11 : PHT[train_pc ^ train_history] + 1'b1; // count up
				else 
					PHT[train_pc ^ train_history] <= (PHT[train_pc ^ train_history] == 2'b00) ? 2'b00 : PHT[train_pc ^ train_history] - 1'b1; // count down
			end
		end
	end
	
	assign predict_taken = PHT[predict_pc ^ predict_history][1]; // combinational prediction interface sees PHT state before training updates at next clock edge
	
endmodule
