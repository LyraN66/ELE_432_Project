module Microphone#(parameter CLK_FREQ    = 100, parameter SAMPLE_RATE = 2400000)(
       input clk,
       input rst,
       input m_data,
       output lr_sel,
       output reg m_clk,
       output reg m_clk_en,
       output reg [6:0] amplitude,
       output reg amplitude_valid
   );

    localparam CLK_COUNT =((CLK_FREQ*1000000)/(SAMPLE_RATE*2));
    assign lr_sel = 1'b0;

    reg [7:0] counter [0:1];
    reg [7:0] sample_counter [0:1];
    reg [$clog2(CLK_COUNT)-1:0] clk_counter;
    
    always @(posedge clk) begin
        if(rst)begin
            sample_counter[0] <= 8'b0;
            sample_counter[1] <= 8'b0;
            counter[0] <= 8'b0;
            counter[1] <= 8'b0;
            clk_counter <= 0;
            m_clk <= 1'b0;
            m_clk_en <= 1'b0;
            amplitude <= 7'b0;
            amplitude_valid <= 1'b0;
        end 
        else begin

            if(amplitude_valid)begin
                amplitude_valid <= 1'b0;
            end 
            
            if(m_clk_en)begin
                m_clk_en <= 1'b0;
            end 
            
            if (clk_counter == CLK_COUNT - 1) begin
                clk_counter <= 1'b0;
                m_clk       <= ~m_clk;
                m_clk_en    <= ~m_clk;
            end 
            else begin
                clk_counter <= clk_counter + 1;
                if (clk_counter == CLK_COUNT - 2) m_clk_en    <= ~m_clk;
            end
        
            if (m_clk_en) begin
                counter[0] <= counter[0] + 1'b1;
                counter[1] <= counter[1] + 1'b1;
                if (counter[0] == 199) begin
                    counter[0] <= 8'b0;
                    amplitude <= sample_counter[0];
                    amplitude_valid <= 1'b1;
                    sample_counter[0] <= 8'b0;
                end 
                else if (counter[0] < 128) begin
                    sample_counter[0] <= sample_counter[0] + m_data;
                end
                if (counter[1] == 227) begin
                    counter[1] <= 8'b0;
                    amplitude <= sample_counter[1] + m_data;
                    amplitude_valid <= 1'b1;
                    sample_counter[1] <= 8'b0;
                end 
                else if (counter[1] > 100) begin
                    sample_counter[1] <= sample_counter[1] + m_data;
                end
            end
        end
    end
endmodule