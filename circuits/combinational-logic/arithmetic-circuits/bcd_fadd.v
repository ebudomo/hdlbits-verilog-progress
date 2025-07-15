module bcd_fadd(
	input [3:0] a,
	input [3:0] b,
	input     cin,
	output   cout,
	output [3:0] sum 
);
	 wire [4:0] binary_sum;
    wire [4:0] corrected_sum;
    wire       correction_needed;

    // step 1: add a, b, and carry-in
    assign binary_sum = a + b + cin;

    // step 2: determine if correction is needed (sum > 9 or carry-out)
    assign correction_needed = (binary_sum > 5'd9);

    // step 3: if correction is needed, add 6 (BCD correction)
    assign corrected_sum = correction_needed ? (binary_sum + 5'd6) : binary_sum;

    // Step 4: output sum and carry-out
    assign sum  = corrected_sum[3:0];
    assign cout = corrected_sum[4];  // carry-out is the MSB of the corrected sum
	 
endmodule
