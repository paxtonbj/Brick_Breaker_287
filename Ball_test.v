module Ball_test (
    input clk,
    input rst,
    input [9:0] x,
    input [9:0] y,
    input active_pixels,
    output [23:0] ball_color
);



    //wire [9:0] x;
    //wire [9:0] y;
    //wire active_pixels;

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

    // Ball State
    reg [9:0] box_x, box_y;
    reg [1:0] vx, vy;
    reg rflct_x, rflct_y;
    
    reg [9:0] box_width  = 10'd20;
    reg [9:0] box_height = 10'd20;

    wire in_box = 
        (x >= box_x && x < box_x + box_width) &&
        (y >= box_y && y < box_y + box_height);

    reg [23:0] vga_color;

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

    // ball Movement + colision
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            box_x <= 10'd1;
            box_y <= 10'd1;
            vx    <= 2'd1;
            vy    <= 2'd1;
            rflct_x <= 0;
            rflct_y <= 0;
        end 
        else if (tick_move) begin

            // Move the ball
            if (rflct_x == 1)
                box_x <= box_x - vx;
            else
                box_x <= box_x + vx;

            if (rflct_y == 1)
                box_y <= box_y - vy;
            else
                box_y <= box_y + vy;

// collision 
// left
if (box_x <= 1)
    rflct_x <= 0;   // go right

// wall
else if (box_x + box_width >= 639)
    rflct_x <= 1;   // go left


            // top 
if (box_y <= 1)
    rflct_y <= 0;   // go down


            // bottom 
//else if (box_y + box_height >= 479)
   // rflct_y <= 1;   // go up

        end
    end

endmodule


	