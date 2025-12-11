module the_ball(
	input clk,
	input rst,
	input [9:0]SW,
	input [9:0]x, 
	input [9:0]y,
	input active_pixels,
	
	input collide_paddle,
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
	input [9:0] block_x,
	input [9:0] block_y,
	input [9:0] block_width,
	input [9:0] block_height,
	input [9:0] paddle_x,      // Add paddle position input
	input [9:0] paddle_width,  // Add paddle width input
	
	output reg [23:0]vga_color,
	
	output reg [9:0] ball_x,
	output reg [9:0] ball_y,
	output reg [9:0] ball_width,
	output reg [9:0] ball_height,
	output reg lose
);
   
	//Should only allow the box to move every 60Hz, smoothes out movement.
	reg [19:0] tick_count;
	reg tick_move;
	
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			tick_count <= 0;
			tick_move  <= 0;
		end  
		else if (tick_count == 20'd416666) begin
			tick_count <= 0;
			tick_move  <= 1;
		end
		else begin
			tick_count <= tick_count + 1;
			tick_move  <= 0;
		end
	end
	
	// Screen is 640 X 480
	
	reg [9:0] box_x; 
	reg [9:0] box_y;
	reg [1:0] vx; 
	reg [1:0] vy;
	reg rflct_x; 
	reg rflct_y;
	reg hit_block;
	reg hit_block_side;
	reg paddle_hit;  // Track if we've processed this paddle collision
	
	
	
	reg [9:0] box_width  = 10'd20;
	reg [9:0] box_height = 10'd20;
	
	// Variables for paddle aiming calculations
	reg [9:0] ball_center_x;
	reg [9:0] paddle_center_x;
	reg signed [10:0] hit_offset;
	
	wire collide_any = collide_block  || collide_block2 || collide_block3 ||
					   collide_block4 || collide_block5 || collide_block6 ||
					   collide_block7 || collide_block8 || collide_block9 ||
					   collide_block10 || collide_block11 || collide_block12 ||
					   collide_block13 || collide_block14 || collide_block15;

	wire in_box = 
		(x >= box_x && x < box_x + box_width) &&
		(y >= box_y && y < box_y + box_height);
	
	always @(*) begin
		if (!active_pixels)
			vga_color = 24'h000000;
		else if (in_box)
			vga_color = 24'hffffff;  // White ball
		else
			vga_color = 24'h000000;
	end
	
	always @ (posedge clk or negedge rst)
	begin
		if (!rst)
		begin
			box_x <= 10'd310;     // Center horizontally
			box_y <= 10'd350;     // Start closer to paddle
			vx <= 2'd1;
			vy <= 2'd1;
			rflct_x <= 1'b0;
			rflct_y <= 1'b1;      // Start going UP
			hit_block <= 1'b0;
			hit_block_side <= 1'b0;
			paddle_hit <= 1'b0;
			
			ball_x <= 10'd310;
			ball_y <= 10'd350;
			ball_width <= box_width;
			ball_height <= box_height;
			
			lose <= 1'b0;
		end
		else 
		begin
			// ALWAYS sample collisions, not just during tick_move
			if (collide_any && !hit_block)
			begin
				hit_block <= 1'b1;
				
				// Better side detection: check if ball is coming from side
				// Check if ball center is well within the block's vertical span
				if ((box_y + 10'd10 > block_y + 10'd5) && (box_y + 10'd10 < block_y + 10'd39))
					hit_block_side <= 1'b1;  // Side collision - ball is at same height as blocks
				else
					hit_block_side <= 1'b0;  // Top/bottom collision - ball hitting from below
			end
			
			// Handle paddle collision detection with aiming 
			if (collide_paddle && !paddle_hit)
			begin
				paddle_hit <= 1'b1;
				rflct_y <= 1'b1;  // Always reflect up
				
				// Calculate where ball hit on paddle
				ball_center_x = box_x + 10'd10;  // Ball center
				paddle_center_x = paddle_x + (paddle_width >> 1);  // Paddle center
				hit_offset = ball_center_x - paddle_center_x;  // Offset from center
				
				// Adjust horizontal direction based on hit position
				if (hit_offset < 0)  // Hit LEFT half of paddle
				begin
					rflct_x <= 1'b1;  // Go LEFT holy crap this sucked 
				end
				else  // Hit RIGHT half of paddle
				begin
					rflct_x <= 1'b0;  
				end
			end
			
			if (!collide_paddle)
				paddle_hit <= 1'b0;
			
			if (tick_move)
			begin
				// X-reflection (wall bouncing)
				if(box_x <= 10'd1)
				begin
					rflct_x <= 1'b0;  // Hit left wall, go right
					box_x <= 10'd1;    // Clamp position
				end
				if(box_x + box_width >= 10'd639)
				begin
					rflct_x <= 1'b1;  // Hit right wall, go left
					box_x <= 10'd639 - box_width;  // Clamp position
				end
				
				// Move horizontally based on reflection state
				if (rflct_x == 1'b1)
					box_x <= box_x - vx;
				else
					box_x <= box_x + vx;
				
				// Y-reflection
				if(box_y == 10'd0)
					rflct_y <= 1'b0;
				// No bottom wall reflection - let ball fall through for loss condition
				if(box_y == 10'd480)
					lose <= 1'b1;
				// Handle block collisions
				if(hit_block)
				begin
					if (hit_block_side)
					begin
						rflct_x <= ~rflct_x;  // Flip horizontal direction
						rflct_y <= 1'b0;      // ALSO reflect down
					end
					else
						rflct_y <= 1'b0;  // Reflect down (vertical)
					
					hit_block <= 1'b0;
					hit_block_side <= 1'b0;
				end
				
				// Now move based on reflection state
				if (rflct_y == 1'b1)
					box_y <= box_y - vy;
				else
					box_y <= box_y + vy;
				
				ball_x <= box_x;
				ball_y <= box_y;
				ball_width <= box_width;
				ball_height <= box_height;
			end
		end
	end 

endmodule