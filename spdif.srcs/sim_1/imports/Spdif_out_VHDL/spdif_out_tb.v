
/*

Recibe un clock de 100Mhz y devuelve audio digital en formato spdif

*/
`timescale 1ns / 1ps

module spdif_tb(

//	input clk,
//	input audio_frame,
//	output spdif_out

	);

	localparam AUDIO_BITS = 24;
    localparam SOUND_SOURCE_BITS = 20;
    
	//wire next_sample,channelA,spdif_out;
	wire spdif_out;
	wire [AUDIO_BITS-1:0] audio_sample;
	reg clk,next_sample,spdif_clk;

	soundSource 
		u_soundSource

			(.clk(clk),
			 .nextSample(next_sample),
			 .channelA(1'b1),
			 .Sample(audio_sample[SOUND_SOURCE_BITS-1:0])
			);
			
    F8_SPDIF_TX 
      u_F8_SPDIF_TX
      (   .bit_clock(spdif_clk),  //128x Fsample (6.144MHz for 48K samplerate)
          .data_in({4'b0,audio_sample[SOUND_SOURCE_BITS-1:0]}),    //24 bits data in
          .address_out(), //1 address bit means stereo only
          .spdif_out(spdif_out)   //
       );
//	serialiser
//		u_serializer

//		(.clk100M(clk),      
//		 .auxAudioBits(4'b0),
//		 .sample(audio_sample),       
//		 .nextSample(next_sample),  //Cada vez que se pone en 1 le paso una muestra 
//		 .channelA(channelA),     
//		 .spdifOut(spdif_out)     
//		);

	initial begin
		clk = 1'b0;
		next_sample = 1'b0;
		spdif_clk = 1'b0;
		#100000 $finish;
	end	

	always 
        begin
           #5     clk = ~clk;
           //#10416 next_sample = ~next_sample;
          // #81    spdif_clk = ~spdif_clk;
        end
     always 
        begin
           //#5     clk = ~clk;
           #10416 next_sample = ~next_sample;
           //#81    spdif_clk = ~spdif_clk;
        end
      
endmodule