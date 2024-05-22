//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2024 12:53:20 PM
// Design Name: 
// Module Name: fulladder_64bit
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


module fulladder_46bit(
    input [48:0]x1_i,
    input [48:0]x2_i,
    input [48:0]x3_i,
    output [48:0]out_o,
    output [48:0]cary_o
    );
    
    wire [48:0]temp_cary;
 fulladder uut[48:0](.x1_i(x1_i),.x2_i(x2_i),.x3_i(x3_i),.out_o(out_o),.cary_o(temp_cary));
 assign cary_o = temp_cary << 1 ;
endmodule