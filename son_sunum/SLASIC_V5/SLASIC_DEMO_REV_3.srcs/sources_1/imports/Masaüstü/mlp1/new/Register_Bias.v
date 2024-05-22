`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2024 10:49:47 AM
// Design Name: 
// Module Name: Register_Bias
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

module Register_Bias(
input [31:0] Data_In,
input [5:0] Data_Adr,
input clk,rst,wr,
	// Seven debug
	input [1:0] select_seven,
	input [11:0] switch_seven,
	output [31:0] data_seven,
	
output [31:0] Data_Out
    );
integer i;  
reg [31:0] data[0:63];   
initial begin
$readmemh("Bias.mem",data);
end

    assign data_seven = data[switch_seven];
always @(posedge clk)begin
  if(rst)begin
//    for (i=0; i<64; i=i+1)begin
//        data[i]<=0;
//    end
  end
  
  if(wr)
  data[Data_Adr] <= Data_In; 
end

assign Data_Out = data[Data_Adr];
endmodule
