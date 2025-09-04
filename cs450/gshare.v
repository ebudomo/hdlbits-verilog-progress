module gshare (
	input clk,
	input areset,
	
	input predict_valid,				// branch prediction request
	input  [6:0] predict_pc,		// program counter to be predicted
	output predict_taken,			// T or NT
	output reg [6:0] predict_history, // global history register
	
	input train_valid,				// branch training request
	input train_taken					// T or NT
	input train_mispredicted,		// training mispediction signal
	input [6:0] train_history,		// branch history after misprediction
	input [6:0] train_pc				// program counter to be trained
);

	// two-bit saturating counter
	parameter SNT=2'b00, WNT=2'b01, WT=2'b10, ST=2'b11;
	reg [1:0] PHT [127:0]; // Pattern History Table: memory array of 128 2-bit saturated counters
	reg [1:0] next;
	wire [6:0] index;
	integer i;
		
	// sequential flip-flop
	always @(posedge clk, posedge areset) begin
		if (areset) begin
			for (i=0; i<128; i=i+1)
				PHT[i] <= WNT;		// reset entire PHT to WNT
		end
		else
			PHT[index] <= next;
	end
	
	// combinational state transition logic
	always @(*) begin
		if (train_valid) begin
			index = train_pc ^ train_history;
			case (PHT[index])
				SNT: next = train_taken ? WNT : SNT;
				WNT: next = train_taken ? WT : SNT;
				WT:  next = train_taken ? ST : WNT;
				ST:  next = train_taken ? ST : WT;
				default: next = WNT;
			endcase
		end
		else if (predict_valid == 1)
			index = predict_pc ^ predict_history;
		else if (~train_valid)
			next = PHT[index];
	end
	
	// global branch history register
	always @(posedge clk, posedge areset) begin
		if (areset)
			predict_history <= 7'd0;
		else if (train_valid == 1 && train_mispredicted == 1) 
			predict_history <= {train_history[5:0], train_taken};
		else if (predict_valid == 1)
			predict_history <= {predict_history[5:0], predict_taken};
	end
	
	assign predict_taken = PHT[index][1];
	
endmodule
