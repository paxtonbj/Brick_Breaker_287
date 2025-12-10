module paddle(
	input clk,
	input rst,
	input [1:0] KEY,
	input [9:0]SW,
	input [9:0]x, 
	input [9:0]y,
	input active_pixels,
	
	output reg [23:0]vga_color,
	
	output reg [9:0] paddle_x,
	output reg [9:0] paddle_y,
	output reg [9:0] paddle_width,
	output reg [9:0] paddle_height
);
	
	// Should only allow the box to move every 60Hz, smoothes out movement.
	// 60Hz tick = 50MHz/60 = 833,333.3
	
	reg[19:0] tick_count;
	reg tick_move;
	
	always @ (posedge clk or negedge rst) 
	begin
		if(!rst)
		begin
			tick_count <= 20'b0;
			tick_move <= 1'b0;
		end
		else if (tick_count == 20'd208333) // smaller # means faster speed, 833333/4 = 208333
		begin
			tick_move <= 1'b1;
			tick_count <= 20'd0;
		end
		else 
		begin
			tick_count <= tick_count + 1'b1;
			tick_move <= 1'b0;
		end
	end
	
	reg [9:0] box_x; // x-coord
	reg [9:0] box_y; // y-coord
	
	reg [9:0] box_width = 10'd100;
	reg [9:0] box_height = 10'd20;
	
	// Screen is 640 x 480
	
	wire in_box = (x >= box_x && x < box_x + box_width) && (y >= box_y && y < box_y + box_height);
	
	always @(*)
	begin
		if(!active_pixels)
		begin
			vga_color = 24'd0;
		end
		else if (in_box)
		begin
			vga_color = 24'hffffff; // white
		end
		else
		begin
			vga_color= 24'd0;
		end
	end
	
	always @ (posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			box_x <= 10'd270; // Start centered: (640-100)/2 = 270
			box_y <= 10'd440; // Box's y starting position
		end
		else
		begin
			if(tick_move == 1'b1) 
			begin
				// Move left (KEY[1])
				if(KEY[1] == 1'b0 && box_x > 10'd0)
					box_x <= box_x - 1'b1;
				
				// Move right (KEY[0])	
				if(KEY[0] == 1'b0 && box_x + box_width < 10'd640)
					box_x <= box_x + 1'b1;
			end
		end
	end
	
	// CRITICAL FIX: Update outputs CONTINUOUSLY, not just during tick_move
	always @(*)
	begin
		paddle_x = box_x;
		paddle_y = box_y;
		paddle_width = box_width;
		paddle_height = box_height;
	end

endmodule