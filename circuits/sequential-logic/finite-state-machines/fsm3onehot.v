module fsm3onehot(
	input in,
	input [3:0] state,
	output [3:0] next,
	output out
);
	// Moore machine with one-hot state encoding given state transition table
	// required to derive state transition and output logic equations by inspection
	// equations derived by looking at in-edges of state transition diagram
	parameter A=4'h0, B=4'h1, C=4'h2, D=4'h3;
	
	// in this exercise, rather than always blocks, we simply use logic equation assignments
	assign next[A] = state[A]&(~in) | state[C]&(~in);
	assign next[B] = state[A]&in | state[B]&in | state[D]&in;
	assign next[C] = state[B]&(~in) | state[D]&(~in);
	assign next[D] = state[C]&in;
	
	assign out = state[D];

endmodule 
	