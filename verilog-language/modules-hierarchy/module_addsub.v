module module_addsub(
	input [31:0] a,
   input [31:0] b,
   input sub,
   output [31:0] sum
);
	// adder-subtractor using 16-bit input ports
	reg [31:0] b_sub;
	wire [15:0] sum1, sum2;
	wire cout;
	
	// b_sub wire for (b XOR sub)
	always @(*) begin
		case ( sub )
			1'b0 : b_sub = b;
			1'b1 : b_sub = ~b;
		endcase
	end
	
	add16 add16_1 ( a[15:0], b_sub[15:0], sub, sum1, cout);
	add16 add16_2 ( a[31:16], b_sub[31:16], cout, sum2, 0);
	assign sum = {sum2, sum1};
 
endmodule
