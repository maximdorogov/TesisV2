`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Maxim Dorogov
// 
// Create Date: 31.10.2019 22:46:48
// Design Name: 
// Module Name: spdif_top
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
module spdif_top(
    input  clk,
    input  i_reset,
    output spdif_out,
    output load
    );
  
  wire spdif_clock;
  //wire load;
  wire [19:0] audio_sample;
  wire rst = ~i_reset;  
  
  Timebase
        u_Timebase    
            ( .clk(clk),
              .bitclock(spdif_clock),
              .loadSerialiser()
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
    
endmodule
