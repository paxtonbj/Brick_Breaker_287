
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
	output		          		VGA_VS
	
	
	);
	
	assign clk = CLOCK_50;
	assign rst = SW[0];
	
	wire [9:0] x;
   wire [9:0] y;
   wire active_pixels;

   wire [23:0] paddle_color;  //vga_color
   wire [23:0] blocks_color;
	wire [23:0] ball_color;

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
	 
	 

	
	paddle my_paddle(clk,rst,KEY,SW,x,y,active_pixels,paddle_color, paddle_x, paddle_y, paddle_width, paddle_height);
	
	blocks my_blocks(x,y,active_pixels, alive, alive2, alive3, alive4, alive5, alive6, alive7,alive8,alive9,alive10, blocks_color, block_x, block_y, block_width, block_height);
	
	the_ball my_ball(clk,rst,SW,x,y,active_pixels, collide_paddle, collide_block, collide_block2, collide_block3,
						  collide_block4, collide_block5, collide_block6, collide_block7, collide_block8, collide_block9, collide_block10,
						  ball_color, ball_x, ball_y, ball_width, ball_height);
	
	collision my_collision(clk,rst,paddle_x,paddle_y,paddle_width,paddle_height,
							    ball_x, ball_y, ball_width, ball_height,
							    block_x, block_y, block_width, block_height, 
								 alive,alive2,alive3,alive4,alive5,alive6,alive7,alive8,alive9,alive10, collide_paddle, 
								 collide_block, collide_block2, collide_block3, collide_block4,
								 collide_block5, collide_block6, collide_block7, collide_block8,
								 collide_block9, collide_block10 );
	
	life my_alive(clk,rst,
	collide_block,collide_block2,collide_block3,collide_block4,collide_block5,
	collide_block6,collide_block7,collide_block8,collide_block9,collide_block10,
	alive,alive2,alive3,alive4,alive5,alive6,alive7,alive8,alive9,alive10);
						  
	

	

	
	reg [23:0] final_color;
	
	    always @(*) begin
        final_color = 24'h000000;   // black background

       
        if (blocks_color != 24'h000000)
            final_color = blocks_color;

        
        if (paddle_color != 24'h000000)
            final_color = paddle_color;
			
		  if (ball_color != 24'h0000000)
			final_color = ball_color;
    end

    always @(*) begin
        VGA_R = final_color[23:16];
        VGA_G = final_color[15:8];
        VGA_B = final_color[7:0];
    end


endmodule
	
	
	
	
	
	
	

