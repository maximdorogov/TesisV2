`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2019 13:49:38
// Design Name: 
// Module Name: tb_spdif_OSVA
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


module tb_spdif_OSVA();
    
	//wire next_sample,channelA,spdif_out;
	wire spdif_out,addr_out,spdif_clk,load,load_serial;
	wire [19:0] audio_sample;
	wire [23:0]data_in;
	reg clk,rst;
    
    assign data_in = {4'b0,audio_sample};
    
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
              .loadSerialiser(load_serial)
            );
     sample_rate_gen #(.F_CLK_OUT(44_100))
         u_sample_rate_gen (
            .clk(clk),        
            .i_rst(rst),      
            .i_enable(1'b1),
            .o_clk(load)        
          );
endmodule
