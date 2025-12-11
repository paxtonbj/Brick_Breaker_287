module blocks(

	input [9:0] x,
   input [9:0] y,
   input active_pixels,
	
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
	
	input alive11,
	input alive12,
	input alive13,
	input alive14,
	input alive15,	
	
	
   output reg [23:0] vga_color,

	output  [9:0] block_x,
	output  [9:0] block_y,
	output  [9:0] block_width,
	output  [9:0] block_height
	
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
	
	
	
	reg [9:0]box6_x; 
	reg [9:0]box6_y; 
	reg [9:0]box7_x;
	reg [9:0]box7_y;
	reg [9:0]box8_x;
	reg [9:0]box8_y;
	reg [9:0]box9_x;
	reg [9:0]box9_y;
	reg [9:0]box10_x;
	reg [9:0]box10_y;

	reg [9:0]box11_x;
	reg [9:0]box11_y;
	reg [9:0]box12_x;
	reg [9:0]box12_y;
	reg [9:0]box13_x;
	reg [9:0]box13_y;
	reg [9:0]box14_x;
	reg [9:0]box14_y;
	reg [9:0]box15_x;
	reg [9:0]box15_y;
					

	
	reg [9:0] box_width = 10'd124; //aiming for 5 blocks with 4 pixel spacing, 4*5 = 20, 640-20/5 = 124.
	reg [9:0] box_height = 10'd20;
	
	
	// Screen is 640 x 480
	
	wire in_box = (alive == 1'b1) &&(x >= box_x && x < box_x + box_width) && (y >= box_y && y < box_y + box_height);
	wire in_box2 = (alive2 == 1'b1) &&(x >= box2_x && x < box2_x + box_width) && (y >= box2_y && y < box2_y + box_height);
	wire in_box3 = (alive3 == 1'b1) &&(x >= box3_x && x < box3_x + box_width) && (y >= box3_y && y < box3_y + box_height);
	wire in_box4 = (alive4 == 1'b1) &&(x >= box4_x && x < box4_x + box_width) && (y >= box4_y && y < box4_y + box_height);
	wire in_box5 =  (alive5 == 1'b1) &&(x >= box5_x && x < box5_x + box_width) && (y >= box5_y && y < box5_y + box_height);
	
	wire in_box6 = (alive6 == 1'b1) &&(x >= box6_x && x < box6_x + box_width) && (y >= box6_y && y < box6_y + box_height);
	wire in_box7 = (alive7 == 1'b1) &&(x >= box7_x && x < box7_x + box_width) && (y >= box7_y && y < box7_y + box_height);
	wire in_box8 = (alive8 == 1'b1) &&(x >= box8_x && x < box8_x + box_width) && (y >= box8_y && y < box8_y + box_height);
	wire in_box9 = (alive9 == 1'b1) &&(x >= box9_x && x < box9_x + box_width) && (y >= box9_y && y < box9_y + box_height);
	wire in_box10 = (alive10 == 1'b1) &&(x >= box10_x && x < box10_x + box_width) && (y >= box10_y && y < box10_y + box_height);
	
	
	wire in_box11 = (alive11 == 1'b1) &&(x >= box11_x && x < box11_x + box_width) && (y >= box11_y && y < box11_y + box_height);
	wire in_box12= (alive12 == 1'b1) &&(x >= box12_x && x < box12_x + box_width) && (y >= box12_y && y < box12_y + box_height);
	wire in_box13 = (alive13 == 1'b1) &&(x >= box13_x && x < box13_x + box_width) && (y >= box13_y && y < box13_y + box_height);
	wire in_box14= (alive14 == 1'b1) &&(x >= box14_x && x < box14_x + box_width) && (y >= box14_y && y < box14_y + box_height);
	wire in_box15 = (alive15 == 1'b1) &&(x >= box15_x && x < box15_x + box_width) && (y >= box15_y && y < box15_y + box_height);
	
	


		
		always @(*)
	begin
		if(!active_pixels)
		begin
			vga_color = 24'd0;
		end
		// Column 1 (boxes 1, 6, 11) - Red
		else if (in_box || in_box6 || in_box11)
		begin
			vga_color = 24'hFF0000; // Red
		end
		// Column 2 (boxes 2, 7, 12) - Orange
		else if (in_box2 || in_box7 || in_box12)
		begin
			vga_color = 24'hFF7F00; // Orange
		end
		// Column 3 (boxes 3, 8, 13) - Yellow
		else if (in_box3 || in_box8 || in_box13)
		begin
			vga_color = 24'hFFFF00; // Yellow
		end
		// Column 4 (boxes 4, 9, 14) - Green
		else if (in_box4 || in_box9 || in_box14)
		begin
			vga_color = 24'h00FF00; // Green
		end
		// Column 5 (boxes 5, 10, 15) - Blue
		else if (in_box5 || in_box10 || in_box15)
		begin
			vga_color = 24'h0080FF; // Blue
		end
		else
		begin
			vga_color = 24'd0; // background
		end
	end




		assign block_x = box_x;
		assign block_y = box_y;
		assign block_width = box_width;
		assign block_height = box_height;
		
	
	always @ (*)
	begin
		
			//Row 1
			box_x = 10'd0;
			box_y = 10'd0;
			
			box2_x = box_x + 10'd128;
			box2_y = box_y;
		
			box3_x = box2_x + 10'd128;
			box3_y = box_y;
			
			box4_x = box3_x + 10'd128;
			box4_y = box_y;
			
			box5_x = box4_x + 10'd128;
			box5_y = box_y;
			
			//Row 2
			box6_x = box_x;
			box6_y = box_y + 10'd24;
			
			box7_x = box2_x;
			box7_y = box2_y + 10'd24;
			
			box8_x = box3_x;
			box8_y = box3_y + 10'd24;
			
			box9_x = box4_x;
			box9_y = box4_y + 10'd24;
			
			box10_x = box5_x;
			box10_y = box5_y + 10'd24;
			
			// Row 3
			box11_x = box_x;
			box11_y = box_y + 10'd48;
			
			box12_x = box2_x;
			box12_y = box2_y + 10'd48;
			
			box13_x = box3_x;
			box13_y = box3_y + 10'd48;
			
			box14_x = box4_x;
			box14_y = box4_y + 10'd48;
			
			box15_x = box5_x;
			box15_y = box5_y + 10'd48;
		
	end
	
endmodule