module game (
	input CLOCK_50, 
	input [1:0]KEY,
	input [9:0]SW,
	output		          		VGA_BLANK_N,
	output reg	     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output reg	     [7:0]		VGA_G,
	output		          		VGA_HS,
	output reg	     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,
	output           [6:0]     HEX0,
	output           [6:0]     HEX1,
	output           [6:0]     HEX2
	
);
	
	assign clk = CLOCK_50;
	assign rst = SW[0];
	
	wire [9:0] x;
	wire [9:0] y;
	wire active_pixels;
	wire [23:0] paddle_color;
	wire [23:0] blocks_color;
	wire [23:0] ball_color;
	wire [23:0] win_color;
	wire [23:0] lose_color;
	// VGA driver
	vga_driver vga(
		.clk(clk),
		.rst(rst),
		.vga_clk(VGA_CLK),
		.hsync(VGA_HS),
		.vsync(VGA_VS),
		.active_pixels(active_pixels),
		.xPixel(x),
		.yPixel(y),
		.VGA_BLANK_N(VGA_BLANK_N),
		.VGA_SYNC_N(VGA_SYNC_N)
	);
	
	wire [9:0] paddle_x;
	wire [9:0] paddle_y;
	wire [9:0] paddle_width;
	wire [9:0] paddle_height;
	
	wire [9:0] ball_x;
	wire [9:0] ball_y;
	wire [9:0] ball_width;
	wire [9:0] ball_height;
	
	wire [9:0] block_x;
	wire [9:0] block_y;
	wire [9:0] block_width;
	wire [9:0] block_height;
	
	wire collide_paddle;
	wire collide_block;
	wire collide_block2;
	wire collide_block3;
	wire collide_block4;
	wire collide_block5;
	wire collide_block6;
	wire collide_block7;
	wire collide_block8;
	wire collide_block9;
	wire collide_block10;
	wire collide_block11;
	wire collide_block12;
	wire collide_block13;
	wire collide_block14;
	wire collide_block15;
	
	wire alive;
	wire alive2;
	wire alive3;
	wire alive4;
	wire alive5;
	wire alive6;
	wire alive7;
	wire alive8;
	wire alive9;
	wire alive10;
	wire alive11;
	wire alive12;
	wire alive13;
	wire alive14;
	wire alive15;
	
	reg win;
	wire lose;
	reg [7:0] score;
	
	paddle my_paddle(
		.clk(clk),
		.rst(rst),
		.KEY(KEY),
		.SW(SW),
		.x(x),
		.y(y),
		.active_pixels(active_pixels),
		.vga_color(paddle_color),
		.paddle_x(paddle_x),
		.paddle_y(paddle_y),
		.paddle_width(paddle_width),
		.paddle_height(paddle_height)
	);
	
	blocks my_blocks(
		.x(x),
		.y(y),
		.active_pixels(active_pixels),
		.alive(alive),
		.alive2(alive2),
		.alive3(alive3),
		.alive4(alive4),
		.alive5(alive5),
		.alive6(alive6),
		.alive7(alive7),
		.alive8(alive8),
		.alive9(alive9),
		.alive10(alive10),
		.alive11(alive11),
		.alive12(alive12),
		.alive13(alive13),
		.alive14(alive14),
		.alive15(alive15),
		.vga_color(blocks_color),
		.block_x(block_x),
		.block_y(block_y),
		.block_width(block_width),
		.block_height(block_height)
	);
	
	the_ball my_ball(
		.clk(clk),
		.rst(rst),
		.SW(SW),
		.x(x),
		.y(y),
		.active_pixels(active_pixels),
		.collide_paddle(collide_paddle),
		.collide_block(collide_block),
		.collide_block2(collide_block2),
		.collide_block3(collide_block3),
		.collide_block4(collide_block4),
		.collide_block5(collide_block5),
		.collide_block6(collide_block6),
		.collide_block7(collide_block7),
		.collide_block8(collide_block8),
		.collide_block9(collide_block9),
		.collide_block10(collide_block10),
		.collide_block11(collide_block11),
		.collide_block12(collide_block12),
		.collide_block13(collide_block13),
		.collide_block14(collide_block14),
		.collide_block15(collide_block15),
		.block_x(block_x),
		.block_y(block_y),
		.block_width(block_width),          // FIXED: was block_wdith
		.block_height(block_height),
		.paddle_x(paddle_x),                // ADDED: needed for aiming
		.paddle_width(paddle_width),			// ADDED: needed for aiming
		.win(win),										
		.vga_color(ball_color),
		.ball_x(ball_x),
		.ball_y(ball_y),
		.ball_width(ball_width),
		.ball_height(ball_height),
		.lose(lose)
	);
	
	collision my_collision(
		.clk(clk),
		.rst(rst),
		.paddle_x(paddle_x),
		.paddle_y(paddle_y),
		.paddle_width(paddle_width),
		.paddle_height(paddle_height),
		.ball_x(ball_x),
		.ball_y(ball_y),
		.ball_width(ball_width),
		.ball_height(ball_height),
		.block_x(block_x),
		.block_y(block_y),
		.block_width(block_width),
		.block_height(block_height),
		.alive(alive),
		.alive2(alive2),
		.alive3(alive3),
		.alive4(alive4),
		.alive5(alive5),
		.alive6(alive6),
		.alive7(alive7),
		.alive8(alive8),
		.alive9(alive9),
		.alive10(alive10),
		.alive11(alive11),
		.alive12(alive12),
		.alive13(alive13),
		.alive14(alive14),
		.alive15(alive15),
		.collide_paddle(collide_paddle),
		.collide_block(collide_block),
		.collide_block2(collide_block2),
		.collide_block3(collide_block3),
		.collide_block4(collide_block4),
		.collide_block5(collide_block5),
		.collide_block6(collide_block6),
		.collide_block7(collide_block7),
		.collide_block8(collide_block8),
		.collide_block9(collide_block9),
		.collide_block10(collide_block10),
		.collide_block11(collide_block11),
		.collide_block12(collide_block12),
		.collide_block13(collide_block13),
		.collide_block14(collide_block14),
		.collide_block15(collide_block15)
	);
	
	life my_alive(
		.clk(clk),
		.rst(rst),
		.collide_block(collide_block),
		.collide_block2(collide_block2),
		.collide_block3(collide_block3),
		.collide_block4(collide_block4),
		.collide_block5(collide_block5),
		.collide_block6(collide_block6),
		.collide_block7(collide_block7),
		.collide_block8(collide_block8),
		.collide_block9(collide_block9),
		.collide_block10(collide_block10),
		.collide_block11(collide_block11),
		.collide_block12(collide_block12),
		.collide_block13(collide_block13),
		.collide_block14(collide_block14),
		.collide_block15(collide_block15),
		.alive(alive),
		.alive2(alive2),
		.alive3(alive3),
		.alive4(alive4),
		.alive5(alive5),
		.alive6(alive6),
		.alive7(alive7),
		.alive8(alive8),
		.alive9(alive9),
		.alive10(alive10),
		.alive11(alive11),
		.alive12(alive12),
		.alive13(alive13),
		.alive14(alive14),
		.alive15(alive15)
	);
	
	
	
	win my_win (x, y, win,active_pixels, win_color);
	lose my_lose (x, y, lose,active_pixels, lose_color);
	
	score my_score (.clk(clk), .rst(rst), .lose(lose), .collide_block(collide_block),
		.collide_block2(collide_block2), .collide_block3(collide_block3),
		.collide_block4(collide_block4),	.collide_block5(collide_block5),		
		.collide_block6(collide_block6), .collide_block7(collide_block7),
		.collide_block8(collide_block8), .collide_block9(collide_block9),
		.collide_block10(collide_block10), .collide_block11(collide_block11),
		.collide_block12(collide_block12), .collide_block13(collide_block13),
		.collide_block14(collide_block14), .collide_block15(collide_block15),
		.score(score) );
		
		
	reg [3:0] seg_ones;
	reg [3:0] seg_tens;
	reg [3:0] seg_hunds;
	
	seven_segment seg0 ( seg_ones,HEX0);
	seven_segment seg1 (seg_tens, HEX1);
	seven_segment seg10 (seg_hunds, HEX2);
	
	always @ (*)
	begin
		seg_ones = score % 10;
		seg_tens = (score / 10) % 10;
		seg_hunds = score / 100;
		
	end
	
	always @ (*)
	begin
		if (!alive && !alive2 && !alive3 && !alive4 && !alive5 && !alive6 && !alive7 && !alive8 && !alive9 && !alive10 && !alive11 && !alive12 && !alive13 && !alive14 && !alive15 && lose == 1'b0)
		begin
			win = 1'b1;
		end
		else
			win = 1'b0;
			
	end

	
	reg [23:0] final_color;
	
	always @(*) begin
		final_color = 24'h000000;   // black background
		
		if ((blocks_color != 24'h000000)&& !lose) 
			final_color = blocks_color;
		
		if ((paddle_color != 24'h000000) && !win && !lose)
			final_color = paddle_color;
		
		if ((ball_color != 24'h000000) && !win && !lose)    
			final_color = ball_color;
			
		if((win_color != 24'h0000000))
			final_color = win_color;
			
		if((lose_color != 24'h0000000))
			final_color = lose_color;
	
			
	end
	
	always @(*) begin
		VGA_R = final_color[23:16];
		VGA_G = final_color[15:8];
		VGA_B = final_color[7:0];
	end
	
endmodule