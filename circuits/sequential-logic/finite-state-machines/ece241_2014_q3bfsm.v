module ece241_2014_q3bfsm (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
	// given a state-assigned table, implement the FSM
	parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4;
   reg [2:0] state, next;
    
   always @(*) begin
		case (state)
			A: next = x ? B : A;
			B: next = x ? E : B;
			C: next = x ? B : C;
			D: next = x ? C : B;
			E: next = x ? E : D;
			default: next = A;
		endcase
	end
    
   always @(posedge clk) begin
		state <= reset ? A : next;
   end
    
   assign z = (state == D || state == E);
    
endmodule
