
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
	 
	 

	
	paddle my_paddle(clk,rst,KEY,SW,x,y,active_pixels,paddle_color);
	
	blocks my_blocks(x,y,active_pixels,blocks_color);
	
	reg [23:0] final_color;
	
	    always @(*) begin
        final_color = 24'h000000;   // black background

       
        if (blocks_color != 24'h000000)
            final_color = blocks_color;

        
        if (paddle_color != 24'h000000)
            final_color = paddle_color;
    end

    always @(*) begin
        VGA_R = final_color[23:16];
        VGA_G = final_color[15:8];
        VGA_B = final_color[7:0];
    end

endmodule
	
	
	
	
	
	
	

