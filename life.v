
module life(
input clk,
input rst,
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

output reg alive,
output reg alive2,
output reg alive3,
output reg alive4,
output reg alive5,
output reg alive6,
output reg alive7,
output reg alive8,
output reg alive9,
output reg alive10,

output reg alive11,
output reg alive12,
output reg alive13,
output reg alive14,
output reg alive15





);
	reg [3:0] hold;
	reg go;
	
	// Add delay registers to hold collision for one cycle
	reg collide_block_prev;
	reg collide_block2_prev;
	reg collide_block3_prev;
	reg collide_block4_prev;
	reg collide_block5_prev;
	reg collide_block6_prev;
	reg collide_block7_prev;
	reg collide_block8_prev;
	reg collide_block9_prev;
	reg collide_block10_prev;
	
	reg collide_block11_prev;
	reg collide_block12_prev;
	reg collide_block13_prev;
	reg collide_block14_prev;
	reg collide_block15_prev;

	
	always @ (posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			hold <= 4'd0;
			go <= 1'b0;
			collide_block_prev <= 1'b0;
			collide_block2_prev <= 1'b0;
			collide_block3_prev <= 1'b0;
			collide_block4_prev <= 1'b0;
			collide_block5_prev <= 1'b0;
			collide_block6_prev <= 1'b0;
			collide_block7_prev <= 1'b0;
			collide_block8_prev <= 1'b0;
			collide_block9_prev <= 1'b0;
			collide_block10_prev <= 1'b0;
			collide_block11_prev <= 1'b0;
			collide_block12_prev <= 1'b0;
			collide_block13_prev <= 1'b0;
			collide_block14_prev <= 1'b0;
			collide_block15_prev <= 1'b0;
		end
		else if( hold == 4'd15)
		begin
			go <= 1'b1;
			hold <= 4'd0;
		end
		else
		begin
			hold <= hold + 1'b1;
			// Store previous collision states
			collide_block_prev <= collide_block;
			collide_block2_prev <= collide_block2;
			collide_block3_prev <= collide_block3;
			collide_block4_prev <= collide_block4;
			collide_block5_prev <= collide_block5;
			collide_block6_prev <= collide_block6;
			collide_block7_prev <= collide_block7;
			collide_block8_prev <= collide_block8;
			collide_block9_prev <= collide_block9;
			collide_block10_prev <= collide_block10;
			
			collide_block11_prev <= collide_block11;
			collide_block12_prev <= collide_block12;
			collide_block13_prev <= collide_block13;
			collide_block14_prev <= collide_block14;
			collide_block15_prev <= collide_block15;

			
			
			
		end
	end
		
	always @ (posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			alive <= 1'b1;
			alive2 <= 1'b1;
			alive3 <= 1'b1;
			alive4 <= 1'b1;
			alive5 <= 1'b1;
			alive6 <= 1'b1;
			alive7 <= 1'b1;
			alive8 <= 1'b1;
			alive9 <= 1'b1;
			alive10 <= 1'b1;
			
			alive11 <= 1'b1;
			alive12 <= 1'b1;
			alive13 <= 1'b1;
			alive14 <= 1'b1;
			alive15 <= 1'b1;

			
			
			
		end
		else 
		begin
			// Use PREVIOUS cycle's collision - gives time for reflection to happen
			if((go == 1'b1) && (collide_block_prev))
			begin
				alive <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block2_prev))
			begin
				alive2 <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block3_prev))
			begin
				alive3 <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block4_prev))
			begin
				alive4 <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block5_prev))
			begin
				alive5 <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block6_prev))
			begin
				alive6 <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block7_prev))
			begin
				alive7 <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block8_prev))
			begin
				alive8 <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block9_prev))
			begin
				alive9 <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block10_prev))
			begin
				alive10 <= 1'b0;
			end
			
			if((go == 1'b1) && (collide_block11_prev))
			begin
				alive11 <= 1'b0;
			end
						if((go == 1'b1) && (collide_block12_prev))
			begin
				alive12 <= 1'b0;
			end
						if((go == 1'b1) && (collide_block13_prev))
			begin
				alive13 <= 1'b0;
			end
						if((go == 1'b1) && (collide_block14_prev))
			begin
				alive14 <= 1'b0;
			end
				if((go == 1'b1) && (collide_block15_prev))
			begin
				alive15 <= 1'b0;
			end
		end
		
	end
endmodule


