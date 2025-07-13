module module_shift8(
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output reg [7:0] q
);
	/*
	// implementing 3 length shift register
	// ports are now 8 bits
	// shift register connects to 4-1 mux
	// sel selects how many cycles to delay the input (0-3 clock cycles)
	*/
	
	wire [7:0] a, b, c;    
	
	// three sets of 8 D flip-flops
   my_dff8 dff8_1 ( clk, d, a );
   my_dff8 dff8_2 ( clk, a, b );
   my_dff8 dff8_3 ( clk, b, c );
	
	// 4-1 mux using combinational always block
	always @(*) begin	
		case (sel)
			2'h0 : q = d;
			2'h1 : q = a;
			2'h2 : q = b;
			2'h3 : q = c;
		endcase
	end
endmodule

module my_dff8(
	input clk,
	input [7:0] d,
	output [7:0] q
);
	// module body, left blank
endmodule
