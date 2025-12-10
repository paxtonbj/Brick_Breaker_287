
module collision (

input clk,
input rst,
input [9:0] paddle_x,
input [9:0] paddle_y,
input [9:0] paddle_width,
input [9:0] paddle_height,
input [9:0] ball_x,
input [9:0] ball_y,
input [9:0] ball_width,
input [9:0] ball_height,
input [9:0] block_x,
input [9:0] block_y,
input [9:0] block_width,
input [9:0] block_height,

input alive,
input alive2,
input alive3,
input alive4,
input alive5,
input alive6,
input alive7,
input alive8,
input alive9,
input alive10,

output reg collide_paddle,

output reg collide_block,
output reg collide_block2,
output reg collide_block3,
output reg collide_block4,
output reg collide_block5,
output reg collide_block6,
output reg collide_block7,
output reg collide_block8,
output reg collide_block9,
output reg collide_block10

);


reg [9:0] block2_x;
reg [9:0] block2_y;
reg [9:0] block3_x;
reg [9:0] block3_y;
reg [9:0] block4_x;
reg [9:0] block4_y;
reg [9:0] block5_x;
reg [9:0] block5_y;

reg [9:0] block6_x;
reg [9:0] block6_y;
reg [9:0] block7_x;
reg [9:0] block7_y;
reg [9:0] block8_x;
reg [9:0] block8_y;
reg [9:0] block9_x;
reg [9:0] block9_y;
reg [9:0] block10_x;
reg [9:0] block10_y;

reg [3:0] hold;
reg go;

always @ (posedge clk or negedge rst)
begin
	if(!rst)
	begin
		hold <= 4'b0;
	end
	else if( hold == 3'd15)
	begin
		go <= 1'b1;
		hold <= 1'b0;
	end
	else
	begin
		hold <= hold + 1'b1;
	end
end
		


	
	always @ (posedge clk or negedge rst)
	begin
		if (!rst)
		begin
			collide_paddle <= 1'b0;
			collide_block <= 1'b0;
		end
		else
		begin
	
			
			
			if ((alive == 1'b1) && (ball_x < block_x + block_width) && (ball_x + ball_width > block_x) && (ball_y < block_y + block_height) && (ball_y + ball_height > block_y))
			begin
				collide_block <= 1'b1;
			end
			else if (alive == 1'b0)  // Only clear when block is dead
				begin
					collide_block <= 1'b0;
				end
			
			
			if((alive2 == 1'b1) && (ball_x < block2_x + block_width) && (ball_x + ball_width > block2_x) && (ball_y < block2_y + block_height) && (ball_y + ball_height > block2_y))
			begin
				collide_block2 <= 1'b1;
			end
			else if (alive2 == 1'b0)  // Only clear when block is dead
				begin
					collide_block2 <= 1'b0;
				end
			
			if((alive3 == 1'b1) && (ball_x < block3_x + block_width) && (ball_x + ball_width > block3_x) && (ball_y < block3_y + block_height) && (ball_y + ball_height > block3_y))
			begin
				collide_block3 <= 1'b1;
			end
			else if (alive3 == 1'b0)  // Only clear when block is dead
				begin
					collide_block3 <= 1'b0;
				end
			
			if((alive4 == 1'b1) && (ball_x < block4_x + block_width) && (ball_x + ball_width > block4_x) && (ball_y < block4_y + block_height) && (ball_y + ball_height > block4_y))
			begin
				collide_block4 <= 1'b1;
			end
			else if (alive4 == 1'b0)  // Only clear when block is dead
				begin
					collide_block4 <= 1'b0;
				end
			
			if((alive5 == 1'b1) && (ball_x < block5_x + block_width) && (ball_x + ball_width > block5_x) && (ball_y < block5_y + block_height) && (ball_y + ball_height > block5_y))
			begin
				collide_block5 <= 1'b1;
			end
			else if (alive5 == 1'b0)  // Only clear when block is dead
				begin
					collide_block5 <= 1'b0;
				end
			
			if((alive6 == 1'b1) && (ball_x < block6_x + block_width) && (ball_x + ball_width > block6_x) && (ball_y < block6_y + block_height) && (ball_y + ball_height > block6_y))
			begin
				collide_block6 <= 1'b1;
			end
			else if (alive6 == 1'b0)  // Only clear when block is dead
				begin
					collide_block6 <= 1'b0;
				end
			
			if((alive7 == 1'b1) && (ball_x < block7_x + block_width) && (ball_x + ball_width > block7_x) && (ball_y < block7_y + block_height) && (ball_y + ball_height > block7_y))
			begin
				collide_block7 <= 1'b1;
			end
			else if (alive7 == 1'b0)  // Only clear when block is dead
				begin
					collide_block7 <= 1'b0;
				end
			
			if((alive8 == 1'b1) && (ball_x < block8_x + block_width) && (ball_x + ball_width > block8_x) && (ball_y < block8_y + block_height) && (ball_y + ball_height > block8_y))
			begin
				collide_block8 <= 1'b1;
			end
			else if (alive8 == 1'b0)  // Only clear when block is dead
				begin
					collide_block8 <= 1'b0;
				end
				
			if((alive9 == 1'b1) && (ball_x < block9_x + block_width) && (ball_x + ball_width > block9_x) && (ball_y < block9_y + block_height) && (ball_y + ball_height > block9_y))
			begin
				collide_block9 <= 1'b1;
			end
			else if (alive9 == 1'b0)  // Only clear when block is dead
				begin
					collide_block9 <= 1'b0;
				end
			
			if((alive10 == 1'b1) && (ball_x < block10_x + block_width) && (ball_x + ball_width > block10_x) && (ball_y < block10_y + block_height) && (ball_y + ball_height > block10_y))
			begin
				collide_block10 <= 1'b1;
			end
			else if (alive10 == 1'b0)  // Only clear when block is dead
				begin
					collide_block10 <= 1'b0;
				end
			
			
		
			if ((go == 1'b1) && (ball_x < paddle_x + paddle_width) && (ball_x + ball_width > paddle_x) && (ball_y < paddle_y + paddle_height) && (ball_y + ball_width > paddle_y))
			begin
				collide_paddle <= 1'b1;
			end
		
			else
			begin
				collide_paddle <= 1'b0;
			end
		end
	
	end
	
	//testing all blocks
	
	always @ (*)
	begin
		
			
			
			block2_x = block_x + 10'd128;
			block2_y = block_y;
		
			block3_x = block2_x + 10'd128;
			block3_y = block_y;
			
			block4_x = block3_x + 10'd128;
			block4_y = block_y;
			
			block5_x = block4_x + 10'd128;
			block5_y = block_y;
			
			block6_x = block_x;
			block6_y = block_y + 10'd24;
			
			block7_x = block2_x;
			block7_y = block2_y + 10'd24;
			
			block8_x = block3_x;
			block8_y = block3_y + 10'd24;
			
			block9_x = block4_x;
			block9_y = block4_y + 10'd24;
			
			block10_x = block5_x;
			block10_y = block5_y + 10'd24;
	end
	
endmodule


