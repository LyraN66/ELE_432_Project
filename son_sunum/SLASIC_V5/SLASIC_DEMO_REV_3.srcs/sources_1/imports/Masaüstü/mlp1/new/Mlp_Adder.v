module Mlp_Adder(
    input [31:0] adder_input,
    input [31:0] bias_input,
    input start,clk,rst,
    input mult_valid,
    input last_one,load,
    input [3:0] first_layer,
    output reg [5:0] Bias_addr,
    output reg [5:0] Neurons_DataWriteAdr,
    output [31:0] WriteData
    );

reg [31:0] input1,input2;
reg input1Full,input2Full;
wire [31:0] adderout;
adder adder1(
   .input1(input1),
   .input2(input2),
   .out(adderout)
    );

assign WriteData = adderout;  
always @(posedge clk) begin
    if(rst)begin
        input1<=0;
        input2<=0;
        input1Full<=0;input2Full<=0;
        Bias_addr<=0;
    end
    else if(start) begin   
        if(mult_valid)begin
            if(!input1Full)begin
                input1Full<=1;
                input2Full<=1;
                Bias_addr<= Bias_addr+1;
                input1<=adder_input;
                input2<=bias_input;
            end
            else if(!input2Full)begin
                input2Full<=1;
                input2<=adder_input;
            end
            else if(!last_one) begin
                input1<=adderout;
                input2<=adder_input;
            end
            else begin
                input1Full<=1;
                input2Full<=1;
                input1<=adder_input;
                input2<=bias_input;
                Bias_addr<= Bias_addr+1;
                Neurons_DataWriteAdr<=Neurons_DataWriteAdr+1;
            end
        
        end
       
    end
    else if(load) begin
        Neurons_DataWriteAdr<={2'b0,first_layer}+1;
    end
end

endmodule


