module Microphone(
    input clk,
    input rst,
    output pdm_clk
    );
    wire slow_clk;
    Divided_Clock_PDM Div_Clk(  // generates 1,562,500 Hz 
        . clk(clk),
        . rst(rst),
        . div_clk(slow_clk)
    );
    assign pdm_clk = slow_clk;
    
    wire [7:0] s_axis_data_tdata;    
    wire s_axis_data_tvalid;           
    wire s_axis_data_tready;          
    wire [15:0] m_axis_data_tdata;  
    wire m_axis_data_tvalid ;          
    
    cic_compiler_0 CIC (
        .aclk(clk),                              // input wire aclk
        .s_axis_data_tdata(s_axis_data_tdata),    // input wire [7 : 0] s_axis_data_tdata
        .s_axis_data_tvalid(s_axis_data_tvalid),  // input wire s_axis_data_tvalid
        .s_axis_data_tready(s_axis_data_tready),  // output wire s_axis_data_tready
        .m_axis_data_tdata(m_axis_data_tdata),    // output wire [15 : 0] m_axis_data_tdata
        .m_axis_data_tvalid(m_axis_data_tvalid)  // output wire m_axis_data_tvalid           
    );
endmodule



















