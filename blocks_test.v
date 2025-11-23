module blocks_test(



	input CLOCK_50, 
	//input [1:0] KEY,
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
	
	
	
	wire clk;
	wire rst;
	reg [9:0]x; 
	reg [9:0]y;
	wire active_pixles;

	assign clk = CLOCK_50;
	assign rst = SW[0];
	
	vga_driver the_vga(
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
	
	
	reg [9:0] box_x; //x-cord
	reg [9:0] box_y; //y-cord
	
	reg [9:0]box2_x;
	reg [9:0]box2_y;
	
	reg [9:0]box3_x;
	reg [9:0]box3_y;
	
	reg [9:0]box4_x;
	reg [9:0]box4_y;
	
	reg [9:0]box5_x;
	reg [9:0]box5_y;

	
	reg [9:0] box_width = 10'd124; //aiming for 5 blocks with 4 pixel spacing, 4*5 = 20, 640-20/5 = 124.
	reg [9:0] box_height = 10'd20;
	
	
	// Screen is 640 x 480
	
	wire in_box = (x >= box_x && x < box_x + box_width) && (y >= box_y && y < box_y + box_height);
	wire in_box2 = (x >= box2_x && x < box2_x + box_width) && (y >= box2_y && y < box2_y + box_height);
	wire in_box3 = (x >= box3_x && x < box3_x + box_width) && (y >= box3_y && y < box3_y + box_height);
	wire in_box4 = (x >= box4_x && x < box4_x + box_width) && (y >= box4_y && y < box4_y + box_height);
	wire in_box5 = (x >= box5_x && x < box5_x + box_width) && (y >= box5_y && y < box5_y + box_height);
	
	always @(*)
		begin
		

		{VGA_R, VGA_G, VGA_B} = vga_color;
		
		if(!active_pixels)
		 begin
			
			vga_color = 24'd0;
			
		 end
		 else if (in_box | in_box2 | in_box3 | in_box4 | in_box5)
		  begin
				vga_color = 24'hfffffff; // change value to change color, ffffff = white.
		  end
		 else
		  begin
				vga_color= 24'd0;
		  end
		
		end

		
		reg [23:0] vga_color;
	
	always @ (*)
	begin
		
			box_x = 10'd0;
			box_y = 10'd4;
			
			box2_x = box_x + 10'd128;
			box2_y = box_y;
		
			box3_x = box2_x + 10'd128;
			box3_y = box_y;
			
			box4_x = box3_x + 10'd128;
			box4_y = box_y;
			
			box5_x = box4_x + 10'd128;
			box5_y = box_y;
			
		
	end
	
endmodule
		
			
			
			
			
			
			