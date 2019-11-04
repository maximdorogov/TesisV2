`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2019 23:24:31
// Design Name: 
// Module Name: spdif_OSVA_top
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


module spdif_OSVA_top(
    
    input  clk,
    input  i_reset,
    output spdif_out
    //output load       //comentar si no se usa la salida de debug
    
    );
    wire load; //comentar si se usa la salida de debug
    wire addr_out,spdif_clk;
    wire [19:0] audio_sample;
    wire [23:0]data_in;
    wire rst = ~i_reset;  
    
    assign data_in = {4'b0,audio_sample};
    
    soundSource 
		u_soundSource

			(.clk(clk),
			 .nextSample(load),
			 .channelA(1'b1),
			 .Sample(audio_sample)
			);
			
    F8_SPDIF_TX 
      u_F8_SPDIF_TX
      (   .bit_clock(spdif_clk),  //128x Fsample (6.144MHz for 48K samplerate)
          .data_in(data_in),      //24 bits data in
          .address_out(addr_out), //1 address bit means stereo only
          .spdif_out(spdif_out)   //
       );
       
    Timebase
        u_Timebase    
            ( .clk(clk),
              .bitclock(spdif_clk),
              .loadSerialiser()
            );
            
     sample_rate_gen #(.F_CLK_OUT(44_100))
         u_sample_rate_gen (
            .clk(clk),        
            .i_rst(rst),      
            .i_enable(1'b1),
            .o_clk(load)        
          );
          
     ila_0 
        u_ila (
        .clk(clk), // input wire clk
        .probe0(audio_sample), // input wire [19:0]  probe0  
        .probe1(spdif_out), // input wire [0:0]  probe1 
        .probe2(load) // input wire [0:0]  probe2
);
    
endmodule
