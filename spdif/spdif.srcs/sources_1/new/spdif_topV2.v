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
// En este top level se prueba 1 salida de spdif
//////////////////////////////////////////////////////////////////////////////////


module spdif_topV2(
    input  clk,
    input  i_reset,
/* Seniales de control, comentarlas en la implementacion definitiva    
    //output [19:0] audio_sample, //comentar esta linea cuando se implementa en fpga
    //output load,                //comentar esta linea cuando se implementa en fpga
    //output channelA,             //comentar esta linea cuando se implementa en fpga
*/
    output spdif_out
    );
    
  //wire spdif_clock,audio_clk;
    wire load,channelA;        //descomentar esta linea cuando se implementa en fpga 
    wire [19:0] audio_sample;  //descomentar esta linea cuando se implementa en fpga
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
			 
    ila_0 u_ila (
        .clk(clk), // input wire clk
        .probe0(audio_sample), // input wire [19:0]  probe0  
        .probe1(load), // input wire [0:0]  probe1 
        .probe2(spdif_out) // input wire [0:0]  probe2
);
endmodule
  