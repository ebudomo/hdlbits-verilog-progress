module fsm3comb(
	input in,
	input [1:0] state,
	output reg [1:0] next,
	output out
);
	// given a state transition table implement the Moore machine
	// only using state transition logic and output logic
	parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
	
	// combinational logic for state transitions
	always @(*) begin
		case ({state, in})
			3'b000 : next = state;
			3'b001 : next = B;
			3'b010 : next = C;
			3'b011 : next = state;
			3'b100 : next = A;
			3'b101 : next = D;
			3'b110 :	next = C;
			3'b111 : next = B;
		endcase 
	end
	
	// output logic
	assign out = (state == D);
	
endmodule
