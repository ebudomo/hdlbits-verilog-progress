module gshare (
	input clk,
	input areset,
	
	input predict_valid,				// branch prediction request
	input  [6:0] predict_pc,		// program counter to be predicted
	output predict_taken,
	output reg [6:0] predict_history, // global history register
	
	input train_valid,				// branch training request
	input train_taken
	input train_mispredicted,		// training mispediction signal
	input [6:0] train_history,		// branch history after misprediction
	input [6:0] train_pc				// program counter to be trained
);
	reg [1:0] PHT [127:0]; // Pattern History Table: memory array of 128 elements, each element 2-bits wide
	integer i;
	
	always @(posedge clk, posedge areset) begin
		if (areset) begin
			predict_history <= 7'b0;
			for (i=0; i<128; i=i+1)
				PHT[i] <= 2'b01;		// reset entire PHT to WNT
		end
		
		else begin
			// training interface, which takes precedence
			if (train_valid == 1 && train_mispredicted == 1) begin
				predict_history <= train_history;
			end
			// prediction interface
			if (predict_valid == 1) begin
				predict_history <= {predict_history[5:0], train_taken};
			end
		end
		
	end
	
	assign predict_taken = predict_history[0];
	
endmodule
