module module_name(
	input a,
	input b, 
	input c,
	input d,
	input out1,
	input out2
);
	//connecting ports by name
	//using mod_pos_a found in mod_pos.v
	mod_pos_a instance_1 ( .out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d) );

endmodule
	