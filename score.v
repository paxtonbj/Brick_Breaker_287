module score (
	input clk,
	input rst,
	input lose,
	input collide_block,
	input collide_block2,
	input collide_block3,
	input collide_block4,
	input collide_block5,
	input collide_block6,
	input collide_block7,
	input collide_block8,
	input collide_block9,
	input collide_block10,
	input collide_block11,
	input collide_block12,
	input collide_block13,
	input collide_block14,
	input collide_block15,
	
	output reg [7:0] score
);

	// Previous collision state registers to detect edges
	reg prev_collide_block;
	reg prev_collide_block2;
	reg prev_collide_block3;
	reg prev_collide_block4;
	reg prev_collide_block5;
	reg prev_collide_block6;
	reg prev_collide_block7;
	reg prev_collide_block8;
	reg prev_collide_block9;
	reg prev_collide_block10;
	reg prev_collide_block11;
	reg prev_collide_block12;
	reg prev_collide_block13;
	reg prev_collide_block14;
	reg prev_collide_block15;

	always @ (posedge clk or negedge rst) begin
		if(!rst) begin
			score <= 8'd0;
			prev_collide_block <= 1'b0;
			prev_collide_block2 <= 1'b0;
			prev_collide_block3 <= 1'b0;
			prev_collide_block4 <= 1'b0;
			prev_collide_block5 <= 1'b0;
			prev_collide_block6 <= 1'b0;
			prev_collide_block7 <= 1'b0;
			prev_collide_block8 <= 1'b0;
			prev_collide_block9 <= 1'b0;
			prev_collide_block10 <= 1'b0;
			prev_collide_block11 <= 1'b0;
			prev_collide_block12 <= 1'b0;
			prev_collide_block13 <= 1'b0;
			prev_collide_block14 <= 1'b0;
			prev_collide_block15 <= 1'b0;
		end
		else begin
			// Count points for rising edges only (detect when collision goes from 0 to 1)
			// This ensures we only add 10 points once per block collision
			if(collide_block && !prev_collide_block)
				score <= score + 8'd10;
			else if(collide_block2 && !prev_collide_block2)
				score <= score + 8'd10;
			else if(collide_block3 && !prev_collide_block3)
				score <= score + 8'd10;
			else if(collide_block4 && !prev_collide_block4)
				score <= score + 8'd10;
			else if(collide_block5 && !prev_collide_block5)
				score <= score + 8'd10;
			else if(collide_block6 && !prev_collide_block6)
				score <= score + 8'd10;
			else if(collide_block7 && !prev_collide_block7)
				score <= score + 8'd10;
			else if(collide_block8 && !prev_collide_block8)
				score <= score + 8'd10;
			else if(collide_block9 && !prev_collide_block9)
				score <= score + 8'd10;
			else if(collide_block10 && !prev_collide_block10)
				score <= score + 8'd10;
			else if(collide_block11 && !prev_collide_block11)
				score <= score + 8'd10;
			else if(collide_block12 && !prev_collide_block12)
				score <= score + 8'd10;
			else if(collide_block13 && !prev_collide_block13)
				score <= score + 8'd10;
			else if(collide_block14 && !prev_collide_block14)
				score <= score + 8'd10;
			else if(collide_block15 && !prev_collide_block15)
				score <= score + 8'd10;
				
			if (lose)
				score <= 8'd0;
			
			// Update previous states for next cycle (at the end)
			prev_collide_block <= collide_block;
			prev_collide_block2 <= collide_block2;
			prev_collide_block3 <= collide_block3;
			prev_collide_block4 <= collide_block4;
			prev_collide_block5 <= collide_block5;
			prev_collide_block6 <= collide_block6;
			prev_collide_block7 <= collide_block7;
			prev_collide_block8 <= collide_block8;
			prev_collide_block9 <= collide_block9;
			prev_collide_block10 <= collide_block10;
			prev_collide_block11 <= collide_block11;
			prev_collide_block12 <= collide_block12;
			prev_collide_block13 <= collide_block13;
			prev_collide_block14 <= collide_block14;
			prev_collide_block15 <= collide_block15;
		end
	end
endmodule