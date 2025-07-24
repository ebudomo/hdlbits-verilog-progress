module ece241_2013_q4(
	input clk,
	input reset,
	input [3:1] s,
	output fr3, 
	output fr2,
	output fr1,
	output dfr
);
	// Moore FSM exam problem: water reservoir with sensors
	// turn on appropriate sensors based on water level
	// and whether water level is rising or falling
	
	// 6 states described in combinational output logic block at bottom
	parameter A1=3'b000, B1=3'b001, B2=3'b010, C1=3'b011, C2=3'b100, D1=3'b101;
	reg [2:0] state, next;
	reg [3:0] fr;
	assign {fr3, fr2, fr1, dfr} = fr;
	 
	// edge-triggered state flip-flops, sync reset
	always @(posedge clk) begin
		if (reset)
			state <= A1;
		else
			state <= next;
	end
	 
	// state transition logic in combinational block: Moore machine
	// depends on current state + input: is the water level increasing or decreasing? check sensors
	always@(*) begin
		case (state)
			A1 : next = s[1] ? B1 : A1;
			B1 : next = s[2] ? C1 : (s[1] ? B1 : A1);
			B2 : next = s[2] ? C1 : (s[1] ? B2 : A1);
			C1 : next = s[3] ? D1 : (s[2] ? C1 : B2);
			C2 : next = s[3] ? D1 : (s[2] ? C2 : B2);
			D1 : next = s[3] ? D1 : C2;
			default : next = 3'bxxx; // don't cares
		endcase
	end
	 
	// output logic in combinational block
	always@(*) begin
		case (state)
			A1 : fr = 4'b1111;	// below s1
			B1 : fr = 4'b0110; 	// btwn s1 and s2 nominal
			B2 : fr = 4'b0111; 	// btwn s1 and s2 + supplemental
			C1 : fr = 4'b0010; 	// btwn s2 and s3 nominal
			C2 : fr = 4'b0011; 	// btwn s2 and s3 + supplemental
			D1 : fr = 4'b0000;	// above s3
			default : fr = 3'bxxx; // don't cares
		endcase
	end
 
endmodule
