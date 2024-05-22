//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Cimonk
// 
// Create Date: 03/22/2024 07:55:24 PM
// Design Name: 
// Module Name: IEEE754_Multiplier
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


module IEEE754_Multiplier(
input [31:0] Mult1_i,Mult2_i,
input start_i,rst_i,clk_i,
output valid_o,
output [31:0] result_o
    );
    
wire valid;
wire [48:0] Mult_result;
multiplier uut(
 .rs1_i(Mult1_i[22:0]),
 .rs2_i(Mult2_i[22:0]),
 .start(start_i),
 .clk_i(clk_i),
 .rst_i(rst_i),
 .result_o(Mult_result),
 .valid(valid)
    );

wire [8:0]exponent;
reg [7:0] exponent1,exponent2,exponent3,exponent4,exponent5;
wire [22:0] mantissa;
assign valid_o = valid;
wire [7:0] real_exponent;
//wire control = ~(exponent5[7]|exponent5[8]);
//assign result_o[31] =valid ?  Mult1_i[31] ^ Mult2_i[31]: 1'b0;
assign result_o[31] = ResultSign5;
assign exponent =  Mult1_i[30:23] + Mult2_i[30:23];
assign real_exponent = ~(exponent[7]|exponent[8]) ? 8'b0 : (exponent + 9'b11000_0001) ;
assign result_o[30:23] = Mult_result[47] ? exponent5+1 : exponent5; 
reg ResultSign1,ResultSign2,ResultSign3,ResultSign4,ResultSign5;  
assign mantissa = Mult_result[47] ? Mult_result[46:24] : Mult_result[45:23] ;
assign result_o[22:0] = valid ? mantissa  : 23'b0 ;
always @(posedge clk_i)begin
    if(rst_i)begin
        ResultSign1<=0;ResultSign2<=0;ResultSign3<=0;ResultSign4<=0;ResultSign5<=0;       
        exponent1<=0;exponent2<=0;exponent3<=0;exponent4<=0;exponent5<=0;
    end
    else begin
        if(start_i)begin
            ResultSign1<= Mult1_i[31] ^ Mult2_i[31];
            exponent1<= real_exponent;
        end
        else begin
            ResultSign1<=0;
            exponent1<=0;
        end
        ResultSign2<=ResultSign1;
        ResultSign3<=ResultSign2;
        ResultSign4<=ResultSign3;
        ResultSign5<=ResultSign4;    
        exponent2<=exponent1;
        exponent3<=exponent2;
        exponent4<=exponent3;
        exponent5<=exponent4; 
    end
end    
endmodule
