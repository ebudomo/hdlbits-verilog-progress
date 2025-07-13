module module_instance(
	input a,
	input b,
	output out1,
	output out2
);
	//instantiating mod_a and connecting ports by name
	mod_inst_a instance_1 (
		.in1(a),
		.in2(b),
		.out(out1)
	);
	
	//connecting ports by position
	mod_inst_a instance_2 ( a, b, out2);

endmodule

module mod_inst_a(
	input in1,
	input in2,
	output out 
);
	//module body

endmodule 