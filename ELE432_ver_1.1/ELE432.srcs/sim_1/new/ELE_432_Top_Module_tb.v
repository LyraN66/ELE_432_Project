`timescale 1ns / 1ps
module ELE_432_Top_Module_tb();
    reg clk_tb;
    reg rst_tb;
    reg start_fft;
    
    wire H_sync_tb;
    wire V_sync_tb;
    wire [3:0] Red_tb;
    wire [3:0] Green_tb;
    wire [3:0] Blue_tb;
    
    ELE_432_Top_Module dut(
        . clk(clk_tb),
        . rst(rst_tb),
        .start_fft (start_fft),
        
        . H_sync(H_sync_tb),
        . V_sync(V_sync_tb),
        . Red(Red_tb),
        . Green(Green_tb),
        . Blue(Blue_tb)
    );
    
    always begin 
        #5 clk_tb = ~clk_tb;
    end
    
    initial begin
        clk_tb = 1'b0; 
        rst_tb = 1'b0; 
        start_fft = 1'b0;
        #80;
        rst_tb = 1'b1; 
        #80;
        rst_tb = 1'b0; 
        start_fft = 1'b1;
        #80
        start_fft = 1'b0;
        #13000;
        start_fft = 1'b1;
        #80
        start_fft = 1'b0;
        #13000;
        start_fft = 1'b1;
        #80
        start_fft = 1'b0;
        
    end
endmodule
