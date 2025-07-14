module thermostat(
	input too_cold,
	input too_hot,
	input mode,
	input fan_on,
	output heater,
	output aircon,
	output fan
);
	// a circuit that will control the heater, AC, and blower fan
	// similar to ringer, try to use only assign statements
	assign heater = mode & too_cold;
	assign aircon = ~mode & too_hot;
	assign fan = heater | aircon | fan_on;
	
endmodule
