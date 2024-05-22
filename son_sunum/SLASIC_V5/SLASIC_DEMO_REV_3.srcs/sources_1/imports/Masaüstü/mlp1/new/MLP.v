//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 07:14:13 PM
// Design Name: 
// Module Name: MLP
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

module MLP(
    input [31:0] mult_input1, mult_input2,
    input start,clk,rst,load,
    output valid,
    output [31:0] WriteData
    );


reg [31:0]  Mult1_rs1,Mult1_rs2;
IEEE754_Multiplier Mult1(
.Mult1_i(Mult1_rs1),
.Mult2_i(Mult1_rs2),
.start_i(start),
.clk_i(clk),
.rst_i(rst),
  
.result_o(WriteData),
.valid_o(valid)
);

always @(posedge clk) begin
    if(rst)begin
        Mult1_rs1<=0;
        Mult1_rs2<=0;
    end
    else begin
        if(load)begin
            Mult1_rs1<=mult_input1;
            Mult1_rs2<=mult_input2;
        end
    end
end
endmodule
