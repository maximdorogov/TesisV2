`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2019 13:56:00
// Design Name: 
// Module Name: tb_spdif_topV2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_spdif_topV2();
    
    reg clk,rst;
    wire spdif_out,load;
    wire [19:0] audio_sample;

spdif_topV2
    DUT(
    	.clk			(clk),
    	.i_reset		(rst),
    	.spdif_out		(spdif_out),
    	.audio_sample	(audio_sample),
    	.load			(load)
    );

    initial begin
				clk = 1'b0;
				rst = 1'b1;
			#10000 $finish;
	end
		
    always #5 	clk = ~clk;
    always #20  rst = 1'b0;



    
endmodule
