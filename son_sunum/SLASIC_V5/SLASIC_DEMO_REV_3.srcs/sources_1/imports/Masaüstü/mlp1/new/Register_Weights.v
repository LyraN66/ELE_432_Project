//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Cimonk
// 
// Create Date: 03/25/2024 10:30:13 AM
// Design Name: 
// Module Name: Register_Weights
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

module Register_Weights(
input [31:0] Data_In,
input [8:0] Data_Adr,
input clk,rst,wr,
	// Seven debug
	input [1:0] select_seven,
	input [11:0] switch_seven,
	output [31:0] data_seven,
	
output [31:0] Data_Out
    );

integer i;  
reg [31:0] data[0:511];

    assign data_seven = data[switch_seven];

initial begin
$readmemh("Weights.mem",data);
end 
always @(posedge clk)begin
  if(rst)begin
//    for (i=0; i<512; i=i+1)begin
//        data[i]<=0;
//    end
  end
  
  if(wr)
  data[Data_Adr] <= Data_In; 
end

assign Data_Out = data[Data_Adr];
endmodule
