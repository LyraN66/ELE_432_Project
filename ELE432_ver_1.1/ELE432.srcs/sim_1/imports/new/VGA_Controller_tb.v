`timescale 1ns / 1ps
module VGA_Controller_tb();

    reg clk_tb;
    reg rst_tb;
    wire H_sync_tb;
    wire V_sync_tb;
    wire [3:0] Red_tb;
    wire [3:0] Green_tb;
    wire [3:0] Blue_tb;

    VGA_Controller DUT(
        . clk(clk_tb),
        . rst(rst_tb),
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
        #10;
        rst_tb = 1'b1;
        #10;
        rst_tb = 1'b0;
    end
endmodule
