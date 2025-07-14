module chip_7420( 
	input p1a, p1b, p1c, p1d,
   output p1y,
   input p2a, p2b, p2c, p2d,
   output p2y 
);
	// implement a 7420 chip
	// 8 inputs, 2 ouputs, 2 NAND gates
   assign p1y = ~(p1a & p1b & p1c & p1d);
   assign p2y = ~(p2a & p2b & p2c & p2d);

endmodule
