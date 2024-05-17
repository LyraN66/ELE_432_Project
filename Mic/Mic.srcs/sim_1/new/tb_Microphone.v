`timescale 1ns / 1ps
module tb_Microphone();

    // Parameters
    localparam CLK_FREQ = 100;
    localparam SAMPLE_RATE = 2400000;

    // Inputs
    reg clk;
    reg rst;
    reg m_data;

    // Outputs
    wire m_clk;
    wire m_clk_en;
    wire [6:0] amplitude;
    wire amplitude_valid;

    // Instantiate the Unit Under Test (UUT)
    Microphone #(
        .CLK_FREQ(CLK_FREQ),
        .SAMPLE_RATE(SAMPLE_RATE)
    ) uut (
        .clk(clk),
        .rst(rst),
        .m_data(m_data),
        .m_clk(m_clk),
        .m_clk_en(m_clk_en),
        .amplitude(amplitude),
        .amplitude_valid(amplitude_valid)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 0;
        m_data = 0;
        #20;
        rst = 1;
        #20;
        rst = 0;
        
        #100;
        
        // Apply some test signals to m_data
        #20 m_data = 1;
        #20 m_data = 0;
        #20 m_data = 1;
        #20 m_data = 0;
        #20 m_data = 1;
        
        // Continue simulation for some time to observe behavior
        #2000;
        
        // Finish simulation
        $finish;
    end

endmodule
