`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2019 08:25:03
// Design Name: 
// Module Name: Timebase_tb
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


module Timebase_tb();



	localparam AUDIO_BITS = 20;

	//wire next_sample,channelA,spdif_out;
	wire spdif_clock,load,load_2;
	wire [AUDIO_BITS-1:0] audio_sample;
	reg clk,rst;
    
    Timebase
        u_Timebase
    
            ( .clk(clk),
              .bitclock(spdif_clock),
              .loadSerialiser(load_2)
            );
    
    sample_rate_gen #(.F_CLK_OUT(44_100))
         u_sample_rate_gen (
            .clk(clk),        
            .i_rst(rst),      
            .i_enable(1'b1),
            .o_clk(load)        
  );
    F8_SPDIF_TX 
      u_F8_SPDIF_TX
      (   .bit_clock(spdif_clock),  //128x Fsample (6.144MHz for 48K samplerate)
          .data_in(audio_sample),    //24 bits data in
          .address_out(), //1 address bit means stereo only
          .spdif_out(spdif_out)   //
       ); 
	soundSource 
		u_soundSource

			(.clk(clk),
			 .nextSample(load),
			 .channelA(1'b1),
			 .Sample(audio_sample)
			);


	initial begin
		clk = 1'b0;
		rst = 1'b1;
		#10000 $finish;
	end	

	always #5 clk = ~clk;
	
    always begin
      #20  rst = 1'b0;
   
    end
endmodule
