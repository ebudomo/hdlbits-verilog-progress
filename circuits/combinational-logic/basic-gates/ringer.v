module ringer(
	input ring,
	input vibrate_mode,
	output ringer,
	output motor
);
	// design a circuit to control a cellphone's ringer and vibration
	// challenge: try to use only assign statements
	// translating a problem description into a collection of logic gates
	// design hint: rather than approaching from a programming perspective
	// (sequential, imperative: if inputs are x then output should be y)
	// approach hardware design from a declarative approach
	// (output should be x when inputs are y)
	
	assign ringer = ~vibrate_mode & ring;
	assign motor = vibrate_mode & ring;
	
endmodule
