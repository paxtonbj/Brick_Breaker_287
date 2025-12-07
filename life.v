module life(
input clk,
input rst,
input collide_block,
input collide_block2,
input collide_block3,
input collide_block4,
input collide_block5,
input collide_block6,
input collide_block7,
input collide_block8,
input collide_block9,
input collide_block10,

output reg alive,
output reg alive2,
output reg alive3,
output reg alive4,
output reg alive5,
output reg alive6,
output reg alive7,
output reg alive8,
output reg alive9,
output reg alive10

);

	always @ (posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			alive <= 1'b1;
			alive2 <= 1'b1;
			alive3 <= 1'b1;
			alive4 <= 1'b1;
			alive5 <= 1'b1;
			alive6 <= 1'b1;
			alive7 <= 1'b1;
			alive8 <= 1'b1;
			alive9 <= 1'b1;
			alive10 <= 1'b1;
		end
		else 
		begin
			
			if(collide_block)
			begin
				alive <= 1'b0;
			end
			
			if(collide_block2)
			begin
				alive2 <= 1'b0;
			end
			
			if(collide_block3)
			begin
				alive3 <= 1'b0;
			end
			
			if(collide_block4)
			begin
				alive4 <= 1'b0;
			end
			
			if(collide_block5)
			begin
				alive5 <= 1'b0;
			end
			
			if(collide_block6)
			begin
				alive6 <= 1'b0;
			end
			
			if(collide_block7)
			begin
				alive7 <= 1'b0;
			end
			
			if(collide_block8)
			begin
				alive8 <= 1'b0;
			end
			
			if(collide_block9)
			begin
				alive9 <= 1'b0;
			end
			
			if(collide_block10)
			begin
				alive10 <= 1'b0;
			end
	
		end
		
	end
endmodule 