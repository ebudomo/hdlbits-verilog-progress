module conwaylife(
	input clk,
	input load,
	input [255:0] data,
	output reg [255:0] q
);
	// Conway's Game of Life on a 16x16 toroidal grid
	reg [255:0] q_next;
	
	// x y coords of current cell
	integer x, y;
	// x y coords of surrounding cells in 3x3 grid
	integer dx, dy; 
	// x y coords of neighbours
	integer nx, ny; 
	// indices of current cell and neighbours
	integer idx, nidx;
	// number of neighbours
	integer neighbours;
	
	// traverse each cell using x-y coords
	// x: column, y: row, where each row has 16 cells
	always @(*) begin
		for (y=0; y<16; y=y+1) begin
			for (x=0; x<16; x=x+1) begin
				neighbours = 0;
				// check 8 surrounding cells
				for (dy=-1;dy<=1;dy=dy+1) begin
					for (dx=-1; dx<=1; dx=dx+1) begin
						if (dy != 0 || dx != 0) begin // ignore current cell
							// determine index of neighbours using modulo for toroidal 16x16 array
							nx = (x+dx+16)%16;
							ny = (y+dy+16)%16;
							nidx = ny*16+nx;
							neighbours = neighbours + q[nidx];
						end
					end
				end
				// applying game rules for cells traversed
				idx = y*16+x;
				case (neighbours)
					2 : q_next[idx] = q[idx];		// stays the same
					3 : q_next[idx] = 1'b1;			// becomes alive
					default : q_next[idx] = 1'b0; // dies or stays dead
				endcase
			end
		end
	end
	
	// flip-flop to advance game state
	always @(posedge clk) begin
		if (load)
			q <= data;
		else
			q <= q_next;
	end
	
endmodule
