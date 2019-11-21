`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2019 23:48:17
// Design Name: 
// Module Name: ADC_top
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


module ADC_top(
    
    input   clk,
    input   i_BUSY,
    input   SDO,
    output  o_CNV,    //sample clock
    output  o_SCK     //Transmition clock
    
    );
//  SAMPLE RATE SELECTION    
// 2'b00 Fso= 48k, avg = 32x
// 2'b01 Fso= 96k, avg = 16x
// 2'b10 Fso=192k, avg = 8x
// 2'b11 Fso=384k, avg = 4x
 
wire [1:0]SAMPLING_RATE = 2'b00;
wire spdif_clk,FSo,nFS;
wire [23:0]data_out;

F1_ADCx2_DistributedRead
    DUT
    (
        .enable		(1'b1), //enable input                                                                              
        .CLOCK      (clk), //- 100MHz clock input                                                                  
        .SR         (SAMPLING_RATE), //-- selected output sampling rate (48,96 or 192kHz)                  
        .DOUTL	 	(), //--ADC parrallel output data, 24 bits wide, Left channel              
        .DOUTR	 	(), // --ADC parrallel output data, 24 bits wide, Right channel             
        .Fso		(FSo), //   ; -- effective  ooutput sampling rate                                                       
        .nFS		(nFS),	// ADC sampling rva te unaveraged  
                                                                     
        // ADC i/o  ,                                                                            
        .nCNVL      (o_CNV), //-- ADC start conv signal (inverted), Left channel                                     
        .BUSYL      (), //-- ADC BUSY signal, Left channel                                                      
        .SDOL       (), //-- ADC data output, Left channel                                                      
        .nCNVR      (), //-- ADC start conv signal (inverted), Right channel                                    
        .BUSYR      (), //-- ADC BUSY sig n al, Right channel                                                     
        .SDOR       (), //-- ADC data out psut, Right channel                                                     
        .SCK        (o_SCK), //-- ADC clk_div4  o                                                                      
        .CK128FS	(spdif_clk)	// 128 Fso output  for SPDIF (6.144M to 24.576M)                                            
     
     ); 
     
     ila_0 your_instance_name (
	.clk(clk), // input wire clk
	.probe0(spdif_clk), // input wire [0:0]  probe0  
	.probe1(o_SCK), // input wire [0:0]  probe1 
	.probe2(o_CNV), // input wire [0:0]  probe2 
	.probe3(FSo), // input wire [0:0]  probe3 
	.probe4(nFS) // input wire [0:0]  probe4
);
     
endmodule