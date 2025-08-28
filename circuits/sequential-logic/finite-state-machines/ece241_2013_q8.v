module ece241_2013_q8(
	input clk, 
	input aresetn,
	input x,
	output z
);
	// Mealy FSM that recognizes 101 sequences from input, overlapping, with active low async reset
	// only three states permitted
	parameter A = 2'b00, B = 2'b01, C = 2'b10;
	reg [1:0] state, next;
	
	// combinational state transition logic
	always @(*) begin
		case (state)
			A : next = x ? B : A;
			B : next = x ? B : C;
			C : next = x ? B : A;
			default : next = A;
		endcase
	end
	
	// sequential flip-flop logic
	always @(posedge clk, negedge aresetn) begin
		state <= !aresetn ? A : next;
	end
	
	// combinational output logic for Mealy FSM
	assign z = (x && state == C);
	
endmodule
