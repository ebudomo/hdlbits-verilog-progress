module ece241_2014_q4(
	input clk,
	input x,
	output z
);
	// implementing a bitwise "state machine" using DFFs
	wire in1, in2, in3;
   wire out1, out2, out3;
    
   assign in1 = x ^ out1;
   assign in2 = x & ~out2;
   assign in3 = x | ~out3;
   assign z = ~(out1 | out2 | out3);
    
   dff_fsm dff1(in1, clk, out1);
   dff_fsm dff2(in2, clk, out2);
   dff_fsm dff3(in3, clk, out3);

endmodule

module dff_fsm(
   input d,
   input clk,
   output reg q
);
   always @(posedge clk) begin
       q <= d;
   end
endmodule
