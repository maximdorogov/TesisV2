
/*

Testbench de un encoder de spdif

*/
`timescale 1ns / 1ps

module tb_spdifV2();
    
	wire next_sample,channelA,spdif_out;
	wire [19:0] audio_sample;
	reg clk,rst;
    
    initial begin
				clk = 1'b0;
				rst = 1'b1;
			#10000 $finish;
	end
	
    always #5 	clk = ~clk;
    always #20  rst = 1'b0;
    
	soundSource 
		u_soundSource

			(.clk(clk),
			 .nextSample(next_sample),
			 .channelA(channelA),
			 .Sample(audio_sample)
			);
			
	serialiser
		u_serializer

		(.clk100M(clk),      
		 .auxAudioBits(4'b0),
		 .sample(audio_sample),       
		 .nextSample(next_sample),  //Cada vez que se pone en 1 le paso una muestra 
		 .channelA(channelA),     
		 .spdifOut(spdif_out)     
		);
		
endmodule