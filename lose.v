module lose(

	input [9:0] x,
   input [9:0] y,
	input lose, 
   input active_pixels,
	

	
   output reg [23:0] vga_color




	
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
	
	reg [9:0] box6_x;
   reg [9:0] box6_y;

   reg [9:0] box7_x;
   reg [9:0] box7_y;

	reg [9:0] box8_x;
   reg [9:0] box8_y;

   reg [9:0] box9_x;
   reg [9:0] box9_y;

   reg [9:0] box10_x;
   reg [9:0] box10_y;

   reg [9:0] box11_x;
   reg [9:0] box11_y;

   reg [9:0] box12_x;
   reg [9:0] box12_y;

   reg [9:0] box13_x;
   reg [9:0] box13_y;

   reg [9:0] box14_x;
   reg [9:0] box14_y;

   reg [9:0] box15_x;
   reg [9:0] box15_y;

   reg [9:0] box16_x;
   reg [9:0] box16_y;

   reg [9:0] box17_x;
   reg [9:0] box17_y;

   reg [9:0] box18_x;
   reg [9:0] box18_y;

   reg [9:0] box19_x;
   reg [9:0] box19_y;

   reg [9:0] box20_x;
   reg [9:0] box20_y;

   reg [9:0] box21_x;
   reg [9:0] box21_y;

   reg [9:0] box22_x;
   reg [9:0] box22_y;
	
	reg [9:0] box23_x;
	reg [9:0] box23_y;
	
	reg [9:0] box24_x;
	reg [9:0] box24_y;
	
	reg [9:0] box_width = 10'd20; 
	reg [9:0] box_height = 10'd100;
	
    reg [9:0] box2_width  = 10'd20;
    reg [9:0] box2_height = 10'd100;

    reg [9:0] box3_width  = 10'd20;
    reg [9:0] box3_height = 10'd100;

    reg [9:0] box4_width  = 10'd20;
    reg [9:0] box4_height = 10'd200;

    reg [9:0] box5_width  = 10'd60;
    reg [9:0] box5_height = 10'd20;

    reg [9:0] box6_width  = 10'd60;
    reg [9:0] box6_height = 10'd20;

    reg [9:0] box7_width  = 10'd20;
    reg [9:0] box7_height = 10'd200;

    reg [9:0] box8_width  = 10'd20;
    reg [9:0] box8_height = 10'd200;

    reg [9:0] box9_width  = 10'd60;
    reg [9:0] box9_height = 10'd20;

    reg [9:0] box10_width  = 10'd20;
    reg [9:0] box10_height = 10'd200;

    reg [9:0] box11_width  = 10'd20;
    reg [9:0] box11_height = 10'd200;

    reg [9:0] box12_width  = 10'd60;
    reg [9:0] box12_height = 10'd20;

    reg [9:0] box13_width  = 10'd20;
    reg [9:0] box13_height = 10'd200;

    reg [9:0] box14_width  = 10'd60;
    reg [9:0] box14_height = 10'd20;

    reg [9:0] box15_width  = 10'd60;
    reg [9:0] box15_height = 10'd20;

    reg [9:0] box16_width  = 10'd20;
    reg [9:0] box16_height = 10'd200;

    reg [9:0] box17_width  = 10'd60;
    reg [9:0] box17_height = 10'd20;

    reg [9:0] box18_width  = 10'd30;
    reg [9:0] box18_height = 10'd80;

    reg [9:0] box19_width  = 10'd30;
    reg [9:0] box19_height = 10'd80;

    reg [9:0] box20_width  = 10'd60;
    reg [9:0] box20_height = 10'd20;

    reg [9:0] box21_width  = 10'd60;
    reg [9:0] box21_height = 10'd20;

    reg [9:0] box22_width  = 10'd60;
    reg [9:0] box22_height = 10'd20;

    reg [9:0] box23_width  = 10'd60;
    reg [9:0] box23_height = 10'd20;
	 
	 reg [9:0] box24_width  = 10'd20;
    reg [9:0] box24_height = 10'd200;
	 

	
	// Screen is 640 x 480
	
	wire in_box = (x >= box_x && x < box_x + box_width) && (y >= box_y && y < box_y + box_height);
	wire in_box2 = (x >= box2_x && x < box2_x + box2_width) && (y >= box2_y && y < box2_y + box2_height);
	wire in_box3 = (x >= box3_x && x < box3_x + box3_width) && (y >= box3_y && y < box3_y + box3_height);
	wire in_box4 = (x >= box4_x && x < box4_x + box4_width) && (y >= box4_y && y < box4_y + box4_height);
	wire in_box5 = (x >= box5_x && x < box5_x + box5_width) && (y >= box5_y && y < box5_y + box5_height);
	wire in_box6  = (x >= box6_x  && x < box6_x  + box6_width)  && (y >= box6_y  && y < box6_y  + box6_height);
   wire in_box7  = (x >= box7_x  && x < box7_x  + box7_width)  && (y >= box7_y  && y < box7_y  + box7_height);
   wire in_box8  = (x >= box8_x  && x < box8_x  + box8_width)  && (y >= box8_y  && y < box8_y  + box8_height);
   wire in_box9  = (x >= box9_x  && x < box9_x  + box9_width)  && (y >= box9_y  && y < box9_y  + box9_height);
   wire in_box10 = (x >= box10_x && x < box10_x + box10_width) && (y >= box10_y && y < box10_y + box10_height);
   wire in_box11 = (x >= box11_x && x < box11_x + box11_width) && (y >= box11_y && y < box11_y + box11_height);
   wire in_box12 = (x >= box12_x && x < box12_x + box12_width) && (y >= box12_y && y < box12_y + box12_height);
   wire in_box13 = (x >= box13_x && x < box13_x + box13_width) && (y >= box13_y && y < box13_y + box13_height);
   wire in_box14 = (x >= box14_x && x < box14_x + box14_width) && (y >= box14_y && y < box14_y + box14_height);
   wire in_box15 = (x >= box15_x && x < box15_x + box15_width) && (y >= box15_y && y < box15_y + box15_height);
   wire in_box16 = (x >= box16_x && x < box16_x + box16_width) && (y >= box16_y && y < box16_y + box16_height);
   wire in_box17 = (x >= box17_x && x < box17_x + box17_width) && (y >= box17_y && y < box17_y + box17_height);
   wire in_box18 = (x >= box18_x && x < box18_x + box18_width) && (y >= box18_y && y < box18_y + box18_height);
   wire in_box19 = (x >= box19_x && x < box19_x + box19_width) && (y >= box19_y && y < box19_y + box19_height);
   wire in_box20 = (x >= box20_x && x < box20_x + box20_width) && (y >= box20_y && y < box20_y + box20_height);
   wire in_box21 = (x >= box21_x && x < box21_x + box21_width) && (y >= box21_y && y < box21_y + box21_height);
   wire in_box22 = (x >= box22_x && x < box22_x + box22_width) && (y >= box22_y && y < box22_y + box22_height);
   wire in_box23 = (x >= box23_x && x < box23_x + box23_width) && (y >= box23_y && y < box23_y + box23_height);
	 wire in_box24 = (x >= box24_x && x < box24_x + box24_width) && (y >= box24_y && y < box24_y + box24_height);
	
	always @(*)
		begin
		

	
		
		if(!active_pixels)
		 begin
			
			vga_color = 24'd0;
			
		 end
		 else if ((lose == 1'b1) && in_box|in_box2|in_box3|in_box4 |in_box5|in_box6|in_box7|in_box8|in_box9|in_box10|in_box11|in_box12|in_box13|
					 in_box14|in_box15|in_box16|in_box17|in_box18|in_box19|in_box20|in_box21|in_box22|in_box23|in_box24)
		  begin
				vga_color = 24'hfffffff; // change value to change color, ffffff = white.
		  end
		 else
		  begin
				vga_color= 24'd0;
		  end
		
		end

		
		

	always @ (*)
	begin
//////////////////////////////// "Y"/////////////////////
			box_x = 10'd56;
			box_y = 10'd140;
			
			box2_x = box_x + 10'd20;
			box2_y = box_y + 10'd100;
		
			box3_x = box2_x + 10'd20;
			box3_y = box2_y - 10'd100;
//////////////////////////////// "O"///////////////////// 		
			box4_x = box3_x + 10'd24;
			box4_y = box_y;
			
			box5_x = box4_x;
			box5_y = box_y;
			
			box6_x = box4_x;
			box6_y = box_y + 10'd180;
			
			box7_x = box4_x + 10'd60;
			box7_y = box_y;
//////////////////////////////// "U"/////////////////////	
			box8_x = box7_x + 10'd24;
			box8_y = box_y;
			
			box9_x = box8_x;
			box9_y = box_y + 10'd180;
			
			box10_x = box8_x + 10'd60;
			box10_y = box_y;
//////////////////////////////// "L"/////////////////////

			box11_x = box10_x + 10'd28;
			box11_y = box_y;
			
			box12_x = box11_x;
			box12_y = box_y + 10'd180;
//////////////////////////////// "O"/////////////////////
			box13_x = box11_x + 10'd64;
			box13_y = box_y;
			
			box14_x = box13_x;
			box14_y = box_y;
			
			box15_x = box13_x;
			box15_y = box_y + 10'd180;
			
			box16_x = box13_x + 10'd40;
			box16_y = box_y;
//////////////////////////////// "S"/////////////////////
			box17_x = box16_x + 10'd24;
			box17_y = box_y;
			
			box18_x = box17_x;
			box18_y = box_y + 10'd20;
			
			box19_x = box18_x + 10'd30;
			box19_y = box18_y + 10'd80;
			
			box20_x = box17_x;
			box20_y = box_y + 10'd180;
//////////////////////////////// "E"/////////////////////
			box21_x = box20_x + 10'd64;
			box21_y = box_y;
			
			box22_x = box21_x;
			box22_y = box_y + 10'd90;
			
			box23_x = box21_x;
			box23_y = box22_y + 10'd90;
			
			box24_x = box21_x;
			box24_y = box_y;
			
			
			
		
	end 
	
endmodule