module timer(
	input clk,
	input load,
	input [9:0] data,
	output tc
);
	// timer that counts down for a given number of clock cycles
	// after given duration, assert signal low until counter is loaded again
	reg [9:0] count;
	reg done;
	
	// sequential down counter logic
	always @(posedge clk) begin
		if (load)
			count <= data;
		else if (count == 0)
			count <= 0;
		else if (~load)
			count <= count - 1'b1;
	end

	// combinational output logic
	always @(*) begin
		case (count)
			10'd0: done = 1'b1;
			default: done = 1'b0;
		endcase
	end
	
	assign tc = done;

endmodule
