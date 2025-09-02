module history_shift (
	input clk,
	input areset,
	
	input predict_valid,
	input predict_taken,
	output reg [31:0] predict_history,
	
	input train_mispredicted,
	input train_taken,
	input [31:0] train_history
);
	// a branch history register, recording "taken" or "not taken" results
	// a misprediction takes precedence over a prediction
	// when a mispediction occurs, predict_history is loaded with history before the mispredicted branch
	// then concatenate the actual result of the branch, train_taken
	always @(posedge clk, posedge areset) begin
		if (areset)
			predict_history <= 32'd0;
		else if (train_mispredicted == 1)
			predict_history <= {train_history[30:0], train_taken};
		else if (predict_valid == 1)
			predict_history <= {predict_history[30:0], predict_taken};
	end

endmodule
