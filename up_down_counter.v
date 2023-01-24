`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:23:46 11/02/2021 
// Design Name: 
// Module Name:    up_down_counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module up_down_counter(clk, rst, enable, up_down, digit_1);

	input clk, rst, up_down, enable;
	output reg [3:0] digit_1;
	
	reg [3:0] digit_1_next;
	
	always@(posedge clk)begin
		if(rst == 1'b1)begin
			digit_1 <= 4'b0000;
		end
		else begin
			digit_1 <= digit_1_next;
		end
	end
	
	
	always@(*)begin
		if(up_down == 1'b1 && enable == 1'b1)begin // count up
			if(digit_1 == 4'b1001)begin
				digit_1_next = 4'b0000;
			end
			else begin
				digit_1_next = digit_1 + 1'b1;
			end
		end
		else if(up_down == 1'b0 && enable == 1'b1)begin // count down
			if(digit_1 == 4'b0000)begin
				digit_1_next = 4'b1001;
			end
			else begin
				digit_1_next = digit_1 - 1'b1;
			end
		end
		else begin
			digit_1_next = digit_1;
		end
	
	end

endmodule
