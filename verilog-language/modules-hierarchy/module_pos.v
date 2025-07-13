module module_pos(
	input a, 
	input b,
	input c,
	input d,
	output out1,
	output out2
);
	//connecting ports by position
	mod_pos_a instance_1 ( out1, out2, a, b, c, d );

endmodule 

module mod_pos_a( 
	output out1, 
	output out2, 
	input in1, 
	input in2, 
	input in3, 
	input in4 
);
	//module body
endmodule
