module Neural_Network(
    input             clk             ,
	input             rst             ,

	// Control Signals
	input             start           ,
	output            busy            ,
	output            valid           ,
	
	// Seven debug
	input [1:0] select_seven,
	input [11:0] switch_seven,
	output [31:0] data_seven,

	// ROM Load Signals
    input             load_start      ,
    input             load_valid      ,
	input             load_done       ,
	output reg        memory_ready    ,
	output   [3:0]    number_first_layer,
	
	
    output [7:0] first_data,
    output [7:0] last_data,

	// Data I/O Signals
	output reg     [31:0] data_req_address,
	output            read            ,
	input      [31:0] data            ,
	input      [31:0] data_mem        ,
	output reg [ 3:0] decsion_result

    );

localparam Input_Adress = 32'h0000_0001;

//    assign memory_ready = load_done;
 assign number_first_layer = First_Layer;
////////////// mains states that controls the flow ////////////////
reg [2:0]   state       ;

localparam  idle =           3'b000  ;
localparam  load =           3'b001  ;
localparam  start_network =  3'b010  ;    


/////////////// Load States ////////////////////////////////////////
reg [2:0]   load_state    ;

localparam  Layer_Size      =       3'b000      ;
localparam  Weights_N       =       3'b001      ;
localparam  Biases_N        =       3'b010      ;
localparam  Weights         =       3'b011      ;
localparam  Biases          =       3'b100      ;
localparam  Neurons         =       3'b101      ;


///////////// Start State //////////////////////////////////////////
reg [1:0]   start_state     ;


localparam  load_inputs     =       2'b00       ;
localparam  start_inputs    =       2'b01       ;

reg     [3:0] First_Layer,  Second_Layer,  Third_Layer,  Fourth_Layer;       
reg     Weights_W_reg,  Bias_W_reg,   Neuron_W_reg;
wire    Weight_w,  Bias_w,   Neuron_w; 
reg     load_wb;
reg     [8:0]   Weights_Adr;
reg     [5:0]   Bias_Adr,   Neuron_Adr; 

reg     Mlp_Start   ;

wire    [3:0]   Result      ;

wire busy_wire,valid_wire;
assign  read = Neuron_W_reg ;
   
MLP_TOP mlp(
   .clk                     (clk)               ,
   .rst                     (rst)               ,
   .start                   (Mlp_Start)         ,
   .load_wb                 (load_wb)           ,
   .First_Layer             (First_Layer)       ,
   .Second_Layer            (Second_Layer)      ,
   .Third_Layer             (Third_Layer)       ,
   .Fourth_Layer            (Fourth_Layer)      , // 0-15 'e kadar de?er al?yor 0 girdi?inizde 1 neuron, 15 girdi?inizde 16 neuron var demek hep bir fazlas?
   .Weight_Data_In          (data)              ,
   .Bias_Data_In            (data)              ,
   .Neuron_Data_In          (data_mem)              ,
   .Weight_W                (Weight_w)          ,
   .Bias_W                  (Bias_w)            ,
   .Neuron_W                (Neuron_w)          ,
   .Weights_Adr             (Weights_Adr)       ,
   .Bias_Adr                (Bias_Adr)          ,
   .Neuron_Adr              (Neuron_Adr)        ,
   .busy                    (busy_wire)         ,
	// Seven debug
	. select_seven(select_seven),
	. switch_seven(switch_seven),
	. data_seven(data_seven),
   .valid                   (valid_wire)        ,
   .class                   (Result)
    );
 
 
reg [11:0]  load_counter ; 
reg [5:0]   input_counter;   
    
reg [9:0]  weights_number;
reg [5:0]  bias_number;    

assign  Weight_w     =       Weights_W_reg ? load_valid : 1'b0 ;
assign  Bias_w       =       Bias_W_reg ? load_valid : 1'b0 ;
assign  Neuron_w     =       Neuron_W_reg ? 1'b1 : 1'b0 ;

assign  valid        =       valid_wire;
assign  busy         =       busy_wire;
always @(posedge clk) begin
    if (rst) begin
        state           <=      0       ;
        load_counter    <=      0       ;
        First_Layer     <=      0       ; 
        Second_Layer    <=      0       ; 
        Third_Layer     <=      0       ; 
        Fourth_Layer    <=      0       ;
        Weights_W_reg   <=      0       ;
        Bias_W_reg      <=      0       ;
        Neuron_W_reg    <=      0       ;
        load_wb         <=      0       ;
        Mlp_Start       <=      0       ;
        load_state      <=      0       ;
        Weights_Adr     <=      0       ;
        Bias_Adr        <=      0       ;
        Neuron_Adr      <=      0       ;
        memory_ready    <=      0       ;
        decsion_result  <=      0       ;
        start_state     <=      0       ;
        input_counter   <=      0       ;
    end
    
    else begin
    
    case (state)
        
        idle: begin
            if(load_start && !busy_wire) begin
                state       <=      load;
                load_wb     <=      1;
            end
            
            else if (start && memory_ready && !busy_wire) begin
                state               <=      start_network   ;
                data_req_address    <=      Input_Adress    ;
                load_wb             <=      1               ; 
                Neuron_W_reg        <=      1               ;
            end
            
        end
        
        load:begin
            if(load_valid) begin
                load_counter    <=      load_counter + 1;
                
                case (load_state)
                    
                    Layer_Size:begin
                    
                            First_Layer         <=      data[28:24]-1     ;
                            Second_Layer        <=      data[20:16]-1     ;
                            Third_Layer         <=      data[12:8]-1      ;
                            Fourth_Layer        <=      data[4:0]-1       ;                       
                            
                            load_state          <=      Weights_N       ;
                    end
                     
                    Weights_N:begin
                    
                            weights_number      <=      data [9:0]           ;
                            
                            load_state          <=      Biases_N        ;
                    end 
                    Biases_N:begin
                    
                            bias_number         <=      data [5:0]           ;
                            Weights_W_reg       <=      1               ;
                            
                            load_state          <=      Weights         ;
                    end  
                    Weights:begin
                            Weights_Adr         <=      Weights_Adr+1   ;
                            
                            if(Weights_Adr == weights_number-1 )   begin
                                Weights_W_reg       <=      0               ;
                                Bias_W_reg          <=      1               ;
                                load_state          <=      Biases          ;
                            end
                    end   
                    Biases:begin
                            Bias_Adr            <=      Bias_Adr+1      ;
                            
                            if(Bias_Adr == bias_number-1 )   begin
                                Bias_W_reg          <=      0               ;
                                Neuron_W_reg        <=      0               ;
                                load_state          <=      Layer_Size      ;
                                state               <=      idle            ;
                                memory_ready        <=      1               ;
                                load_wb             <=      0               ;
                            end
                    end    
             
                endcase    
            
            end
        
        end
        
        start_network: begin
            
            case    (start_state)
                load_inputs: begin
                    Neuron_Adr          <=      Neuron_Adr          +   1   ;
                    data_req_address    <=      data_req_address    +   1   ;
                    if(Neuron_Adr ==First_Layer) begin
                        Neuron_Adr          <=      0               ;
                        load_wb             <=      0               ; 
                        Neuron_W_reg        <=      0               ;
                        start_state         <=      start_inputs    ;
                        Mlp_Start           <=      1               ;
                    end
                    
                end
                
                start_inputs:begin
                        Mlp_Start           <=      0               ;
                        if(valid_wire) begin
                            
                            decsion_result      <=      Result          ;
                            start_state         <=      load_inputs     ;
                            state               <=      idle            ;
                        end
                end
                
            endcase
        end
        
    endcase;
    
    
    end
    
    
    
    
    end  
    
    
endmodule
