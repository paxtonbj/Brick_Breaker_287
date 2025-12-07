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


	
	reg [9:0] box_width = 10'd124; //aiming for 5 blocks with 4 pixel spacing, 4*5 = 20, 640-20/5 = 124.
	reg [9:0] box_height = 10'd20;
	
	
	// Screen is 640 x 480
	
	wire in_box = (x >= box_x && x < box_x + box_width) && (y >= box_y && y < box_y + box_height);
	wire in_box2 = (x >= box2_x && x < box2_x + box_width) && (y >= box2_y && y < box2_y + box_height);
	wire in_box3 = (x >= box3_x && x < box3_x + box_width) && (y >= box3_y && y < box3_y + box_height);
	wire in_box4 = (x >= box4_x && x < box4_x + box_width) && (y >= box4_y && y < box4_y + box_height);
	wire in_box5 = (x >= box5_x && x < box5_x + box_width) && (y >= box5_y && y < box5_y + box_height);
	
	wire in_box6 = (x >= box6_x && x < box6_x + box_width) && (y >= box6_y && y < box6_y + box_height);
	wire in_box7 = (x >= box7_x && x < box7_x + box_width) && (y >= box7_y && y < box7_y + box_height);
	wire in_box8 = (x >= box8_x && x < box8_x + box_width) && (y >= box8_y && y < box8_y + box_height);
	wire in_box9 = (x >= box9_x && x < box9_x + box_width) && (y >= box9_y && y < box9_y + box_height);
	wire in_box10 = (x >= box10_x && x < box10_x + box_width) && (y >= box10_y && y < box10_y + box_height);
	
	
	always @(*)
		begin
		

		
		if(!active_pixels)
		 begin
			
			vga_color = 24'd0;
			
		 end
		 else if( ((in_box && (alive == 1'b1)) | (in_box2 && (alive2 == 1'b1)) | (in_box3 && (alive3 == 1'b1)) 
				  | (in_box4 && (alive4 == 1'b1)) | (in_box5 && (alive5 == 1'b1)) | (in_box6 && (alive6 == 1'b1)) 
				  | (in_box7 && (alive7 == 1'b1)) | (in_box8 && (alive8 == 1'b1)) | (in_box9 && (alive9 == 1'b1)) 
				  | (in_box10 && (alive10 == 1'b1)) ))
		  begin
				vga_color = 24'hffffff; // change value to change color, ffffff = white.
		  end
		 else
		  begin
				vga_color= 24'd0;
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
		
	end
	
endmodule
	
			
			
			
			
			
			