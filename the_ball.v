module the_ball(

	input clk,
	input rst,
	input [9:0]SW,
	input [9:0]x, 
	input [9:0]y,
	input active_pixels,
	
	output reg [23:0]vga_color

   
);

    /* wire clk = CLOCK_50;
    wire rst = SW[0];

    reg [9:0] x;
    reg [9:0] y;
    wire active_pixels; */

    
	 //Should only allow the box to move every 60Hz, smoothes out movement.
    reg [19:0] tick_count;
    reg tick_move;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            tick_count <= 0;
            tick_move  <= 0;
        end  
        else if (tick_count == 20'd277777) begin
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
    
    reg [9:0] box_width  = 10'd20;
    reg [9:0] box_height = 10'd20;

    wire in_box = 
        (x >= box_x && x < box_x + box_width) &&
        (y >= box_y && y < box_y + box_height);

    // reg [23:0] vga_color;

    assign VGA_R = vga_color[23:16];
    assign VGA_G = vga_color[15:8];
    assign VGA_B = vga_color[7:0];

    always @(*) begin
        if (!active_pixels)
            vga_color = 24'h000000;
        else if (in_box)
            vga_color = 24'hFFFFFF;  // White ball
        else
            vga_color = 24'h000000;
    end
	 
		always @ (posedge clk or negedge rst)
		begin
			
			if (!rst)
			begin
				box_x <= 10'd0;
				box_y <= 10'd250;
				vx <= 2'd1;
				vy <= 2'd1;
				rflct_x <= 1'b0;
				rflct_y <= 1'b0;
			end
			else if (tick_move)
			begin
				
				// X-reflection
				if(box_x == 10'd0)
				begin
					rflct_x <= 1'b0;
						
				end
				
				if(box_x + box_width == 10'd640)
				begin
					rflct_x <= 1'b1;
		
				end
				
				
				if (rflct_x == 1'b1)
				begin
					box_x <= box_x - vx;
				end
				
				else
				begin
					box_x <= box_x + vx;
				end
				
				//Y-reflection
				
				if(box_y == 10'd0)
				begin
					rflct_y <= 1'b0;
						
				end
				
				if(box_y + box_height == 10'd480)
				begin
					rflct_y <= 1'b1;
		
				end
				
				
				if (rflct_y == 1'b1)
				begin
					box_y <= box_y - vy;
				end
				
				else
				begin
					box_y <= box_y + vy;
				end
				
			end
		end

endmodule


	