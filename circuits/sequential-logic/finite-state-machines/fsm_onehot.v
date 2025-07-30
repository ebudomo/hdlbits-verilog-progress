module fsm_onehot(
	input in,
	input [9:0] state,
	output [9:0] next_state,
	output out1,
	output out2
);
	// a "simple" Mealy FSM, given a state transition diagram and assuming one-hot encoding,
	// implement the state transition logic and output logic by inspection
	// i.e. using combinational logic, inspect in-edges of diagram to develop machine
	// HDLBits website uses testbench that provides state and in inputs
	// testbench also tests non-one hot inputs
	
	// state transition logic
	assign next_state[0] = (state[0] & ~in) | (state[1] & ~in) | (state[2] & ~in) | (state[3] & ~in) | (state[4] & ~in) | (state[7] & ~in) | (state[8] & ~in) | (state[9] & ~in);
   assign next_state[1] = (state[0] &  in) | (state[8] & in) | (state[9] & in);
   assign next_state[2] = (state[1] & in);
   assign next_state[3] = (state[2] & in);
   assign next_state[4] = (state[3] & in);
   assign next_state[5] = (state[4] & in);
   assign next_state[6] = (state[5] & in);
   assign next_state[7] = (state[6] & in) | (state[7] & in);
   assign next_state[8] = (state[5] & ~in);
   assign next_state[9] = (state[6] & ~in);
	
	// output logic
	assign out1 = (state[8] | state[9]);
   assign out2 = (state[7] | state[9]);
	
endmodule
