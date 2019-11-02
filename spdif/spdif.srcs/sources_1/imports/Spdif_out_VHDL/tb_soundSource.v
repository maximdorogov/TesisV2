`timescale 1ns/100ps

module tb_soundSource();
	
	localparam AUDIO_BITS = 20;

	reg clock,next_sample;
	wire [AUDIO_BITS-1:0] audio_sample;

	soundSource 
		u_soundSource

			(.clk(clock),
			 .nextSample(next_sample),
			 .channelA(1'b1),
			 .Sample(audio_sample)
			);

	initial begin
		clock = 1'b0;
		next_sample = 1'b0;
		#10000 $finish;
	end

	always #5 clock = ~clock;
	always #20 next_sample = ~next_sample;
endmodule