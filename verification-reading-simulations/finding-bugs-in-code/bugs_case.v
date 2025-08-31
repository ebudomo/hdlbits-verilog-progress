module bugs_case (
	input [7:0] code,
	output reg [3:0] out,
	output reg valid
);
	// recognize 8-bit keyboard scancodes for keys 0 through 9
	// should indicate whether one of 10 cases were valid and which key is detected
	// incorrect code:
	// always @(*)
   //     case (code)
   //         8'h45: out = 0;
   //         8'h16: out = 1;
   //         8'h1e: out = 2;
   //         8'd26: out = 3;
   //         8'h25: out = 4;
   //         8'h2e: out = 5;
   //         8'h36: out = 6;
   //         8'h3d: out = 7;
   //         8'h3e: out = 8;
   //         6'h46: out = 9;
   //         default: valid = 0;
   //     endcase
	// issues: - missing begin and end syntax for always block
	// 	- incorrect scancodes specified in case block
	// 	- valid scancodes are not flagged correctly
	// referenced sim waveform to identify correct scancodes
	
	always @(*) begin
		valid = 1; // give outputs a default assignment
		out = 0;
		case (code)
			8'h45: out = 4'd0;
			8'h16: out = 4'd1;
			8'h1e: out = 4'd2;
			8'h26: out = 4'd3;
			8'h25: out = 4'd4;
			8'h2e: out = 4'd5;
			8'h36: out = 4'd6;
			8'h3d: out = 4'd7;
			8'h3e: out = 4'd8;
			8'h46: out = 4'd9;
			default: valid = 0;
		endcase
	end	
	
endmodule
