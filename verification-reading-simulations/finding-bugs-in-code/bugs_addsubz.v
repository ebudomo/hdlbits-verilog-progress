module bugs_addsubz (
	input do_sub,
	input [7:0] a,
	input [7:0] b,
	output reg [7:0] out,
	output reg result_is_zero
);
	// adder-subtractor with zero flag
	// incorrect code:
	// always @(*) begin
   //     case (do_sub)
   //       0: out = a+b;
   //       1: out = a-b;
   //     endcase
	//
   //     if (~out)
   //         result_is_zero = 1;
   // end
	// 
	// first issue: result_is_zero requires a zero assignment
	// second issue: default case missing
	
	always @(*) begin
		case (do_sub)
			0: out = a+b;
			1: out = a-b;
			default: out = a+b;
		endcase
		
		if (out == 8'd0)
			result_is_zero = 1;
		else
			result_is_zero = 0;
	end
	
endmodule
	