`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Cimonk
// 
// Create Date: 03/24/2024 07:59:04 PM
// Design Name: 
// Module Name: MLP_TOP
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

module MLP_TOP(
    input clk,rst,start,load_wb,
    input [3:0] First_Layer,Second_Layer,Third_Layer,Fourth_Layer, // 0-15 'e kadar de?er al?yor 0 girdi?inizde 1 neuron, 15 girdi?inizde 16 neuron var demek hep bir fazlas?
    input [31:0] Weight_Data_In,Bias_Data_In,Neuron_Data_In,
    input Weight_W,Bias_W,Neuron_W,
    input [8:0] Weights_Adr,
    input [5:0]Bias_Adr,
    input [5:0]Neuron_Adr,
    output reg busy,valid,
	
	// Seven debug
	input [1:0] select_seven,
	input [11:0] switch_seven,
	output [31:0] data_seven,
	// 
    output reg [5:0] class 
    );
    
    wire [31:0] data_seven_bias;
    wire [31:0] data_seven_weights;
    wire [31:0] data_seven_neurons;
    
    assign data_seven = (select_seven==2'b0) ? (data_seven_bias) : 
                        ((select_seven==2'b01) ? (data_seven_weights) : 
                        ((select_seven==2'b11) ? (data_seven_neurons) : (32'b0)));
    

//Akisi kontrol edecek Ana stateler
reg [2:0] main_state;
parameter Idle = 3'b000;
parameter Initialize = 3'b001;
parameter First=3'b010;
parameter Second=3'b011;
parameter Third=3'b100;   
parameter Result=3'b101; 

reg internal_rst;
// Pipeline Multiplier'?n giri?lerine register ekleyeip load sinyaliyle çagirma
wire [31:0] Mult_reg1,Mult_reg2;
reg Mult_Start,Mult_Load;
wire Mult_Valid;
wire [31:0] Mult_out;  
MLP Mlp_Mult(
.mult_input1(Mult_reg1),
.mult_input2(Mult_reg2),
.start(Mult_Start),
.clk(clk),
.rst(rst | internal_rst),
.load(Mult_Load),
.valid(Mult_Valid),
.WriteData(Mult_out)
    );
    
//Biaslerin tutuldugu register deposu
wire [31:0] Bias_DataIn = Bias_Data_In;
wire [31:0]Bias_DataOut;
wire [5:0] Bias_DataAdr;
wire Bias_wr = Bias_W;
wire [7:0] last_data_wire;
Register_Bias RB(
 .Data_In(Bias_DataIn),
 .Data_Adr(Bias_DataAdr),
 .clk(clk),
 .rst(rst),
 .wr(Bias_wr),
	// Seven debug
	. select_seven(select_seven),
	. switch_seven(switch_seven),
	. data_seven(data_seven_bias),
	
 .Data_Out(Bias_DataOut)
    );

//Weightslerin tutuldugu register deposu    
wire [31:0] Weights_DataIn = Weight_Data_In;
wire [31:0] Weights_DataOut;
wire [8:0] Weights_DataAdr;
wire [8:0] Weights_TempAdr = load_wb ? Weights_Adr : Weights_DataAdr;

wire Weights_wr = Weight_W;
Register_Weights RW(
 .Data_In(Weights_DataIn),
 .Data_Adr(Weights_TempAdr),
 .clk(clk),
 .rst(rst),
 .wr(Weights_wr),
	// Seven debug
	. select_seven(select_seven),
	. switch_seven(switch_seven),
	. data_seven(data_seven_weights),
	
 .Data_Out(Weights_DataOut)
    );
assign Mult_reg1 = Weights_DataOut;   
//Neuornlar?n tutuldugu register deposu
wire [31:0] Neurons_DataIn;
wire signed [31:0] Neurons_DataOut;
reg [5:0] Neuron_DataAdr_Result;
wire [5:0] Neurons_DataAdr;
wire [5:0] Neurons_DataAdrTemp = main_state==Result ? Neuron_DataAdr_Result : Neurons_DataAdr;
wire [5:0] Neurons_DataWriteAdr;
wire [5:0] Neurons_Temp_DataWriteAdr = load_wb  ? Neuron_Adr : Neurons_DataWriteAdr;
wire Neurons_wr;
Register_Neurons RN(
 .Data_In(Neurons_DataIn),
 .Data_Adr(Neurons_DataAdrTemp),
 .Data_Write_Adr(Neurons_Temp_DataWriteAdr),
 .clk(clk),
 .rst(rst),
 .wr(Neurons_wr),
	// Seven debug
	. select_seven(select_seven),
	. switch_seven(switch_seven),
	. data_seven(data_seven_neurons),
	
 .Data_Out(Neurons_DataOut)
    );
assign Mult_reg2 = Neurons_DataOut;
reg start_reg;   

reg [3:0] First_LayerReg,Second_LayerReg,Third_LayerReg,Fourth_LayerReg;
reg [3:0] Nexter_Layer;
reg [3:0] Current_Layer,Next_Layer;
reg last_layer;
wire next,next_last;
//Multiplier?n giri?lerine regsiterlardan gelen datan?n s?ras?n? do?ru bir biçimde gelmesinin kontrolünü sa?lyan yap?
reg ControlStart_Reg;
wire ok_layer;
MLP_Control control(
.Mult_Valid(Mult_Valid),
.clk(clk),
.rst(rst|internal_rst),
.start(ControlStart_Reg),
.Current_Layer(Current_Layer),
.Next_Layer(Next_Layer),
.Last_Layer(last_layer),
.Neuron_Adr(Neurons_DataAdr),
.Weights_Adr(Weights_DataAdr),
.next(next),
.ok_layer(ok_layer),
.next_last(next_last)
    );

// tek clockda çal??an Floating point adder ve onun kontrol yap?s?
reg start_adder;
reg load;
wire [31:0] adder_out;
wire [5:0] bias_adr;
Mlp_Adder adder1(
   .adder_input(Mult_out),
   .bias_input(Bias_DataOut),
   .start(start_adder),
   .Bias_addr(bias_adr),
   .load(load),
   .first_layer(First_Layer),
   .Neurons_DataWriteAdr(Neurons_DataWriteAdr),
   .clk(clk),
   .rst(rst|internal_rst),
   .mult_valid(Mult_Valid),
   .last_one(ok_layer),
   .WriteData(adder_out)
    );
    
wire [31:0] Neuron_in = adder_out[31] ? 31'b0 : adder_out;  
wire [31:0] Neuron_last_layer = Neurons_DataWriteAdr >= Neuron_DataAdr_Result ? adder_out : Neuron_in ;
assign Neurons_DataIn =load_wb ? Neuron_Data_In: Neuron_last_layer;
    
assign Bias_DataAdr = load_wb ? Bias_Adr : bias_adr;

assign Neurons_wr =load_wb ? Neuron_W : ok_layer;

reg [3:0] counter;
reg signed [31:0] tempmax ;
reg [5:0] temp_class;
always @(posedge clk) begin
if(rst )begin
    start_reg<=0;
    main_state<=Idle;
    First_LayerReg<=0;Second_LayerReg<=0;Third_LayerReg<=0;Fourth_LayerReg<=0;
    Current_Layer<=0;Next_Layer<=0;
    Mult_Start<=0;start_adder<=0;
    internal_rst<=0;
    last_layer<=0;
    load<=0; busy<=0; valid<=0;
    counter <= 0;
    Neuron_DataAdr_Result<=0;
    class<=0;
    temp_class<=0;
end
else begin
    case(main_state) 
        Idle:begin
            valid<=0;
            if(start)begin
                start_reg<=1;
                Current_Layer<=First_Layer;
                Next_Layer<=Second_Layer;
                Third_LayerReg<=Third_Layer;
                Fourth_LayerReg<=Fourth_Layer;
                Nexter_Layer<=Third_Layer;
                main_state<=Initialize;
                internal_rst<=0;
                load<=1; busy<=1;
            end
        end
    
        Initialize:begin 
            Mult_Load<=1;
            ControlStart_Reg<=1;
            main_state<=First;
            load<=0;
            Neuron_DataAdr_Result <= First_Layer +Second_Layer +Third_Layer+3;
        end
        
        First:begin
        // Load ve controle start verdikten sonra 1 clock sonra Multiplierlara start veriyorum
        Mult_Start<=1;
        start_adder<=1;
            if(next)begin
                Current_Layer<=Second_Layer;
                Next_Layer<=Third_Layer;
                main_state<=Second;
            end
        end
        
        Second:begin
            if(next)begin
                Current_Layer<=Third_Layer;
                Next_Layer<=Fourth_Layer;
                main_state<=Third;
            end
        end
        
        Third:begin
            last_layer<=1;

            if(next_last)begin
                Mult_Start<=0;
                Mult_Load<=0;
                start_adder<=0;
                ControlStart_Reg<=0;
                internal_rst<=1;
                main_state<=Result;
            end
        end
        
        Result:begin
            if (counter == 0)begin
                tempmax <= Neurons_DataOut;
                 counter <= counter +1 ;
            end
            else if(counter < Fourth_LayerReg+1 ) begin
                if (Neurons_DataOut > tempmax) begin
                    tempmax <= Neurons_DataOut;
                    temp_class<= counter;
                end
                 counter <= counter +1 ;
            end
            else begin
                counter <= 0;
                busy<=0;
                valid<=1;
                main_state<=Idle;
                class<=temp_class;
                temp_class<=0;
                last_layer<=0;
            end
            
            Neuron_DataAdr_Result<= Neuron_DataAdr_Result +1 ;
            
        end
    endcase
end
end


endmodule
