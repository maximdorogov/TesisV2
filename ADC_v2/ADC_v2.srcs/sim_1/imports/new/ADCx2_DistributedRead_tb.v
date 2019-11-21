`timescale 1ns / 1ps


module F1_ADCx2_DistributedRead_tb ();


    wire [1:0]SAMPLING_RATE = 2'b00;
    wire o_CNV,o_SCK,spdif_clk,FSo,nFS;
	reg clk,rst,enable,busy;
	
F1_ADCx2_DistributedRead
    DUT
    (
        .enable		(enable), //enable input                                                                              
        .CLOCK      (clk), //- 100MHz clock input                                                                  
        .SR         (SAMPLING_RATE), //-- selected output sampling rate (48,96 or 192kHz)                  
        .DOUTL	 	(), //--ADC parrallel output data, 24 bits wide, Left channel              
        .DOUTR	 	(), // --ADC parrallel output data, 24 bits wide, Right channel             
        .Fso		(FSo), //   ; -- effective  ooutput sampling rate                                                       
        .nFS		(nFS),	// ADC sampling rva te unaveraged  
                                                                     
        // ADC i/o  ,                                                                            
        .nCNVL      (o_CNV), //-- ADC start conv signal (inverted), Left channel                                     
        .BUSYL      (busy), //-- ADC BUSY signal, Left channel                                                      
        .SDOL       (), //-- ADC data output, Left channel                                                      
        .nCNVR      (), //-- ADC start conv signal (inverted), Right channel                                    
        .BUSYR      (busy), //-- ADC BUSY sig n al, Right channel                                                     
        .SDOR       (), //-- ADC data out psut, Right channel                                                     
        .SCK        (o_SCK), //-- ADC clk_div4  o                                                                      
        .CK128FS	(spdif_clk)	// 128 Fso output  for SPDIF (6.144M to 24.576M)                                            
     
     ); 

 initial begin
				clk = 1'b0;
				busy = 1'b1;
				enable = 1'b0;
				rst = 1'b1;
			#10000 $finish;
	end
	
    always #5 	clk = ~clk;
    always #20  rst = 1'b0;
    always #20  enable = 1'b1;
    
    always
        begin
            #50 busy = 1'b1;
            #1000 busy = 1'b0;
        end 

endmodule