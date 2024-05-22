`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2024 12:59:27 PM
// Design Name: 
// Module Name: MLP_Control
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
module MLP_Control(
input Mult_Valid,
input clk,rst,start,
input Last_Layer,
input [3:0] Current_Layer,Next_Layer,
output reg [5:0] Neuron_Adr,
output reg [8:0] Weights_Adr,
output  next,ok_layer,next_last
    );
 
 reg [3:0] MultiplierLoad_Counter1,MultiplierLoad_Counter2,MultiplierValid_Counter;
 reg [5:0] Base_NeuronAdr;  
 wire next_wire = (MultiplierLoad_Counter2 == Next_Layer) && (MultiplierLoad_Counter1 == Current_Layer);
 assign next = next_wire;
 wire ok_layer_temp = MultiplierLoad_Counter1 == Current_Layer;
 reg ok_layer_temp1,ok_layer_temp2,ok_layer_temp3,ok_layer_temp4,ok_layer_temp5,ok_layer_temp6,ok_layer_temp7;
 reg next_temp1,next_temp2,next_temp3,next_temp4,next_temp5,next_temp6;
 assign ok_layer = ok_layer_temp7;
 assign next_last= next_temp6;
 always @(posedge clk)begin
     if(rst)begin
        Neuron_Adr<=6'b0;
        Weights_Adr<=9'b0;
        Base_NeuronAdr<=0;
        MultiplierLoad_Counter1<=0; MultiplierLoad_Counter2<=0;
        ok_layer_temp1<=0;ok_layer_temp2<=0;ok_layer_temp3<=0;ok_layer_temp4<=0;ok_layer_temp5<=0;ok_layer_temp6<=0;ok_layer_temp7<=0;
     end
     else begin
        if(start)begin
            if(MultiplierLoad_Counter1 < Current_Layer)begin
                Neuron_Adr <= Neuron_Adr+1;
                MultiplierLoad_Counter1 <= MultiplierLoad_Counter1+1;
            end
            else begin
                if(MultiplierLoad_Counter2 < Next_Layer)begin
                    Neuron_Adr <= Base_NeuronAdr;
                    MultiplierLoad_Counter2<=MultiplierLoad_Counter2+1;
                end
                else begin
                    MultiplierLoad_Counter2<=0;
                    Base_NeuronAdr <= Neuron_Adr+1; 
                    Neuron_Adr <= Neuron_Adr+1;
                end
                MultiplierLoad_Counter1<=0;
            end
            Weights_Adr<=Weights_Adr+1;
            ok_layer_temp1<=ok_layer_temp; ok_layer_temp2<=ok_layer_temp1;  ok_layer_temp3<=ok_layer_temp2; ok_layer_temp4<=ok_layer_temp3;
            ok_layer_temp5<=ok_layer_temp4;ok_layer_temp6<=ok_layer_temp5;ok_layer_temp7<=ok_layer_temp6;
            
            next_temp1<=next&Last_Layer; next_temp2<=next_temp1; next_temp3<=next_temp2; next_temp4<=next_temp3; next_temp5<=next_temp4; next_temp6<=next_temp5;
        end
     end
 end
endmodule
