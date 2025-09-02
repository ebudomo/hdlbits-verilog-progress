module counter_2bc(
	input clk,
	input areset,
	input train_valid,
	input train_taken,
	output [1:0] state
);
	// two-bit saturating counter
	parameter SNT=2'b00, WNT=2'b01, WT=2'b10, ST=2'b11;
	reg [1:0] count, next;
	
	// sequential flip-flop
	always @(posedge clk, posedge areset) begin
		if (areset)
			count <= WNT;
		else
			count <= next;
	end
	
	// combinational state transition logic
	always @(*) begin
		if (train_valid) begin
			case (state)
				SNT: next = train_taken ? WNT : SNT;
				WNT: next = train_taken ? WT : SNT;
				WT:  next = train_taken ? ST : WNT;
				ST:  next = train_taken ? ST : WT;
				default: next = WNT;
			endcase
		end
		else if (~train_valid)
			next = state;
	end
	
	// combinational output logic
	assign state = count;

endmodule
