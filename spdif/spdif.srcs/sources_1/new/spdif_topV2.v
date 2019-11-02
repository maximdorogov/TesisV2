`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2019 10:47:29
// Design Name: 
// Module Name: spdif_topV2
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


module spdif_topV2(
    input  clk,
    input  i_reset,
    output spdif_out,
    output load
    );
    
    wire spdif_clock,audio_clk,channelA;
  //wire load;
    wire [19:0] audio_sample;
    wire rst = ~i_reset;
   
   	serialiser
		u_serializer

		(.clk100M(clk),      
		 .auxAudioBits(4'b0),
		 .sample(audio_sample),       
		 .nextSample(load),  //Cada vez que se pone en 1 le paso una muestra 
		 .channelA(channelA),     
		 .spdifOut(spdif_out)     
		);
		
	soundSource 
		u_soundSource
		
			(.clk(clk),
			 .nextSample(load),
			 .channelA(channelA),
			 .Sample(audio_sample)
			);   

endmodule
  