module module_cseladd(
	input [31:0] a,
   input [31:0] b,
   output reg [31:0] sum
);
	// carry-select adder
	wire [15:0] sum1, sum2a, sum2b;
   wire cout;
	
	// dummy cout wires to avoid error 10663 in second-stage adders
	// in exercise, these couts are ignored
	wire couta, coutb;
	
	// first-stage adder taking 16 lower bits of two inputs
   add16 add16_1 (a[15:0], b[15:0], 0, sum1, cout);
	
	// two second-stage adders taking 16 upper bits of two inputs
   add16 add16_2a (a[31:16], b[31:16], 0, sum2a, couta);
   add16 add16_2b (a[31:16], b[31:16], 1, sum2b, coutb);
   
	// 2-1 mux to select correct sum
   always @(*) begin
		case (cout)
			1'b0 : sum = {sum2a, sum1};
         1'b1 : sum = {sum2b, sum1};
      endcase
	end
endmodule
