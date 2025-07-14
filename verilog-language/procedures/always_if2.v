module always_if2(
	input cpu_overheated,
	output reg shut_off_computer,
	input arrived,
	input gas_tank_empty,
	output reg keep_driving
);
	// understanding circuit design before coding
	// a small case study in how to avoid latches:
	// always specify assigned values in ALL cases
	// watch out for "Warning (10240) ... inferring latch(es)"
	always @(*) begin
		if (cpu_overheated)
			shut_off_computer = 1;
		else
			shut_off_computer = 0;
	end
	
	always @(*) begin
		if(~arrived)
			keep_driving = !gas_tank_empty;
		else
			keep_driving = 0;
	end
	
endmodule
