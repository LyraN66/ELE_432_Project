module Microphone #(parameter CLK_FREQ = 100, parameter SAMPLE_RATE = 2400000  )(
    input clk,        // Clock input
    input m_data,     // Microphone data input
    output valid,
    output [9:0] data_out // 10-bit microphone data output
  );

    localparam CLK_COUNT = (CLK_FREQ*1000000) / (SAMPLE_RATE*2);
    
    reg [9:0] amplitude = 0;   // This will be the output amplitude
    reg [9:0] sample_counter = 0;
    reg [$clog2(CLK_COUNT)-1:0] clk_counter = 0;
    reg m_clk = 0;
    reg m_clk_en = 0;
  
    assign data_out = amplitude; // Assign amplitude to data_out
    assign valid = (m_clk == 0 && m_clk_en == 0) ? (1'b1) : (1'b0);

    always @(posedge clk) begin
        if (clk_counter >= CLK_COUNT - 1) begin
            clk_counter <= 0;
            m_clk <= ~m_clk; // Toggle microphone clock
            m_clk_en <= ~m_clk; // Enable microphone clock enable
        end 
        else begin
            clk_counter <= clk_counter + 1;
            if (clk_counter == CLK_COUNT - 2)begin
                m_clk_en <= ~m_clk;
            end
        end
        // Sample the microphone data
        if (m_clk_en) begin
            sample_counter <= sample_counter + m_data; // Accumulate the data bits
        end 
        else if (m_clk == 0 && m_clk_en == 0) begin
            amplitude <= sample_counter; // Update amplitude when m_clk and m_clk_en are low
            sample_counter <= 0; // Reset sample counter
        end
    end
endmodule
