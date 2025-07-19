module edgecapture(
	input clk,
	input reset,
	input [31:0] in,
	output reg [31:0] out
);
	// 32-bit negative edge capture with reset
	reg [31:0] in_old = 32'b0;
	integer i;
	
	always @(posedge clk) begin
		if (reset) // reset out immediately
			out <= 32'b0;
		else
			out <= out | (in_old &~in); 
       	  // latches 1 for each bit with negative edge transition
        	  // maintains previously latched bits
	  in_old <= in; // update shift register
   end
	
endmodule
			