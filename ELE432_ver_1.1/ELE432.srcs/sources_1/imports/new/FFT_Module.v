module FFT_Module(
    input clk,
    input rst,
    input start,
    input [9:0] realpart,
    input [9:0] imagpart,
    
    output reg busy, valid,
    
    output reg [6:0] bar_0, bar_1, bar_2, bar_3, bar_4, bar_5, bar_6, bar_7, bar_8, bar_9, bar_10, bar_11, bar_12, bar_13, bar_14, bar_15, bar_16, bar_17, bar_18, bar_19, bar_20, bar_21, bar_22, bar_23, bar_24, bar_25, bar_26, bar_27, bar_28, bar_29, bar_30,
bar_31, bar_32, bar_33, bar_34, bar_35, bar_36, bar_37, bar_38, bar_39, bar_40, bar_41, bar_42, bar_43, bar_44, bar_45, bar_46, bar_47, bar_48, bar_49, bar_50, bar_51, bar_52, bar_53, bar_54, bar_55, bar_56, bar_57, bar_58, bar_59, bar_60, bar_61, bar_62, bar_63,
bar_64, bar_65, bar_66, bar_67, bar_68, bar_69, bar_70, bar_71, bar_72, bar_73, bar_74, bar_75, bar_76, bar_77, bar_78, bar_79, bar_80, bar_81, bar_82, bar_83, bar_84, bar_85, bar_86, bar_87, bar_88, bar_89, bar_90, bar_91, bar_92, bar_93, bar_94, bar_95, bar_96,
bar_97, bar_98, bar_99, bar_100, bar_101, bar_102, bar_103, bar_104, bar_105, bar_106, bar_107, bar_108, bar_109, bar_110, bar_111, bar_112, bar_113, bar_114, bar_115, bar_116, bar_117, bar_118, bar_119, bar_120, bar_121, bar_122, bar_123, bar_124, bar_125, bar_126, bar_127,
    
    output reg [6:0] ibar_0, ibar_1, ibar_2, ibar_3, ibar_4, ibar_5, ibar_6, ibar_7, ibar_8, ibar_9, ibar_10, ibar_11, ibar_12, ibar_13, ibar_14, ibar_15, ibar_16, ibar_17, ibar_18, ibar_19, ibar_20, ibar_21, ibar_22, ibar_23, ibar_24, ibar_25, ibar_26, ibar_27, ibar_28, ibar_29, ibar_30,
ibar_31, ibar_32, ibar_33, ibar_34, ibar_35, ibar_36, ibar_37, ibar_38, ibar_39, ibar_40, ibar_41, ibar_42, ibar_43, ibar_44, ibar_45, ibar_46, ibar_47, ibar_48, ibar_49, ibar_50, ibar_51, ibar_52, ibar_53, ibar_54, ibar_55, ibar_56, ibar_57, ibar_58, ibar_59, ibar_60, ibar_61, ibar_62, ibar_63,
ibar_64, ibar_65, ibar_66, ibar_67, ibar_68, ibar_69, ibar_70, ibar_71, ibar_72, ibar_73, ibar_74, ibar_75, ibar_76, ibar_77, ibar_78, ibar_79, ibar_80, ibar_81, ibar_82, ibar_83, ibar_84, ibar_85, ibar_86, ibar_87, ibar_88, ibar_89, ibar_90, ibar_91, ibar_92, ibar_93, ibar_94, ibar_95, ibar_96,
ibar_97, ibar_98, ibar_99, ibar_100, ibar_101, ibar_102, ibar_103, ibar_104, ibar_105, ibar_106, ibar_107, ibar_108, ibar_109, ibar_110, ibar_111, ibar_112, ibar_113, ibar_114, ibar_115, ibar_116, ibar_117, ibar_118, ibar_119, ibar_120, ibar_121, ibar_122, ibar_123, ibar_124, ibar_125, ibar_126, ibar_127

    
    
    );
    
/////// parameters for state ///////
localparam idle = 4'b0000;
localparam load = 4'b0001;
localparam first_dragon = 4'b0010;
localparam second_dragon = 4'b0100;
localparam third_dragon = 4'b0110;
localparam fourth = 4'b1000;
localparam finish = 4'b1001;

/////// main state that control the flow ///////
reg [3:0] state;
reg [3:0] stage;
reg signed [15:0] InputReal_Shift [0:255], InputImag_Shift [0:255];
reg signed [15:0] real_reg [0:255], Imag_reg [0:255];
reg [7:0] counter, counter1;
reg [7:0]  add_to,offset;

wire [7:0] index0 = counter + offset;
wire [7:0] index1 = counter +add_to + offset;
wire [7:0] index2 = counter +2*add_to + offset;
wire [7:0] index3 = counter +3*add_to + offset;

wire [7:0] index1_multiply = (counter <<stage) +64;
wire [7:0] index2_multiply = (counter <<stage) +128;
wire [7:0] index3_multiply = (counter <<stage) +192;

reg [7:0] index0_reg,index1_reg,index2_reg,index3_reg;
reg [7:0] index0_MultiplyReg, index1_MultiplyReg, index2_MultiplyReg, index3_MultiplyReg;
reg [7:0] index0_regN, index1_regN , index2_regN, index3_regN ;
///////////////////////////////////////////////////////////////

///////////////////////////////// dragonfly adder structure /////////////////////////////
reg signed [15:0] Real_Input1, Real_Input2, Real_Input3, Real_Input4, Imag_Input1, Imag_Input2, Imag_Input3, Imag_Input4;
wire signed [15:0] Real_Out1, Real_Out2, Real_Out3, Real_Out4, Imag_Out1, Imag_Out2, Imag_Out3, Imag_Out4;

assign Real_Out1 = Real_Input1 + Real_Input2 + Real_Input3 + Real_Input4;
assign Imag_Out1 = Imag_Input1 + Imag_Input2 + Imag_Input3 + Imag_Input4;

assign Real_Out2 = Real_Input1 + Imag_Input2 - Real_Input3 - Imag_Input4;
assign Imag_Out2 = Imag_Input1 - Real_Input2 - Imag_Input3 + Real_Input4;

assign Real_Out3 = Real_Input1 - Real_Input2 + Real_Input3 - Real_Input4;
assign Imag_Out3 = Imag_Input1 - Imag_Input2 + Imag_Input3 - Imag_Input4;

assign Real_Out4 = Real_Input1 - Imag_Input2 - Real_Input3 + Imag_Input4;
assign Imag_Out4 = Imag_Input1 + Real_Input2 - Imag_Input3 - Real_Input4;
///////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////// twiddle rom block /////////////////////////////////
reg [7:0]  adr2, adr3, adr4;
wire signed [11:0] out_real2, out_imag2, out_real3, out_imag3, out_real4, out_imag4;
Twiddle rom(
    .adr2(adr2),
    .adr3(adr3),
    .adr4(adr4),
    .out_real2(out_real2),
    .out_imag2(out_imag2),
    .out_real3(out_real3),
    .out_imag3(out_imag3),
    .out_real4(out_real4),
    .out_imag4(out_imag4)
    );
//////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////// Temp register for store adder out ///////////////////////

reg signed [15:0] Temp_Real2,Temp_Real3,Temp_Real4;
reg signed [15:0] Temp_Imag2,Temp_Imag3,Temp_Imag4;

/////////////////////////////// Complex Multiplier structure /////////////////////////////////

wire signed [27:0] Mult_RealOut2, Mult_ImagOut2, Mult_RealOut3, Mult_ImagOut3, Mult_RealOut4, Mult_ImagOut4;
wire signed [15:0] Mult16bit_RealOut2, Mult16bit_ImagOut2, Mult16bit_RealOut3, Mult16bit_ImagOut3, Mult16bit_RealOut4, Mult16bit_ImagOut4;

assign Mult_RealOut2 = ((Temp_Real2 * out_real2) - (Temp_Imag2 * out_imag2)) >>>10 ;
assign Mult_ImagOut2 = ((Temp_Real2 * out_imag2) + (Temp_Imag2 * out_real2)) >>>10 ;

assign Mult_RealOut3 = ((Temp_Real3 * out_real3) - (Temp_Imag3 * out_imag3)) >>>10 ;
assign Mult_ImagOut3 = ((Temp_Real3 * out_imag3) + (Temp_Imag3 * out_real3)) >>>10 ;

assign Mult_RealOut4 = ((Temp_Real4 * out_real4) - (Temp_Imag4 * out_imag4)) >>>10 ;
assign Mult_ImagOut4 = ((Temp_Real4 * out_imag4) + (Temp_Imag4 * out_real4)) >>>10 ;

assign Mult16bit_RealOut2 = Mult_RealOut2[15:0];    assign Mult16bit_RealOut3 = Mult_RealOut3[15:0];     assign Mult16bit_RealOut4 = Mult_RealOut4[15:0];
assign Mult16bit_ImagOut2 = Mult_ImagOut2[15:0];    assign Mult16bit_ImagOut3 = Mult_ImagOut3[15:0];     assign Mult16bit_ImagOut4 = Mult_ImagOut4[15:0];

/////////////////////////////// Sort The Output Real /////////////////////////////////
genvar a,b,c,d;
reg [15:0] sort_real [0:255];
generate
    for(a=0;a<64;a=a+16)begin
        for(b=0;b<256;b=b+64)begin
            for(c=0;c<4;c=c+1)begin
                always@(*)begin
                    
                    sort_real[4*c+b+a] = real_reg[c*16 + b/64 + a/4];
                    sort_real[4*c+b+a +1] = real_reg[c*16 + b/64 + a/4 +64];
                    sort_real[4*c+b+a +2] = real_reg[c*16 + b/64 + a/4 +128];
                    sort_real[4*c+b+a +3] = real_reg[c*16 + b/64 + a/4 +192];
                end
            end
        end
    end
endgenerate

/////////////////////////////// Sort The Output ?maginary /////////////////////////////////
reg [15:0] sort_imag [0:255];
generate
    for(a=0;a<64;a=a+16)begin
        for(b=0;b<256;b=b+64)begin
            for(c=0;c<4;c=c+1)begin
                always@(*)begin
                    
                    sort_imag[4*c+b+a] = Imag_reg[c*16 + b/64 + a/4];
                    sort_imag[4*c+b+a +1] = Imag_reg[c*16 + b/64 + a/4 +64];
                    sort_imag[4*c+b+a +2] = Imag_reg[c*16 + b/64 + a/4 +128];
                    sort_imag[4*c+b+a +3] = Imag_reg[c*16 + b/64 + a/4 +192];
                end
            end
        end
    end
endgenerate
////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////// Load State Shift Registers /////////////////////////////
/*
genvar shifter;
generate
    for(shifter=0; shifter<255 ; shifter= shifter +1 )begin
        always @(posedge clk) begin
            if(rst)begin end
            else begin
                if(state==load) begin
                    InputReal_Shift[shifter] <= InputReal_Shift[shifter+1] ;
                    InputImag_Shift[shifter] <= InputImag_Shift[shifter+1] ;
                end
            end
        end
    end
endgenerate
*/
////////////////////////////////////////////////////////////////////////////////////////////    

reg first_ok, second_first, finish_reg;
reg ready, start_struct, start_mult;
reg not_last;
initial begin
$readmemh ("real1.mem",InputReal_Shift);
$readmemh ("real2.mem",InputImag_Shift);
end


always @(posedge clk) begin
    if(rst) begin
        state<=4'b0000;
        counter<=8'b0; counter1<=8'b0;
        busy<=0; valid<=0; not_last <=0;
        Real_Input1<=0; Real_Input2<=0; Real_Input3<=0; Real_Input4<=0;
        Imag_Input1<=0; Imag_Input2<=0; Imag_Input3<=0; Imag_Input4<=0;
        index0_reg<=0; index1_reg<=0; index2_reg<=0; index3_reg<=0;
        index0_MultiplyReg<=0; index1_MultiplyReg<=0; index2_MultiplyReg<=0; index3_MultiplyReg<=0;
        index0_regN<=0; index1_regN<=0; index2_regN<=0; index3_regN<=0;
        first_ok<=0; second_first<=0;
        add_to<=0; offset<=0; finish_reg<=0; start_mult<=0;
        stage<=0; ready<=0; start_struct<=0;
        Temp_Real2 <=0; Temp_Real3 <=0; Temp_Real4 <= 0;
        Temp_Imag2 <=0; Temp_Imag3 <=0; Temp_Imag4 <= 0;
    end
    else begin
        
 //////////////////////////////// Main Structure /////////////////////////////////////////////////////
        if(start_struct) begin
            /////////////////////// Input of the Dragonfly Adder /////////////////////////////////////       
            Real_Input1<= real_reg[index0];
            Real_Input2<= real_reg[index1];
            Real_Input3<= real_reg[index2];
            Real_Input4<= real_reg[index3];
            
            Imag_Input1<= Imag_reg[index0];
            Imag_Input2<= Imag_reg[index1];
            Imag_Input3<= Imag_reg[index2];
            Imag_Input4<= Imag_reg[index3];
        
            /////////////////// Store the output of the Adders //////////////////////////////////////
            if(!not_last) begin
                real_reg[index0_reg] <= Real_Out1;
                Temp_Real2 <= Real_Out2;
                Temp_Real3 <= Real_Out3;
                Temp_Real4 <= Real_Out4;
                
                Imag_reg[index0_reg] <= Imag_Out1;
                Temp_Imag2 <= Imag_Out2;
                Temp_Imag3 <= Imag_Out3;
                Temp_Imag4 <= Imag_Out4;
            end
            
            //////////////////////// Update ?ndexes ////////////////////////////////////////////////
            index0_reg <= index0;       index0_regN <= index0_reg;      index1_MultiplyReg <= index1_multiply;
            index1_reg <= index1;       index1_regN <= index1_reg;      index2_MultiplyReg <= index2_multiply;
            index2_reg <= index2;       index2_regN <= index2_reg;      index3_MultiplyReg <= index3_multiply;
            index3_reg <= index3;       index3_regN <= index3_reg;
            
            adr2 <= index1_MultiplyReg;
            adr3 <= index2_MultiplyReg;
            adr4 <= index3_MultiplyReg;
            
            ///////////////////// Load Multiplier output to previous index address //////////////////
            if(start_mult) begin
                real_reg[index1_regN] <= Mult16bit_RealOut2;
                real_reg[index2_regN] <= Mult16bit_RealOut3;
                real_reg[index3_regN] <= Mult16bit_RealOut4;
                
                Imag_reg[index1_regN] <= Mult16bit_ImagOut2;
                Imag_reg[index2_regN] <= Mult16bit_ImagOut3;
                Imag_reg[index3_regN] <= Mult16bit_ImagOut4;
            end
        end
        
        case (state) 
            idle:begin
                if(start)begin
                    //state<= load;
                    busy <=1;
                    
                    state <= first_dragon;
                    start_struct <=1;
                    counter <= 8'b0; counter1 <= 8'b0;
                    
                    add_to <= 8'd64;
                    
                    index0_reg <= 0;
                    index1_reg <= 64;       adr2 <= 64;
                    index2_reg <= 128;      adr3 <= 128;
                    index3_reg <= 192;      adr4 <= 192;
real_reg[0] <= InputReal_Shift[0] ; 
real_reg[1] <= InputReal_Shift[1] ; 
real_reg[2] <= InputReal_Shift[2] ; 
real_reg[3] <= InputReal_Shift[3] ; 
real_reg[4] <= InputReal_Shift[4] ; 
real_reg[5] <= InputReal_Shift[5] ; 
real_reg[6] <= InputReal_Shift[6] ; 
real_reg[7] <= InputReal_Shift[7] ; 
real_reg[8] <= InputReal_Shift[8] ; 
real_reg[9] <= InputReal_Shift[9] ; 
real_reg[10] <= InputReal_Shift[10] ; 
real_reg[11] <= InputReal_Shift[11] ; 
real_reg[12] <= InputReal_Shift[12] ; 
real_reg[13] <= InputReal_Shift[13] ; 
real_reg[14] <= InputReal_Shift[14] ; 
real_reg[15] <= InputReal_Shift[15] ; 
real_reg[16] <= InputReal_Shift[16] ; 
real_reg[17] <= InputReal_Shift[17] ; 
real_reg[18] <= InputReal_Shift[18] ; 
real_reg[19] <= InputReal_Shift[19] ; 
real_reg[20] <= InputReal_Shift[20] ; 
real_reg[21] <= InputReal_Shift[21] ; 
real_reg[22] <= InputReal_Shift[22] ; 
real_reg[23] <= InputReal_Shift[23] ; 
real_reg[24] <= InputReal_Shift[24] ; 
real_reg[25] <= InputReal_Shift[25] ; 
real_reg[26] <= InputReal_Shift[26] ; 
real_reg[27] <= InputReal_Shift[27] ; 
real_reg[28] <= InputReal_Shift[28] ; 
real_reg[29] <= InputReal_Shift[29] ; 
real_reg[30] <= InputReal_Shift[30] ; 
real_reg[31] <= InputReal_Shift[31] ; 
real_reg[32] <= InputReal_Shift[32] ; 
real_reg[33] <= InputReal_Shift[33] ; 
real_reg[34] <= InputReal_Shift[34] ; 
real_reg[35] <= InputReal_Shift[35] ; 
real_reg[36] <= InputReal_Shift[36] ; 
real_reg[37] <= InputReal_Shift[37] ; 
real_reg[38] <= InputReal_Shift[38] ; 
real_reg[39] <= InputReal_Shift[39] ; 
real_reg[40] <= InputReal_Shift[40] ; 
real_reg[41] <= InputReal_Shift[41] ; 
real_reg[42] <= InputReal_Shift[42] ; 
real_reg[43] <= InputReal_Shift[43] ; 
real_reg[44] <= InputReal_Shift[44] ; 
real_reg[45] <= InputReal_Shift[45] ; 
real_reg[46] <= InputReal_Shift[46] ; 
real_reg[47] <= InputReal_Shift[47] ; 
real_reg[48] <= InputReal_Shift[48] ; 
real_reg[49] <= InputReal_Shift[49] ; 
real_reg[50] <= InputReal_Shift[50] ; 
real_reg[51] <= InputReal_Shift[51] ; 
real_reg[52] <= InputReal_Shift[52] ; 
real_reg[53] <= InputReal_Shift[53] ; 
real_reg[54] <= InputReal_Shift[54] ; 
real_reg[55] <= InputReal_Shift[55] ; 
real_reg[56] <= InputReal_Shift[56] ; 
real_reg[57] <= InputReal_Shift[57] ; 
real_reg[58] <= InputReal_Shift[58] ; 
real_reg[59] <= InputReal_Shift[59] ; 
real_reg[60] <= InputReal_Shift[60] ; 
real_reg[61] <= InputReal_Shift[61] ; 
real_reg[62] <= InputReal_Shift[62] ; 
real_reg[63] <= InputReal_Shift[63] ; 
real_reg[64] <= InputReal_Shift[64] ; 
real_reg[65] <= InputReal_Shift[65] ; 
real_reg[66] <= InputReal_Shift[66] ; 
real_reg[67] <= InputReal_Shift[67] ; 
real_reg[68] <= InputReal_Shift[68] ; 
real_reg[69] <= InputReal_Shift[69] ; 
real_reg[70] <= InputReal_Shift[70] ; 
real_reg[71] <= InputReal_Shift[71] ; 
real_reg[72] <= InputReal_Shift[72] ; 
real_reg[73] <= InputReal_Shift[73] ; 
real_reg[74] <= InputReal_Shift[74] ; 
real_reg[75] <= InputReal_Shift[75] ; 
real_reg[76] <= InputReal_Shift[76] ; 
real_reg[77] <= InputReal_Shift[77] ; 
real_reg[78] <= InputReal_Shift[78] ; 
real_reg[79] <= InputReal_Shift[79] ; 
real_reg[80] <= InputReal_Shift[80] ; 
real_reg[81] <= InputReal_Shift[81] ; 
real_reg[82] <= InputReal_Shift[82] ; 
real_reg[83] <= InputReal_Shift[83] ; 
real_reg[84] <= InputReal_Shift[84] ; 
real_reg[85] <= InputReal_Shift[85] ; 
real_reg[86] <= InputReal_Shift[86] ; 
real_reg[87] <= InputReal_Shift[87] ; 
real_reg[88] <= InputReal_Shift[88] ; 
real_reg[89] <= InputReal_Shift[89] ; 
real_reg[90] <= InputReal_Shift[90] ; 
real_reg[91] <= InputReal_Shift[91] ; 
real_reg[92] <= InputReal_Shift[92] ; 
real_reg[93] <= InputReal_Shift[93] ; 
real_reg[94] <= InputReal_Shift[94] ; 
real_reg[95] <= InputReal_Shift[95] ; 
real_reg[96] <= InputReal_Shift[96] ; 
real_reg[97] <= InputReal_Shift[97] ; 
real_reg[98] <= InputReal_Shift[98] ; 
real_reg[99] <= InputReal_Shift[99] ; 
real_reg[100] <= InputReal_Shift[100] ; 
real_reg[101] <= InputReal_Shift[101] ; 
real_reg[102] <= InputReal_Shift[102] ; 
real_reg[103] <= InputReal_Shift[103] ; 
real_reg[104] <= InputReal_Shift[104] ; 
real_reg[105] <= InputReal_Shift[105] ; 
real_reg[106] <= InputReal_Shift[106] ; 
real_reg[107] <= InputReal_Shift[107] ; 
real_reg[108] <= InputReal_Shift[108] ; 
real_reg[109] <= InputReal_Shift[109] ; 
real_reg[110] <= InputReal_Shift[110] ; 
real_reg[111] <= InputReal_Shift[111] ; 
real_reg[112] <= InputReal_Shift[112] ; 
real_reg[113] <= InputReal_Shift[113] ; 
real_reg[114] <= InputReal_Shift[114] ; 
real_reg[115] <= InputReal_Shift[115] ; 
real_reg[116] <= InputReal_Shift[116] ; 
real_reg[117] <= InputReal_Shift[117] ; 
real_reg[118] <= InputReal_Shift[118] ; 
real_reg[119] <= InputReal_Shift[119] ; 
real_reg[120] <= InputReal_Shift[120] ; 
real_reg[121] <= InputReal_Shift[121] ; 
real_reg[122] <= InputReal_Shift[122] ; 
real_reg[123] <= InputReal_Shift[123] ; 
real_reg[124] <= InputReal_Shift[124] ; 
real_reg[125] <= InputReal_Shift[125] ; 
real_reg[126] <= InputReal_Shift[126] ; 
real_reg[127] <= InputReal_Shift[127] ; 
real_reg[128] <= InputReal_Shift[128] ; 
real_reg[129] <= InputReal_Shift[129] ; 
real_reg[130] <= InputReal_Shift[130] ; 
real_reg[131] <= InputReal_Shift[131] ; 
real_reg[132] <= InputReal_Shift[132] ; 
real_reg[133] <= InputReal_Shift[133] ; 
real_reg[134] <= InputReal_Shift[134] ; 
real_reg[135] <= InputReal_Shift[135] ; 
real_reg[136] <= InputReal_Shift[136] ; 
real_reg[137] <= InputReal_Shift[137] ; 
real_reg[138] <= InputReal_Shift[138] ; 
real_reg[139] <= InputReal_Shift[139] ; 
real_reg[140] <= InputReal_Shift[140] ; 
real_reg[141] <= InputReal_Shift[141] ; 
real_reg[142] <= InputReal_Shift[142] ; 
real_reg[143] <= InputReal_Shift[143] ; 
real_reg[144] <= InputReal_Shift[144] ; 
real_reg[145] <= InputReal_Shift[145] ; 
real_reg[146] <= InputReal_Shift[146] ; 
real_reg[147] <= InputReal_Shift[147] ; 
real_reg[148] <= InputReal_Shift[148] ; 
real_reg[149] <= InputReal_Shift[149] ; 
real_reg[150] <= InputReal_Shift[150] ; 
real_reg[151] <= InputReal_Shift[151] ; 
real_reg[152] <= InputReal_Shift[152] ; 
real_reg[153] <= InputReal_Shift[153] ; 
real_reg[154] <= InputReal_Shift[154] ; 
real_reg[155] <= InputReal_Shift[155] ; 
real_reg[156] <= InputReal_Shift[156] ; 
real_reg[157] <= InputReal_Shift[157] ; 
real_reg[158] <= InputReal_Shift[158] ; 
real_reg[159] <= InputReal_Shift[159] ; 
real_reg[160] <= InputReal_Shift[160] ; 
real_reg[161] <= InputReal_Shift[161] ; 
real_reg[162] <= InputReal_Shift[162] ; 
real_reg[163] <= InputReal_Shift[163] ; 
real_reg[164] <= InputReal_Shift[164] ; 
real_reg[165] <= InputReal_Shift[165] ; 
real_reg[166] <= InputReal_Shift[166] ; 
real_reg[167] <= InputReal_Shift[167] ; 
real_reg[168] <= InputReal_Shift[168] ; 
real_reg[169] <= InputReal_Shift[169] ; 
real_reg[170] <= InputReal_Shift[170] ; 
real_reg[171] <= InputReal_Shift[171] ; 
real_reg[172] <= InputReal_Shift[172] ; 
real_reg[173] <= InputReal_Shift[173] ; 
real_reg[174] <= InputReal_Shift[174] ; 
real_reg[175] <= InputReal_Shift[175] ; 
real_reg[176] <= InputReal_Shift[176] ; 
real_reg[177] <= InputReal_Shift[177] ; 
real_reg[178] <= InputReal_Shift[178] ; 
real_reg[179] <= InputReal_Shift[179] ; 
real_reg[180] <= InputReal_Shift[180] ; 
real_reg[181] <= InputReal_Shift[181] ; 
real_reg[182] <= InputReal_Shift[182] ; 
real_reg[183] <= InputReal_Shift[183] ; 
real_reg[184] <= InputReal_Shift[184] ; 
real_reg[185] <= InputReal_Shift[185] ; 
real_reg[186] <= InputReal_Shift[186] ; 
real_reg[187] <= InputReal_Shift[187] ; 
real_reg[188] <= InputReal_Shift[188] ; 
real_reg[189] <= InputReal_Shift[189] ; 
real_reg[190] <= InputReal_Shift[190] ; 
real_reg[191] <= InputReal_Shift[191] ; 
real_reg[192] <= InputReal_Shift[192] ; 
real_reg[193] <= InputReal_Shift[193] ; 
real_reg[194] <= InputReal_Shift[194] ; 
real_reg[195] <= InputReal_Shift[195] ; 
real_reg[196] <= InputReal_Shift[196] ; 
real_reg[197] <= InputReal_Shift[197] ; 
real_reg[198] <= InputReal_Shift[198] ; 
real_reg[199] <= InputReal_Shift[199] ; 
real_reg[200] <= InputReal_Shift[200] ; 
real_reg[201] <= InputReal_Shift[201] ; 
real_reg[202] <= InputReal_Shift[202] ; 
real_reg[203] <= InputReal_Shift[203] ; 
real_reg[204] <= InputReal_Shift[204] ; 
real_reg[205] <= InputReal_Shift[205] ; 
real_reg[206] <= InputReal_Shift[206] ; 
real_reg[207] <= InputReal_Shift[207] ; 
real_reg[208] <= InputReal_Shift[208] ; 
real_reg[209] <= InputReal_Shift[209] ; 
real_reg[210] <= InputReal_Shift[210] ; 
real_reg[211] <= InputReal_Shift[211] ; 
real_reg[212] <= InputReal_Shift[212] ; 
real_reg[213] <= InputReal_Shift[213] ; 
real_reg[214] <= InputReal_Shift[214] ; 
real_reg[215] <= InputReal_Shift[215] ; 
real_reg[216] <= InputReal_Shift[216] ; 
real_reg[217] <= InputReal_Shift[217] ; 
real_reg[218] <= InputReal_Shift[218] ; 
real_reg[219] <= InputReal_Shift[219] ; 
real_reg[220] <= InputReal_Shift[220] ; 
real_reg[221] <= InputReal_Shift[221] ; 
real_reg[222] <= InputReal_Shift[222] ; 
real_reg[223] <= InputReal_Shift[223] ; 
real_reg[224] <= InputReal_Shift[224] ; 
real_reg[225] <= InputReal_Shift[225] ; 
real_reg[226] <= InputReal_Shift[226] ; 
real_reg[227] <= InputReal_Shift[227] ; 
real_reg[228] <= InputReal_Shift[228] ; 
real_reg[229] <= InputReal_Shift[229] ; 
real_reg[230] <= InputReal_Shift[230] ; 
real_reg[231] <= InputReal_Shift[231] ; 
real_reg[232] <= InputReal_Shift[232] ; 
real_reg[233] <= InputReal_Shift[233] ; 
real_reg[234] <= InputReal_Shift[234] ; 
real_reg[235] <= InputReal_Shift[235] ; 
real_reg[236] <= InputReal_Shift[236] ; 
real_reg[237] <= InputReal_Shift[237] ; 
real_reg[238] <= InputReal_Shift[238] ; 
real_reg[239] <= InputReal_Shift[239] ; 
real_reg[240] <= InputReal_Shift[240] ; 
real_reg[241] <= InputReal_Shift[241] ; 
real_reg[242] <= InputReal_Shift[242] ; 
real_reg[243] <= InputReal_Shift[243] ; 
real_reg[244] <= InputReal_Shift[244] ; 
real_reg[245] <= InputReal_Shift[245] ; 
real_reg[246] <= InputReal_Shift[246] ; 
real_reg[247] <= InputReal_Shift[247] ; 
real_reg[248] <= InputReal_Shift[248] ; 
real_reg[249] <= InputReal_Shift[249] ; 
real_reg[250] <= InputReal_Shift[250] ; 
real_reg[251] <= InputReal_Shift[251] ; 
real_reg[252] <= InputReal_Shift[252] ; 
real_reg[253] <= InputReal_Shift[253] ; 
real_reg[254] <= InputReal_Shift[254] ; 
real_reg[255] <= InputReal_Shift[255] ;
                    
Imag_reg[0] <= InputImag_Shift[0] ; 
Imag_reg[1] <= InputImag_Shift[1] ; 
Imag_reg[2] <= InputImag_Shift[2] ; 
Imag_reg[3] <= InputImag_Shift[3] ; 
Imag_reg[4] <= InputImag_Shift[4] ; 
Imag_reg[5] <= InputImag_Shift[5] ; 
Imag_reg[6] <= InputImag_Shift[6] ; 
Imag_reg[7] <= InputImag_Shift[7] ; 
Imag_reg[8] <= InputImag_Shift[8] ; 
Imag_reg[9] <= InputImag_Shift[9] ; 
Imag_reg[10] <= InputImag_Shift[10] ; 
Imag_reg[11] <= InputImag_Shift[11] ; 
Imag_reg[12] <= InputImag_Shift[12] ; 
Imag_reg[13] <= InputImag_Shift[13] ; 
Imag_reg[14] <= InputImag_Shift[14] ; 
Imag_reg[15] <= InputImag_Shift[15] ; 
Imag_reg[16] <= InputImag_Shift[16] ; 
Imag_reg[17] <= InputImag_Shift[17] ; 
Imag_reg[18] <= InputImag_Shift[18] ; 
Imag_reg[19] <= InputImag_Shift[19] ; 
Imag_reg[20] <= InputImag_Shift[20] ; 
Imag_reg[21] <= InputImag_Shift[21] ; 
Imag_reg[22] <= InputImag_Shift[22] ; 
Imag_reg[23] <= InputImag_Shift[23] ; 
Imag_reg[24] <= InputImag_Shift[24] ; 
Imag_reg[25] <= InputImag_Shift[25] ; 
Imag_reg[26] <= InputImag_Shift[26] ; 
Imag_reg[27] <= InputImag_Shift[27] ; 
Imag_reg[28] <= InputImag_Shift[28] ; 
Imag_reg[29] <= InputImag_Shift[29] ; 
Imag_reg[30] <= InputImag_Shift[30] ; 
Imag_reg[31] <= InputImag_Shift[31] ; 
Imag_reg[32] <= InputImag_Shift[32] ; 
Imag_reg[33] <= InputImag_Shift[33] ; 
Imag_reg[34] <= InputImag_Shift[34] ; 
Imag_reg[35] <= InputImag_Shift[35] ; 
Imag_reg[36] <= InputImag_Shift[36] ; 
Imag_reg[37] <= InputImag_Shift[37] ; 
Imag_reg[38] <= InputImag_Shift[38] ; 
Imag_reg[39] <= InputImag_Shift[39] ; 
Imag_reg[40] <= InputImag_Shift[40] ; 
Imag_reg[41] <= InputImag_Shift[41] ; 
Imag_reg[42] <= InputImag_Shift[42] ; 
Imag_reg[43] <= InputImag_Shift[43] ; 
Imag_reg[44] <= InputImag_Shift[44] ; 
Imag_reg[45] <= InputImag_Shift[45] ; 
Imag_reg[46] <= InputImag_Shift[46] ; 
Imag_reg[47] <= InputImag_Shift[47] ; 
Imag_reg[48] <= InputImag_Shift[48] ; 
Imag_reg[49] <= InputImag_Shift[49] ; 
Imag_reg[50] <= InputImag_Shift[50] ; 
Imag_reg[51] <= InputImag_Shift[51] ; 
Imag_reg[52] <= InputImag_Shift[52] ; 
Imag_reg[53] <= InputImag_Shift[53] ; 
Imag_reg[54] <= InputImag_Shift[54] ; 
Imag_reg[55] <= InputImag_Shift[55] ; 
Imag_reg[56] <= InputImag_Shift[56] ; 
Imag_reg[57] <= InputImag_Shift[57] ; 
Imag_reg[58] <= InputImag_Shift[58] ; 
Imag_reg[59] <= InputImag_Shift[59] ; 
Imag_reg[60] <= InputImag_Shift[60] ; 
Imag_reg[61] <= InputImag_Shift[61] ; 
Imag_reg[62] <= InputImag_Shift[62] ; 
Imag_reg[63] <= InputImag_Shift[63] ; 
Imag_reg[64] <= InputImag_Shift[64] ; 
Imag_reg[65] <= InputImag_Shift[65] ; 
Imag_reg[66] <= InputImag_Shift[66] ; 
Imag_reg[67] <= InputImag_Shift[67] ; 
Imag_reg[68] <= InputImag_Shift[68] ; 
Imag_reg[69] <= InputImag_Shift[69] ; 
Imag_reg[70] <= InputImag_Shift[70] ; 
Imag_reg[71] <= InputImag_Shift[71] ; 
Imag_reg[72] <= InputImag_Shift[72] ; 
Imag_reg[73] <= InputImag_Shift[73] ; 
Imag_reg[74] <= InputImag_Shift[74] ; 
Imag_reg[75] <= InputImag_Shift[75] ; 
Imag_reg[76] <= InputImag_Shift[76] ; 
Imag_reg[77] <= InputImag_Shift[77] ; 
Imag_reg[78] <= InputImag_Shift[78] ; 
Imag_reg[79] <= InputImag_Shift[79] ; 
Imag_reg[80] <= InputImag_Shift[80] ; 
Imag_reg[81] <= InputImag_Shift[81] ; 
Imag_reg[82] <= InputImag_Shift[82] ; 
Imag_reg[83] <= InputImag_Shift[83] ; 
Imag_reg[84] <= InputImag_Shift[84] ; 
Imag_reg[85] <= InputImag_Shift[85] ; 
Imag_reg[86] <= InputImag_Shift[86] ; 
Imag_reg[87] <= InputImag_Shift[87] ; 
Imag_reg[88] <= InputImag_Shift[88] ; 
Imag_reg[89] <= InputImag_Shift[89] ; 
Imag_reg[90] <= InputImag_Shift[90] ; 
Imag_reg[91] <= InputImag_Shift[91] ; 
Imag_reg[92] <= InputImag_Shift[92] ; 
Imag_reg[93] <= InputImag_Shift[93] ; 
Imag_reg[94] <= InputImag_Shift[94] ; 
Imag_reg[95] <= InputImag_Shift[95] ; 
Imag_reg[96] <= InputImag_Shift[96] ; 
Imag_reg[97] <= InputImag_Shift[97] ; 
Imag_reg[98] <= InputImag_Shift[98] ; 
Imag_reg[99] <= InputImag_Shift[99] ; 
Imag_reg[100] <= InputImag_Shift[100] ; 
Imag_reg[101] <= InputImag_Shift[101] ; 
Imag_reg[102] <= InputImag_Shift[102] ; 
Imag_reg[103] <= InputImag_Shift[103] ; 
Imag_reg[104] <= InputImag_Shift[104] ; 
Imag_reg[105] <= InputImag_Shift[105] ; 
Imag_reg[106] <= InputImag_Shift[106] ; 
Imag_reg[107] <= InputImag_Shift[107] ; 
Imag_reg[108] <= InputImag_Shift[108] ; 
Imag_reg[109] <= InputImag_Shift[109] ; 
Imag_reg[110] <= InputImag_Shift[110] ; 
Imag_reg[111] <= InputImag_Shift[111] ; 
Imag_reg[112] <= InputImag_Shift[112] ; 
Imag_reg[113] <= InputImag_Shift[113] ; 
Imag_reg[114] <= InputImag_Shift[114] ; 
Imag_reg[115] <= InputImag_Shift[115] ; 
Imag_reg[116] <= InputImag_Shift[116] ; 
Imag_reg[117] <= InputImag_Shift[117] ; 
Imag_reg[118] <= InputImag_Shift[118] ; 
Imag_reg[119] <= InputImag_Shift[119] ; 
Imag_reg[120] <= InputImag_Shift[120] ; 
Imag_reg[121] <= InputImag_Shift[121] ; 
Imag_reg[122] <= InputImag_Shift[122] ; 
Imag_reg[123] <= InputImag_Shift[123] ; 
Imag_reg[124] <= InputImag_Shift[124] ; 
Imag_reg[125] <= InputImag_Shift[125] ; 
Imag_reg[126] <= InputImag_Shift[126] ; 
Imag_reg[127] <= InputImag_Shift[127] ; 
Imag_reg[128] <= InputImag_Shift[128] ; 
Imag_reg[129] <= InputImag_Shift[129] ; 
Imag_reg[130] <= InputImag_Shift[130] ; 
Imag_reg[131] <= InputImag_Shift[131] ; 
Imag_reg[132] <= InputImag_Shift[132] ; 
Imag_reg[133] <= InputImag_Shift[133] ; 
Imag_reg[134] <= InputImag_Shift[134] ; 
Imag_reg[135] <= InputImag_Shift[135] ; 
Imag_reg[136] <= InputImag_Shift[136] ; 
Imag_reg[137] <= InputImag_Shift[137] ; 
Imag_reg[138] <= InputImag_Shift[138] ; 
Imag_reg[139] <= InputImag_Shift[139] ; 
Imag_reg[140] <= InputImag_Shift[140] ; 
Imag_reg[141] <= InputImag_Shift[141] ; 
Imag_reg[142] <= InputImag_Shift[142] ; 
Imag_reg[143] <= InputImag_Shift[143] ; 
Imag_reg[144] <= InputImag_Shift[144] ; 
Imag_reg[145] <= InputImag_Shift[145] ; 
Imag_reg[146] <= InputImag_Shift[146] ; 
Imag_reg[147] <= InputImag_Shift[147] ; 
Imag_reg[148] <= InputImag_Shift[148] ; 
Imag_reg[149] <= InputImag_Shift[149] ; 
Imag_reg[150] <= InputImag_Shift[150] ; 
Imag_reg[151] <= InputImag_Shift[151] ; 
Imag_reg[152] <= InputImag_Shift[152] ; 
Imag_reg[153] <= InputImag_Shift[153] ; 
Imag_reg[154] <= InputImag_Shift[154] ; 
Imag_reg[155] <= InputImag_Shift[155] ; 
Imag_reg[156] <= InputImag_Shift[156] ; 
Imag_reg[157] <= InputImag_Shift[157] ; 
Imag_reg[158] <= InputImag_Shift[158] ; 
Imag_reg[159] <= InputImag_Shift[159] ; 
Imag_reg[160] <= InputImag_Shift[160] ; 
Imag_reg[161] <= InputImag_Shift[161] ; 
Imag_reg[162] <= InputImag_Shift[162] ; 
Imag_reg[163] <= InputImag_Shift[163] ; 
Imag_reg[164] <= InputImag_Shift[164] ; 
Imag_reg[165] <= InputImag_Shift[165] ; 
Imag_reg[166] <= InputImag_Shift[166] ; 
Imag_reg[167] <= InputImag_Shift[167] ; 
Imag_reg[168] <= InputImag_Shift[168] ; 
Imag_reg[169] <= InputImag_Shift[169] ; 
Imag_reg[170] <= InputImag_Shift[170] ; 
Imag_reg[171] <= InputImag_Shift[171] ; 
Imag_reg[172] <= InputImag_Shift[172] ; 
Imag_reg[173] <= InputImag_Shift[173] ; 
Imag_reg[174] <= InputImag_Shift[174] ; 
Imag_reg[175] <= InputImag_Shift[175] ; 
Imag_reg[176] <= InputImag_Shift[176] ; 
Imag_reg[177] <= InputImag_Shift[177] ; 
Imag_reg[178] <= InputImag_Shift[178] ; 
Imag_reg[179] <= InputImag_Shift[179] ; 
Imag_reg[180] <= InputImag_Shift[180] ; 
Imag_reg[181] <= InputImag_Shift[181] ; 
Imag_reg[182] <= InputImag_Shift[182] ; 
Imag_reg[183] <= InputImag_Shift[183] ; 
Imag_reg[184] <= InputImag_Shift[184] ; 
Imag_reg[185] <= InputImag_Shift[185] ; 
Imag_reg[186] <= InputImag_Shift[186] ; 
Imag_reg[187] <= InputImag_Shift[187] ; 
Imag_reg[188] <= InputImag_Shift[188] ; 
Imag_reg[189] <= InputImag_Shift[189] ; 
Imag_reg[190] <= InputImag_Shift[190] ; 
Imag_reg[191] <= InputImag_Shift[191] ; 
Imag_reg[192] <= InputImag_Shift[192] ; 
Imag_reg[193] <= InputImag_Shift[193] ; 
Imag_reg[194] <= InputImag_Shift[194] ; 
Imag_reg[195] <= InputImag_Shift[195] ; 
Imag_reg[196] <= InputImag_Shift[196] ; 
Imag_reg[197] <= InputImag_Shift[197] ; 
Imag_reg[198] <= InputImag_Shift[198] ; 
Imag_reg[199] <= InputImag_Shift[199] ; 
Imag_reg[200] <= InputImag_Shift[200] ; 
Imag_reg[201] <= InputImag_Shift[201] ; 
Imag_reg[202] <= InputImag_Shift[202] ; 
Imag_reg[203] <= InputImag_Shift[203] ; 
Imag_reg[204] <= InputImag_Shift[204] ; 
Imag_reg[205] <= InputImag_Shift[205] ; 
Imag_reg[206] <= InputImag_Shift[206] ; 
Imag_reg[207] <= InputImag_Shift[207] ; 
Imag_reg[208] <= InputImag_Shift[208] ; 
Imag_reg[209] <= InputImag_Shift[209] ; 
Imag_reg[210] <= InputImag_Shift[210] ; 
Imag_reg[211] <= InputImag_Shift[211] ; 
Imag_reg[212] <= InputImag_Shift[212] ; 
Imag_reg[213] <= InputImag_Shift[213] ; 
Imag_reg[214] <= InputImag_Shift[214] ; 
Imag_reg[215] <= InputImag_Shift[215] ; 
Imag_reg[216] <= InputImag_Shift[216] ; 
Imag_reg[217] <= InputImag_Shift[217] ; 
Imag_reg[218] <= InputImag_Shift[218] ; 
Imag_reg[219] <= InputImag_Shift[219] ; 
Imag_reg[220] <= InputImag_Shift[220] ; 
Imag_reg[221] <= InputImag_Shift[221] ; 
Imag_reg[222] <= InputImag_Shift[222] ; 
Imag_reg[223] <= InputImag_Shift[223] ; 
Imag_reg[224] <= InputImag_Shift[224] ; 
Imag_reg[225] <= InputImag_Shift[225] ; 
Imag_reg[226] <= InputImag_Shift[226] ; 
Imag_reg[227] <= InputImag_Shift[227] ; 
Imag_reg[228] <= InputImag_Shift[228] ; 
Imag_reg[229] <= InputImag_Shift[229] ; 
Imag_reg[230] <= InputImag_Shift[230] ; 
Imag_reg[231] <= InputImag_Shift[231] ; 
Imag_reg[232] <= InputImag_Shift[232] ; 
Imag_reg[233] <= InputImag_Shift[233] ; 
Imag_reg[234] <= InputImag_Shift[234] ; 
Imag_reg[235] <= InputImag_Shift[235] ; 
Imag_reg[236] <= InputImag_Shift[236] ; 
Imag_reg[237] <= InputImag_Shift[237] ; 
Imag_reg[238] <= InputImag_Shift[238] ; 
Imag_reg[239] <= InputImag_Shift[239] ; 
Imag_reg[240] <= InputImag_Shift[240] ; 
Imag_reg[241] <= InputImag_Shift[241] ; 
Imag_reg[242] <= InputImag_Shift[242] ; 
Imag_reg[243] <= InputImag_Shift[243] ; 
Imag_reg[244] <= InputImag_Shift[244] ; 
Imag_reg[245] <= InputImag_Shift[245] ; 
Imag_reg[246] <= InputImag_Shift[246] ; 
Imag_reg[247] <= InputImag_Shift[247] ; 
Imag_reg[248] <= InputImag_Shift[248] ; 
Imag_reg[249] <= InputImag_Shift[249] ; 
Imag_reg[250] <= InputImag_Shift[250] ; 
Imag_reg[251] <= InputImag_Shift[251] ; 
Imag_reg[252] <= InputImag_Shift[252] ; 
Imag_reg[253] <= InputImag_Shift[253] ; 
Imag_reg[254] <= InputImag_Shift[254] ; 
Imag_reg[255] <= InputImag_Shift[255] ;
                    
                end
                //valid <= 0;
            end
            ///////////////// Load imaginary and real part of input signal to the shift register ////////////////////
            load:begin
                InputReal_Shift[255] <= realpart[9] ? {{2{1'b1}},realpart} : {{2{1'b0}},realpart}  ;
                InputImag_Shift[255] <= imagpart[9] ? {{2{1'b1}},imagpart} : {{2{1'b0}},imagpart}  ;
                
                InputReal_Shift[0] <= InputReal_Shift[1];  InputImag_Shift[0] <= InputImag_Shift[1];  InputReal_Shift[1] <= InputReal_Shift[2];  InputImag_Shift[1] <= InputImag_Shift[2];
                InputReal_Shift[2] <= InputReal_Shift[3];  InputImag_Shift[2] <= InputImag_Shift[3];  InputReal_Shift[3] <= InputReal_Shift[4];  InputImag_Shift[3] <= InputImag_Shift[4];
                InputReal_Shift[4] <= InputReal_Shift[5];  InputImag_Shift[4] <= InputImag_Shift[5];  InputReal_Shift[5] <= InputReal_Shift[6];  InputImag_Shift[5] <= InputImag_Shift[6];
                InputReal_Shift[6] <= InputReal_Shift[7];  InputImag_Shift[6] <= InputImag_Shift[7];  InputReal_Shift[7] <= InputReal_Shift[8];  InputImag_Shift[7] <= InputImag_Shift[8];
                InputReal_Shift[8] <= InputReal_Shift[9];  InputImag_Shift[8] <= InputImag_Shift[9];  InputReal_Shift[9] <= InputReal_Shift[10];  InputImag_Shift[9] <= InputImag_Shift[10];
                InputReal_Shift[10] <= InputReal_Shift[11];  InputImag_Shift[10] <= InputImag_Shift[11];  InputReal_Shift[11] <= InputReal_Shift[12];  InputImag_Shift[11] <= InputImag_Shift[12];
                InputReal_Shift[12] <= InputReal_Shift[13];  InputImag_Shift[12] <= InputImag_Shift[13];  InputReal_Shift[13] <= InputReal_Shift[14];  InputImag_Shift[13] <= InputImag_Shift[14];
                InputReal_Shift[14] <= InputReal_Shift[15];  InputImag_Shift[14] <= InputImag_Shift[15];  InputReal_Shift[15] <= InputReal_Shift[16];  InputImag_Shift[15] <= InputImag_Shift[16];
                InputReal_Shift[16] <= InputReal_Shift[17];  InputImag_Shift[16] <= InputImag_Shift[17];  InputReal_Shift[17] <= InputReal_Shift[18];  InputImag_Shift[17] <= InputImag_Shift[18];
                InputReal_Shift[18] <= InputReal_Shift[19];  InputImag_Shift[18] <= InputImag_Shift[19];  InputReal_Shift[19] <= InputReal_Shift[20];  InputImag_Shift[19] <= InputImag_Shift[20];
                InputReal_Shift[20] <= InputReal_Shift[21];  InputImag_Shift[20] <= InputImag_Shift[21];  InputReal_Shift[21] <= InputReal_Shift[22];  InputImag_Shift[21] <= InputImag_Shift[22];
                InputReal_Shift[22] <= InputReal_Shift[23];  InputImag_Shift[22] <= InputImag_Shift[23];  InputReal_Shift[23] <= InputReal_Shift[24];  InputImag_Shift[23] <= InputImag_Shift[24];
                InputReal_Shift[24] <= InputReal_Shift[25];  InputImag_Shift[24] <= InputImag_Shift[25];  InputReal_Shift[25] <= InputReal_Shift[26];  InputImag_Shift[25] <= InputImag_Shift[26];
                InputReal_Shift[26] <= InputReal_Shift[27];  InputImag_Shift[26] <= InputImag_Shift[27];  InputReal_Shift[27] <= InputReal_Shift[28];  InputImag_Shift[27] <= InputImag_Shift[28];
                InputReal_Shift[28] <= InputReal_Shift[29];  InputImag_Shift[28] <= InputImag_Shift[29];  InputReal_Shift[29] <= InputReal_Shift[30];  InputImag_Shift[29] <= InputImag_Shift[30];
                InputReal_Shift[30] <= InputReal_Shift[31];  InputImag_Shift[30] <= InputImag_Shift[31];  InputReal_Shift[31] <= InputReal_Shift[32];  InputImag_Shift[31] <= InputImag_Shift[32];
                InputReal_Shift[32] <= InputReal_Shift[33];  InputImag_Shift[32] <= InputImag_Shift[33];  InputReal_Shift[33] <= InputReal_Shift[34];  InputImag_Shift[33] <= InputImag_Shift[34];
                InputReal_Shift[34] <= InputReal_Shift[35];  InputImag_Shift[34] <= InputImag_Shift[35];  InputReal_Shift[35] <= InputReal_Shift[36];  InputImag_Shift[35] <= InputImag_Shift[36];
                InputReal_Shift[36] <= InputReal_Shift[37];  InputImag_Shift[36] <= InputImag_Shift[37];  InputReal_Shift[37] <= InputReal_Shift[38];  InputImag_Shift[37] <= InputImag_Shift[38];
                InputReal_Shift[38] <= InputReal_Shift[39];  InputImag_Shift[38] <= InputImag_Shift[39];  InputReal_Shift[39] <= InputReal_Shift[40];  InputImag_Shift[39] <= InputImag_Shift[40];
                InputReal_Shift[40] <= InputReal_Shift[41];  InputImag_Shift[40] <= InputImag_Shift[41];  InputReal_Shift[41] <= InputReal_Shift[42];  InputImag_Shift[41] <= InputImag_Shift[42];
                InputReal_Shift[42] <= InputReal_Shift[43];  InputImag_Shift[42] <= InputImag_Shift[43];  InputReal_Shift[43] <= InputReal_Shift[44];  InputImag_Shift[43] <= InputImag_Shift[44];
                InputReal_Shift[44] <= InputReal_Shift[45];  InputImag_Shift[44] <= InputImag_Shift[45];  InputReal_Shift[45] <= InputReal_Shift[46];  InputImag_Shift[45] <= InputImag_Shift[46];
                InputReal_Shift[46] <= InputReal_Shift[47];  InputImag_Shift[46] <= InputImag_Shift[47];  InputReal_Shift[47] <= InputReal_Shift[48];  InputImag_Shift[47] <= InputImag_Shift[48];
                InputReal_Shift[48] <= InputReal_Shift[49];  InputImag_Shift[48] <= InputImag_Shift[49];  InputReal_Shift[49] <= InputReal_Shift[50];  InputImag_Shift[49] <= InputImag_Shift[50];
                InputReal_Shift[50] <= InputReal_Shift[51];  InputImag_Shift[50] <= InputImag_Shift[51];  InputReal_Shift[51] <= InputReal_Shift[52];  InputImag_Shift[51] <= InputImag_Shift[52];
                InputReal_Shift[52] <= InputReal_Shift[53];  InputImag_Shift[52] <= InputImag_Shift[53];  InputReal_Shift[53] <= InputReal_Shift[54];  InputImag_Shift[53] <= InputImag_Shift[54];
                InputReal_Shift[54] <= InputReal_Shift[55];  InputImag_Shift[54] <= InputImag_Shift[55];  InputReal_Shift[55] <= InputReal_Shift[56];  InputImag_Shift[55] <= InputImag_Shift[56];
                InputReal_Shift[56] <= InputReal_Shift[57];  InputImag_Shift[56] <= InputImag_Shift[57];  InputReal_Shift[57] <= InputReal_Shift[58];  InputImag_Shift[57] <= InputImag_Shift[58];
                InputReal_Shift[58] <= InputReal_Shift[59];  InputImag_Shift[58] <= InputImag_Shift[59];  InputReal_Shift[59] <= InputReal_Shift[60];  InputImag_Shift[59] <= InputImag_Shift[60];
                InputReal_Shift[60] <= InputReal_Shift[61];  InputImag_Shift[60] <= InputImag_Shift[61];  InputReal_Shift[61] <= InputReal_Shift[62];  InputImag_Shift[61] <= InputImag_Shift[62];
                InputReal_Shift[62] <= InputReal_Shift[63];  InputImag_Shift[62] <= InputImag_Shift[63];  InputReal_Shift[63] <= InputReal_Shift[64];  InputImag_Shift[63] <= InputImag_Shift[64];
                InputReal_Shift[64] <= InputReal_Shift[65];  InputImag_Shift[64] <= InputImag_Shift[65];  InputReal_Shift[65] <= InputReal_Shift[66];  InputImag_Shift[65] <= InputImag_Shift[66];
                InputReal_Shift[66] <= InputReal_Shift[67];  InputImag_Shift[66] <= InputImag_Shift[67];  InputReal_Shift[67] <= InputReal_Shift[68];  InputImag_Shift[67] <= InputImag_Shift[68];
                InputReal_Shift[68] <= InputReal_Shift[69];  InputImag_Shift[68] <= InputImag_Shift[69];  InputReal_Shift[69] <= InputReal_Shift[70];  InputImag_Shift[69] <= InputImag_Shift[70];
                InputReal_Shift[70] <= InputReal_Shift[71];  InputImag_Shift[70] <= InputImag_Shift[71];  InputReal_Shift[71] <= InputReal_Shift[72];  InputImag_Shift[71] <= InputImag_Shift[72];
                InputReal_Shift[72] <= InputReal_Shift[73];  InputImag_Shift[72] <= InputImag_Shift[73];  InputReal_Shift[73] <= InputReal_Shift[74];  InputImag_Shift[73] <= InputImag_Shift[74];
                InputReal_Shift[74] <= InputReal_Shift[75];  InputImag_Shift[74] <= InputImag_Shift[75];  InputReal_Shift[75] <= InputReal_Shift[76];  InputImag_Shift[75] <= InputImag_Shift[76];
                InputReal_Shift[76] <= InputReal_Shift[77];  InputImag_Shift[76] <= InputImag_Shift[77];  InputReal_Shift[77] <= InputReal_Shift[78];  InputImag_Shift[77] <= InputImag_Shift[78];
                InputReal_Shift[78] <= InputReal_Shift[79];  InputImag_Shift[78] <= InputImag_Shift[79];  InputReal_Shift[79] <= InputReal_Shift[80];  InputImag_Shift[79] <= InputImag_Shift[80];
                InputReal_Shift[80] <= InputReal_Shift[81];  InputImag_Shift[80] <= InputImag_Shift[81];  InputReal_Shift[81] <= InputReal_Shift[82];  InputImag_Shift[81] <= InputImag_Shift[82];
                InputReal_Shift[82] <= InputReal_Shift[83];  InputImag_Shift[82] <= InputImag_Shift[83];  InputReal_Shift[83] <= InputReal_Shift[84];  InputImag_Shift[83] <= InputImag_Shift[84];
                InputReal_Shift[84] <= InputReal_Shift[85];  InputImag_Shift[84] <= InputImag_Shift[85];  InputReal_Shift[85] <= InputReal_Shift[86];  InputImag_Shift[85] <= InputImag_Shift[86];
                InputReal_Shift[86] <= InputReal_Shift[87];  InputImag_Shift[86] <= InputImag_Shift[87];  InputReal_Shift[87] <= InputReal_Shift[88];  InputImag_Shift[87] <= InputImag_Shift[88];
                InputReal_Shift[88] <= InputReal_Shift[89];  InputImag_Shift[88] <= InputImag_Shift[89];  InputReal_Shift[89] <= InputReal_Shift[90];  InputImag_Shift[89] <= InputImag_Shift[90];
                InputReal_Shift[90] <= InputReal_Shift[91];  InputImag_Shift[90] <= InputImag_Shift[91];  InputReal_Shift[91] <= InputReal_Shift[92];  InputImag_Shift[91] <= InputImag_Shift[92];
                InputReal_Shift[92] <= InputReal_Shift[93];  InputImag_Shift[92] <= InputImag_Shift[93];  InputReal_Shift[93] <= InputReal_Shift[94];  InputImag_Shift[93] <= InputImag_Shift[94];
                InputReal_Shift[94] <= InputReal_Shift[95];  InputImag_Shift[94] <= InputImag_Shift[95];  InputReal_Shift[95] <= InputReal_Shift[96];  InputImag_Shift[95] <= InputImag_Shift[96];
                InputReal_Shift[96] <= InputReal_Shift[97];  InputImag_Shift[96] <= InputImag_Shift[97];  InputReal_Shift[97] <= InputReal_Shift[98];  InputImag_Shift[97] <= InputImag_Shift[98];
                InputReal_Shift[98] <= InputReal_Shift[99];  InputImag_Shift[98] <= InputImag_Shift[99];  InputReal_Shift[99] <= InputReal_Shift[100];  InputImag_Shift[99] <= InputImag_Shift[100];
                InputReal_Shift[100] <= InputReal_Shift[101];  InputImag_Shift[100] <= InputImag_Shift[101];  InputReal_Shift[101] <= InputReal_Shift[102];  InputImag_Shift[101] <= InputImag_Shift[102];
                InputReal_Shift[102] <= InputReal_Shift[103];  InputImag_Shift[102] <= InputImag_Shift[103];  InputReal_Shift[103] <= InputReal_Shift[104];  InputImag_Shift[103] <= InputImag_Shift[104];
                InputReal_Shift[104] <= InputReal_Shift[105];  InputImag_Shift[104] <= InputImag_Shift[105];  InputReal_Shift[105] <= InputReal_Shift[106];  InputImag_Shift[105] <= InputImag_Shift[106];
                InputReal_Shift[106] <= InputReal_Shift[107];  InputImag_Shift[106] <= InputImag_Shift[107];  InputReal_Shift[107] <= InputReal_Shift[108];  InputImag_Shift[107] <= InputImag_Shift[108];
                InputReal_Shift[108] <= InputReal_Shift[109];  InputImag_Shift[108] <= InputImag_Shift[109];  InputReal_Shift[109] <= InputReal_Shift[110];  InputImag_Shift[109] <= InputImag_Shift[110];
                InputReal_Shift[110] <= InputReal_Shift[111];  InputImag_Shift[110] <= InputImag_Shift[111];  InputReal_Shift[111] <= InputReal_Shift[112];  InputImag_Shift[111] <= InputImag_Shift[112];
                InputReal_Shift[112] <= InputReal_Shift[113];  InputImag_Shift[112] <= InputImag_Shift[113];  InputReal_Shift[113] <= InputReal_Shift[114];  InputImag_Shift[113] <= InputImag_Shift[114];
                InputReal_Shift[114] <= InputReal_Shift[115];  InputImag_Shift[114] <= InputImag_Shift[115];  InputReal_Shift[115] <= InputReal_Shift[116];  InputImag_Shift[115] <= InputImag_Shift[116];
                InputReal_Shift[116] <= InputReal_Shift[117];  InputImag_Shift[116] <= InputImag_Shift[117];  InputReal_Shift[117] <= InputReal_Shift[118];  InputImag_Shift[117] <= InputImag_Shift[118];
                InputReal_Shift[118] <= InputReal_Shift[119];  InputImag_Shift[118] <= InputImag_Shift[119];  InputReal_Shift[119] <= InputReal_Shift[120];  InputImag_Shift[119] <= InputImag_Shift[120];
                InputReal_Shift[120] <= InputReal_Shift[121];  InputImag_Shift[120] <= InputImag_Shift[121];  InputReal_Shift[121] <= InputReal_Shift[122];  InputImag_Shift[121] <= InputImag_Shift[122];
                InputReal_Shift[122] <= InputReal_Shift[123];  InputImag_Shift[122] <= InputImag_Shift[123];  InputReal_Shift[123] <= InputReal_Shift[124];  InputImag_Shift[123] <= InputImag_Shift[124];
                InputReal_Shift[124] <= InputReal_Shift[125];  InputImag_Shift[124] <= InputImag_Shift[125];  InputReal_Shift[125] <= InputReal_Shift[126];  InputImag_Shift[125] <= InputImag_Shift[126];
                InputReal_Shift[126] <= InputReal_Shift[127];  InputImag_Shift[126] <= InputImag_Shift[127];  InputReal_Shift[127] <= InputReal_Shift[128];  InputImag_Shift[127] <= InputImag_Shift[128];
                InputReal_Shift[128] <= InputReal_Shift[129];  InputImag_Shift[128] <= InputImag_Shift[129];  InputReal_Shift[129] <= InputReal_Shift[130];  InputImag_Shift[129] <= InputImag_Shift[130];
                InputReal_Shift[130] <= InputReal_Shift[131];  InputImag_Shift[130] <= InputImag_Shift[131];  InputReal_Shift[131] <= InputReal_Shift[132];  InputImag_Shift[131] <= InputImag_Shift[132];
                InputReal_Shift[132] <= InputReal_Shift[133];  InputImag_Shift[132] <= InputImag_Shift[133];  InputReal_Shift[133] <= InputReal_Shift[134];  InputImag_Shift[133] <= InputImag_Shift[134];
                InputReal_Shift[134] <= InputReal_Shift[135];  InputImag_Shift[134] <= InputImag_Shift[135];  InputReal_Shift[135] <= InputReal_Shift[136];  InputImag_Shift[135] <= InputImag_Shift[136];
                InputReal_Shift[136] <= InputReal_Shift[137];  InputImag_Shift[136] <= InputImag_Shift[137];  InputReal_Shift[137] <= InputReal_Shift[138];  InputImag_Shift[137] <= InputImag_Shift[138];
                InputReal_Shift[138] <= InputReal_Shift[139];  InputImag_Shift[138] <= InputImag_Shift[139];  InputReal_Shift[139] <= InputReal_Shift[140];  InputImag_Shift[139] <= InputImag_Shift[140];
                InputReal_Shift[140] <= InputReal_Shift[141];  InputImag_Shift[140] <= InputImag_Shift[141];  InputReal_Shift[141] <= InputReal_Shift[142];  InputImag_Shift[141] <= InputImag_Shift[142];
                InputReal_Shift[142] <= InputReal_Shift[143];  InputImag_Shift[142] <= InputImag_Shift[143];  InputReal_Shift[143] <= InputReal_Shift[144];  InputImag_Shift[143] <= InputImag_Shift[144];
                InputReal_Shift[144] <= InputReal_Shift[145];  InputImag_Shift[144] <= InputImag_Shift[145];  InputReal_Shift[145] <= InputReal_Shift[146];  InputImag_Shift[145] <= InputImag_Shift[146];
                InputReal_Shift[146] <= InputReal_Shift[147];  InputImag_Shift[146] <= InputImag_Shift[147];  InputReal_Shift[147] <= InputReal_Shift[148];  InputImag_Shift[147] <= InputImag_Shift[148];
                InputReal_Shift[148] <= InputReal_Shift[149];  InputImag_Shift[148] <= InputImag_Shift[149];  InputReal_Shift[149] <= InputReal_Shift[150];  InputImag_Shift[149] <= InputImag_Shift[150];
                InputReal_Shift[150] <= InputReal_Shift[151];  InputImag_Shift[150] <= InputImag_Shift[151];  InputReal_Shift[151] <= InputReal_Shift[152];  InputImag_Shift[151] <= InputImag_Shift[152];
                InputReal_Shift[152] <= InputReal_Shift[153];  InputImag_Shift[152] <= InputImag_Shift[153];  InputReal_Shift[153] <= InputReal_Shift[154];  InputImag_Shift[153] <= InputImag_Shift[154];
                InputReal_Shift[154] <= InputReal_Shift[155];  InputImag_Shift[154] <= InputImag_Shift[155];  InputReal_Shift[155] <= InputReal_Shift[156];  InputImag_Shift[155] <= InputImag_Shift[156];
                InputReal_Shift[156] <= InputReal_Shift[157];  InputImag_Shift[156] <= InputImag_Shift[157];  InputReal_Shift[157] <= InputReal_Shift[158];  InputImag_Shift[157] <= InputImag_Shift[158];
                InputReal_Shift[158] <= InputReal_Shift[159];  InputImag_Shift[158] <= InputImag_Shift[159];  InputReal_Shift[159] <= InputReal_Shift[160];  InputImag_Shift[159] <= InputImag_Shift[160];
                InputReal_Shift[160] <= InputReal_Shift[161];  InputImag_Shift[160] <= InputImag_Shift[161];  InputReal_Shift[161] <= InputReal_Shift[162];  InputImag_Shift[161] <= InputImag_Shift[162];
                InputReal_Shift[162] <= InputReal_Shift[163];  InputImag_Shift[162] <= InputImag_Shift[163];  InputReal_Shift[163] <= InputReal_Shift[164];  InputImag_Shift[163] <= InputImag_Shift[164];
                InputReal_Shift[164] <= InputReal_Shift[165];  InputImag_Shift[164] <= InputImag_Shift[165];  InputReal_Shift[165] <= InputReal_Shift[166];  InputImag_Shift[165] <= InputImag_Shift[166];
                InputReal_Shift[166] <= InputReal_Shift[167];  InputImag_Shift[166] <= InputImag_Shift[167];  InputReal_Shift[167] <= InputReal_Shift[168];  InputImag_Shift[167] <= InputImag_Shift[168];
                InputReal_Shift[168] <= InputReal_Shift[169];  InputImag_Shift[168] <= InputImag_Shift[169];  InputReal_Shift[169] <= InputReal_Shift[170];  InputImag_Shift[169] <= InputImag_Shift[170];
                InputReal_Shift[170] <= InputReal_Shift[171];  InputImag_Shift[170] <= InputImag_Shift[171];  InputReal_Shift[171] <= InputReal_Shift[172];  InputImag_Shift[171] <= InputImag_Shift[172];
                InputReal_Shift[172] <= InputReal_Shift[173];  InputImag_Shift[172] <= InputImag_Shift[173];  InputReal_Shift[173] <= InputReal_Shift[174];  InputImag_Shift[173] <= InputImag_Shift[174];
                InputReal_Shift[174] <= InputReal_Shift[175];  InputImag_Shift[174] <= InputImag_Shift[175];  InputReal_Shift[175] <= InputReal_Shift[176];  InputImag_Shift[175] <= InputImag_Shift[176];
                InputReal_Shift[176] <= InputReal_Shift[177];  InputImag_Shift[176] <= InputImag_Shift[177];  InputReal_Shift[177] <= InputReal_Shift[178];  InputImag_Shift[177] <= InputImag_Shift[178];
                InputReal_Shift[178] <= InputReal_Shift[179];  InputImag_Shift[178] <= InputImag_Shift[179];  InputReal_Shift[179] <= InputReal_Shift[180];  InputImag_Shift[179] <= InputImag_Shift[180];
                InputReal_Shift[180] <= InputReal_Shift[181];  InputImag_Shift[180] <= InputImag_Shift[181];  InputReal_Shift[181] <= InputReal_Shift[182];  InputImag_Shift[181] <= InputImag_Shift[182];
                InputReal_Shift[182] <= InputReal_Shift[183];  InputImag_Shift[182] <= InputImag_Shift[183];  InputReal_Shift[183] <= InputReal_Shift[184];  InputImag_Shift[183] <= InputImag_Shift[184];
                InputReal_Shift[184] <= InputReal_Shift[185];  InputImag_Shift[184] <= InputImag_Shift[185];  InputReal_Shift[185] <= InputReal_Shift[186];  InputImag_Shift[185] <= InputImag_Shift[186];
                InputReal_Shift[186] <= InputReal_Shift[187];  InputImag_Shift[186] <= InputImag_Shift[187];  InputReal_Shift[187] <= InputReal_Shift[188];  InputImag_Shift[187] <= InputImag_Shift[188];
                InputReal_Shift[188] <= InputReal_Shift[189];  InputImag_Shift[188] <= InputImag_Shift[189];  InputReal_Shift[189] <= InputReal_Shift[190];  InputImag_Shift[189] <= InputImag_Shift[190];
                InputReal_Shift[190] <= InputReal_Shift[191];  InputImag_Shift[190] <= InputImag_Shift[191];  InputReal_Shift[191] <= InputReal_Shift[192];  InputImag_Shift[191] <= InputImag_Shift[192];
                InputReal_Shift[192] <= InputReal_Shift[193];  InputImag_Shift[192] <= InputImag_Shift[193];  InputReal_Shift[193] <= InputReal_Shift[194];  InputImag_Shift[193] <= InputImag_Shift[194];
                InputReal_Shift[194] <= InputReal_Shift[195];  InputImag_Shift[194] <= InputImag_Shift[195];  InputReal_Shift[195] <= InputReal_Shift[196];  InputImag_Shift[195] <= InputImag_Shift[196];
                InputReal_Shift[196] <= InputReal_Shift[197];  InputImag_Shift[196] <= InputImag_Shift[197];  InputReal_Shift[197] <= InputReal_Shift[198];  InputImag_Shift[197] <= InputImag_Shift[198];
                InputReal_Shift[198] <= InputReal_Shift[199];  InputImag_Shift[198] <= InputImag_Shift[199];  InputReal_Shift[199] <= InputReal_Shift[200];  InputImag_Shift[199] <= InputImag_Shift[200];
                InputReal_Shift[200] <= InputReal_Shift[201];  InputImag_Shift[200] <= InputImag_Shift[201];  InputReal_Shift[201] <= InputReal_Shift[202];  InputImag_Shift[201] <= InputImag_Shift[202];
                InputReal_Shift[202] <= InputReal_Shift[203];  InputImag_Shift[202] <= InputImag_Shift[203];  InputReal_Shift[203] <= InputReal_Shift[204];  InputImag_Shift[203] <= InputImag_Shift[204];
                InputReal_Shift[204] <= InputReal_Shift[205];  InputImag_Shift[204] <= InputImag_Shift[205];  InputReal_Shift[205] <= InputReal_Shift[206];  InputImag_Shift[205] <= InputImag_Shift[206];
                InputReal_Shift[206] <= InputReal_Shift[207];  InputImag_Shift[206] <= InputImag_Shift[207];  InputReal_Shift[207] <= InputReal_Shift[208];  InputImag_Shift[207] <= InputImag_Shift[208];
                InputReal_Shift[208] <= InputReal_Shift[209];  InputImag_Shift[208] <= InputImag_Shift[209];  InputReal_Shift[209] <= InputReal_Shift[210];  InputImag_Shift[209] <= InputImag_Shift[210];
                InputReal_Shift[210] <= InputReal_Shift[211];  InputImag_Shift[210] <= InputImag_Shift[211];  InputReal_Shift[211] <= InputReal_Shift[212];  InputImag_Shift[211] <= InputImag_Shift[212];
                InputReal_Shift[212] <= InputReal_Shift[213];  InputImag_Shift[212] <= InputImag_Shift[213];  InputReal_Shift[213] <= InputReal_Shift[214];  InputImag_Shift[213] <= InputImag_Shift[214];
                InputReal_Shift[214] <= InputReal_Shift[215];  InputImag_Shift[214] <= InputImag_Shift[215];  InputReal_Shift[215] <= InputReal_Shift[216];  InputImag_Shift[215] <= InputImag_Shift[216];
                InputReal_Shift[216] <= InputReal_Shift[217];  InputImag_Shift[216] <= InputImag_Shift[217];  InputReal_Shift[217] <= InputReal_Shift[218];  InputImag_Shift[217] <= InputImag_Shift[218];
                InputReal_Shift[218] <= InputReal_Shift[219];  InputImag_Shift[218] <= InputImag_Shift[219];  InputReal_Shift[219] <= InputReal_Shift[220];  InputImag_Shift[219] <= InputImag_Shift[220];
                InputReal_Shift[220] <= InputReal_Shift[221];  InputImag_Shift[220] <= InputImag_Shift[221];  InputReal_Shift[221] <= InputReal_Shift[222];  InputImag_Shift[221] <= InputImag_Shift[222];
                InputReal_Shift[222] <= InputReal_Shift[223];  InputImag_Shift[222] <= InputImag_Shift[223];  InputReal_Shift[223] <= InputReal_Shift[224];  InputImag_Shift[223] <= InputImag_Shift[224];
                InputReal_Shift[224] <= InputReal_Shift[225];  InputImag_Shift[224] <= InputImag_Shift[225];  InputReal_Shift[225] <= InputReal_Shift[226];  InputImag_Shift[225] <= InputImag_Shift[226];
                InputReal_Shift[226] <= InputReal_Shift[227];  InputImag_Shift[226] <= InputImag_Shift[227];  InputReal_Shift[227] <= InputReal_Shift[228];  InputImag_Shift[227] <= InputImag_Shift[228];
                InputReal_Shift[228] <= InputReal_Shift[229];  InputImag_Shift[228] <= InputImag_Shift[229];  InputReal_Shift[229] <= InputReal_Shift[230];  InputImag_Shift[229] <= InputImag_Shift[230];
                InputReal_Shift[230] <= InputReal_Shift[231];  InputImag_Shift[230] <= InputImag_Shift[231];  InputReal_Shift[231] <= InputReal_Shift[232];  InputImag_Shift[231] <= InputImag_Shift[232];
                InputReal_Shift[232] <= InputReal_Shift[233];  InputImag_Shift[232] <= InputImag_Shift[233];  InputReal_Shift[233] <= InputReal_Shift[234];  InputImag_Shift[233] <= InputImag_Shift[234];
                InputReal_Shift[234] <= InputReal_Shift[235];  InputImag_Shift[234] <= InputImag_Shift[235];  InputReal_Shift[235] <= InputReal_Shift[236];  InputImag_Shift[235] <= InputImag_Shift[236];
                InputReal_Shift[236] <= InputReal_Shift[237];  InputImag_Shift[236] <= InputImag_Shift[237];  InputReal_Shift[237] <= InputReal_Shift[238];  InputImag_Shift[237] <= InputImag_Shift[238];
                InputReal_Shift[238] <= InputReal_Shift[239];  InputImag_Shift[238] <= InputImag_Shift[239];  InputReal_Shift[239] <= InputReal_Shift[240];  InputImag_Shift[239] <= InputImag_Shift[240];
                InputReal_Shift[240] <= InputReal_Shift[241];  InputImag_Shift[240] <= InputImag_Shift[241];  InputReal_Shift[241] <= InputReal_Shift[242];  InputImag_Shift[241] <= InputImag_Shift[242];
                InputReal_Shift[242] <= InputReal_Shift[243];  InputImag_Shift[242] <= InputImag_Shift[243];  InputReal_Shift[243] <= InputReal_Shift[244];  InputImag_Shift[243] <= InputImag_Shift[244];
                InputReal_Shift[244] <= InputReal_Shift[245];  InputImag_Shift[244] <= InputImag_Shift[245];  InputReal_Shift[245] <= InputReal_Shift[246];  InputImag_Shift[245] <= InputImag_Shift[246];
                InputReal_Shift[246] <= InputReal_Shift[247];  InputImag_Shift[246] <= InputImag_Shift[247];  InputReal_Shift[247] <= InputReal_Shift[248];  InputImag_Shift[247] <= InputImag_Shift[248];
                InputReal_Shift[248] <= InputReal_Shift[249];  InputImag_Shift[248] <= InputImag_Shift[249];  InputReal_Shift[249] <= InputReal_Shift[250];  InputImag_Shift[249] <= InputImag_Shift[250];
                InputReal_Shift[250] <= InputReal_Shift[251];  InputImag_Shift[250] <= InputImag_Shift[251];  InputReal_Shift[251] <= InputReal_Shift[252];  InputImag_Shift[251] <= InputImag_Shift[252];
                InputReal_Shift[252] <= InputReal_Shift[253];  InputImag_Shift[252] <= InputImag_Shift[253];  InputReal_Shift[253] <= InputReal_Shift[254];  InputImag_Shift[253] <= InputImag_Shift[254];
                InputReal_Shift[254] <= InputReal_Shift[255];  InputImag_Shift[254] <= InputImag_Shift[255];  
                
                counter <= counter +1;
                
                if(counter == {8{1'b1}}) begin
                    state <= first_dragon;
                    start_struct <=1;
                    counter <= 8'b0; counter1 <= 8'b0;
                    
                    add_to <= 8'd64;
                    
                    index0_reg <= 0;
                    index1_reg <= 64;       adr2 <= 64;
                    index2_reg <= 128;      adr3 <= 128;
                    index3_reg <= 192;      adr4 <= 192;
                end
            end
            //////////////////// control signal of first stage  ////////////////////////////////////
            first_dragon:begin
                valid <= 0;
                start_mult <= 1;
                counter <= counter +1 ;
                
                if(counter == 8'd63) begin
                    state <= second_dragon;
                    counter <= 8'b0;
                    add_to <= 8'd16;
                    stage <= 2;
                end
            end
            /////////////////// control signal of second stage //////////////////////////////////
            second_dragon: begin
                if(counter == 8'd15) begin
                    counter1 <= counter1 + 1;
                    counter <= 0;
                    
                    if(counter1 == 8'd3)begin
                        counter1 <= 0;
                        state <= third_dragon;
                        counter <= 8'b0;
                        add_to <= 8'd4;
                        offset <= 0;
                        stage <= 4;
                    end
                    else begin
                        offset <= offset + 64 ;
                    end
                end
                else begin
                    counter <= counter + 1 ;
                end
            end
            ///////////////////// control signal of third stage  //////////////////////////////////
            third_dragon: begin
                if(counter == 8'd3) begin
                    counter1 <= counter1 + 1;
                    counter <= 0;
                    
                    if(counter1 == 8'd15)begin
                        counter1 <= 0;
                        state <= fourth;
                        counter <= 8'b0;
                        add_to <= 8'd1;
                        offset <= 0;
                        stage <= 6;
                    end
                    else begin
                        offset <= offset + 16 ;
                    end
                end
                else begin
                    counter <= counter + 1 ;
                end
            end
            //////////////////// control signal of fourth stage ////////////////////////////////////
            fourth:begin
                if(counter == 8'd252)begin
                    finish_reg <= 1;
                end
                
                if(finish_reg) begin
                    state <= finish;
                    not_last <=1;
                    counter <= 0;
                end
                else begin
                    counter <= counter +4 ;
                end
            end
            
            finish: begin
                    offset <= 0;
                    stage<=0;
                    start_mult <= 0;
                    not_last <=0;
                    state <= idle ;
                    busy <= 0;
                    valid <= 1 ;
                    start_struct <= 0;
                    finish_reg<= 0 ;
                    
                    bar_0 <= sort_real   [0]   [15:9] ;
                    bar_1 <= sort_real   [1]   [15:9] ;
                    bar_2 <= sort_real   [2]   [15:9] ;
                    bar_3 <= sort_real   [3]   [15:9] ;
                    bar_4 <= sort_real   [4]   [15:9] ;
                    bar_5 <= sort_real   [5]   [15:9] ;
                    bar_6 <= sort_real   [6]   [15:9] ;
                    bar_7 <= sort_real   [7]   [15:9] ;
                    bar_8 <= sort_real   [8]   [15:9] ;
                    bar_9 <= sort_real   [9]   [15:9] ;
                    bar_10 <= sort_real  [10]  [15:9] ;
                    bar_11 <= sort_real  [11]  [15:9] ;
                    bar_12 <= sort_real  [12]  [15:9] ;
                    bar_13 <= sort_real  [13]  [15:9] ;
                    bar_14 <= sort_real  [14]  [15:9] ;
                    bar_15 <= sort_real  [15]  [15:9] ;
                    bar_16 <= sort_real  [16]  [15:9] ;
                    bar_17 <= sort_real  [17]  [15:9] ;
                    bar_18 <= sort_real  [18]  [15:9] ;
                    bar_19 <= sort_real  [19]  [15:9] ;
                    bar_20 <= sort_real  [20]  [15:9] ;
                    bar_21 <= sort_real  [21]  [15:9] ;
                    bar_22 <= sort_real  [22]  [15:9] ;
                    bar_23 <= sort_real  [23]  [15:9] ;
                    bar_24 <= sort_real  [24]  [15:9] ;
                    bar_25 <= sort_real  [25]  [15:9] ;
                    bar_26 <= sort_real  [26]  [15:9] ;
                    bar_27 <= sort_real  [27]  [15:9] ;
                    bar_28 <= sort_real  [28]  [15:9] ;
                    bar_29 <= sort_real  [29]  [15:9] ;
                    bar_30 <= sort_real  [30]  [15:9] ;
                    bar_31 <= sort_real  [31]  [15:9] ;
                    bar_32 <= sort_real  [32]  [15:9] ;
                    bar_33 <= sort_real  [33]  [15:9] ;
                    bar_34 <= sort_real  [34]  [15:9] ;
                    bar_35 <= sort_real  [35]  [15:9] ;
                    bar_36 <= sort_real  [36]  [15:9] ;
                    bar_37 <= sort_real  [37]  [15:9] ;
                    bar_38 <= sort_real  [38]  [15:9] ;
                    bar_39 <= sort_real  [39]  [15:9] ;
                    bar_40 <= sort_real  [40]  [15:9] ;
                    bar_41 <= sort_real  [41]  [15:9] ;
                    bar_42 <= sort_real  [42]  [15:9] ;
                    bar_43 <= sort_real  [43]  [15:9] ;
                    bar_44 <= sort_real  [44]  [15:9] ;
                    bar_45 <= sort_real  [45]  [15:9] ;
                    bar_46 <= sort_real  [46]  [15:9] ;
                    bar_47 <= sort_real  [47]  [15:9] ;
                    bar_48 <= sort_real  [48]  [15:9] ;
                    bar_49 <= sort_real  [49]  [15:9] ;
                    bar_50 <= sort_real  [50]  [15:9] ;
                    bar_51 <= sort_real  [51]  [15:9] ;
                    bar_52 <= sort_real  [52]  [15:9] ;
                    bar_53 <= sort_real  [53]  [15:9] ;
                    bar_54 <= sort_real  [54]  [15:9] ;
                    bar_55 <= sort_real  [55]  [15:9] ;
                    bar_56 <= sort_real  [56]  [15:9] ;
                    bar_57 <= sort_real  [57]  [15:9] ;
                    bar_58 <= sort_real  [58]  [15:9] ;
                    bar_59 <= sort_real  [59]  [15:9] ;
                    bar_60 <= sort_real  [60]  [15:9] ;
                    bar_61 <= sort_real  [61]  [15:9] ;
                    bar_62 <= sort_real  [62]  [15:9] ;
                    bar_63 <= sort_real  [63]  [15:9] ;
                    bar_64 <= sort_real  [64]  [15:9] ;
                    bar_65 <= sort_real  [65]  [15:9] ;
                    bar_66 <= sort_real  [66]  [15:9] ;
                    bar_67 <= sort_real  [67]  [15:9] ;
                    bar_68 <= sort_real  [68]  [15:9] ;
                    bar_69 <= sort_real  [69]  [15:9] ;
                    bar_70 <= sort_real  [70]  [15:9] ;
                    bar_71 <= sort_real  [71]  [15:9] ;
                    bar_72 <= sort_real  [72]  [15:9] ;
                    bar_73 <= sort_real  [73]  [15:9] ;
                    bar_74 <= sort_real  [74]  [15:9] ;
                    bar_75 <= sort_real  [75]  [15:9] ;
                    bar_76 <= sort_real  [76]  [15:9] ;
                    bar_77 <= sort_real  [77]  [15:9] ;
                    bar_78 <= sort_real  [78]  [15:9] ;
                    bar_79 <= sort_real  [79]  [15:9] ;
                    bar_80 <= sort_real  [80]  [15:9] ;
                    bar_81 <= sort_real  [81]  [15:9] ;
                    bar_82 <= sort_real  [82]  [15:9] ;
                    bar_83 <= sort_real  [83]  [15:9] ;
                    bar_84 <= sort_real  [84]  [15:9] ;
                    bar_85 <= sort_real  [85]  [15:9] ;
                    bar_86 <= sort_real  [86]  [15:9] ;
                    bar_87 <= sort_real  [87]  [15:9] ;
                    bar_88 <= sort_real  [88]  [15:9] ;
                    bar_89 <= sort_real  [89]  [15:9] ;
                    bar_90 <= sort_real  [90]  [15:9] ;
                    bar_91 <= sort_real  [91]  [15:9] ;
                    bar_92 <= sort_real  [92]  [15:9] ;
                    bar_93 <= sort_real  [93]  [15:9] ;
                    bar_94 <= sort_real  [94]  [15:9] ;
                    bar_95 <= sort_real  [95]  [15:9] ;
                    bar_96 <= sort_real  [96]  [15:9] ;
                    bar_97 <= sort_real  [97]  [15:9] ;
                    bar_98 <= sort_real  [98]  [15:9] ;
                    bar_99 <= sort_real  [99]  [15:9] ;
                    bar_100 <= sort_real [100] [15:9];
                    bar_101 <= sort_real [101] [15:9];
                    bar_102 <= sort_real [102] [15:9];
                    bar_103 <= sort_real [103] [15:9];
                    bar_104 <= sort_real [104] [15:9];
                    bar_105 <= sort_real [105] [15:9];
                    bar_106 <= sort_real [106] [15:9];
                    bar_107 <= sort_real [107] [15:9];
                    bar_108 <= sort_real [108] [15:9];
                    bar_109 <= sort_real [109] [15:9];
                    bar_110 <= sort_real [110] [15:9];
                    bar_111 <= sort_real [111] [15:9];
                    bar_112 <= sort_real [112] [15:9];
                    bar_113 <= sort_real [113] [15:9];
                    bar_114 <= sort_real [114] [15:9];
                    bar_115 <= sort_real [115] [15:9];
                    bar_116 <= sort_real [116] [15:9];
                    bar_117 <= sort_real [117] [15:9];
                    bar_118 <= sort_real [118] [15:9];
                    bar_119 <= sort_real [119] [15:9];
                    bar_120 <= sort_real [120] [15:9];
                    bar_121 <= sort_real [121] [15:9];
                    bar_122 <= sort_real [122] [15:9];
                    bar_123 <= sort_real [123] [15:9];
                    bar_124 <= sort_real [124] [15:9];
                    bar_125 <= sort_real [125] [15:9];
                    bar_126 <= sort_real [126] [15:9];
                    bar_127 <= sort_real [127] [15:9];
                    
                    ibar_0 <= sort_imag[0]      [15:9];
                    ibar_1 <= sort_imag[1]      [15:9];
                    ibar_2 <= sort_imag[2]      [15:9];
                    ibar_3 <= sort_imag[3]      [15:9];
                    ibar_4 <= sort_imag[4]      [15:9];
                    ibar_5 <= sort_imag[5]      [15:9];
                    ibar_6 <= sort_imag[6]      [15:9];
                    ibar_7 <= sort_imag[7]      [15:9];
                    ibar_8 <= sort_imag[8]      [15:9];
                    ibar_9 <= sort_imag[9]      [15:9];
                    ibar_10 <= sort_imag  [10]  [15:9];
                    ibar_11 <= sort_imag  [11]  [15:9];
                    ibar_12 <= sort_imag  [12]  [15:9];
                    ibar_13 <= sort_imag  [13]  [15:9];
                    ibar_14 <= sort_imag  [14]  [15:9];
                    ibar_15 <= sort_imag  [15]  [15:9];
                    ibar_16 <= sort_imag  [16]  [15:9];
                    ibar_17 <= sort_imag  [17]  [15:9];
                    ibar_18 <= sort_imag  [18]  [15:9];
                    ibar_19 <= sort_imag  [19]  [15:9];
                    ibar_20 <= sort_imag  [20]  [15:9];
                    ibar_21 <= sort_imag  [21]  [15:9];
                    ibar_22 <= sort_imag  [22]  [15:9];
                    ibar_23 <= sort_imag  [23]  [15:9];
                    ibar_24 <= sort_imag  [24]  [15:9];
                    ibar_25 <= sort_imag  [25]  [15:9];
                    ibar_26 <= sort_imag  [26]  [15:9];
                    ibar_27 <= sort_imag  [27]  [15:9];
                    ibar_28 <= sort_imag  [28]  [15:9];
                    ibar_29 <= sort_imag  [29]  [15:9];
                    ibar_30 <= sort_imag  [30]  [15:9];
                    ibar_31 <= sort_imag  [31]  [15:9];
                    ibar_32 <= sort_imag  [32]  [15:9];
                    ibar_33 <= sort_imag  [33]  [15:9];
                    ibar_34 <= sort_imag  [34]  [15:9];
                    ibar_35 <= sort_imag  [35]  [15:9];
                    ibar_36 <= sort_imag  [36]  [15:9];
                    ibar_37 <= sort_imag  [37]  [15:9];
                    ibar_38 <= sort_imag  [38]  [15:9];
                    ibar_39 <= sort_imag  [39]  [15:9];
                    ibar_40 <= sort_imag  [40]  [15:9];
                    ibar_41 <= sort_imag  [41]  [15:9];
                    ibar_42 <= sort_imag  [42]  [15:9];
                    ibar_43 <= sort_imag  [43]  [15:9];
                    ibar_44 <= sort_imag  [44]  [15:9];
                    ibar_45 <= sort_imag  [45]  [15:9];
                    ibar_46 <= sort_imag  [46]  [15:9];
                    ibar_47 <= sort_imag  [47]  [15:9];
                    ibar_48 <= sort_imag  [48]  [15:9];
                    ibar_49 <= sort_imag  [49]  [15:9];
                    ibar_50 <= sort_imag  [50]  [15:9];
                    ibar_51 <= sort_imag  [51]  [15:9];
                    ibar_52 <= sort_imag  [52]  [15:9];
                    ibar_53 <= sort_imag  [53]  [15:9];
                    ibar_54 <= sort_imag  [54]  [15:9];
                    ibar_55 <= sort_imag  [55]  [15:9];
                    ibar_56 <= sort_imag  [56]  [15:9];
                    ibar_57 <= sort_imag  [57]  [15:9];
                    ibar_58 <= sort_imag  [58]  [15:9];
                    ibar_59 <= sort_imag  [59]  [15:9];
                    ibar_60 <= sort_imag  [60]  [15:9];
                    ibar_61 <= sort_imag  [61]  [15:9];
                    ibar_62 <= sort_imag  [62]  [15:9];
                    ibar_63 <= sort_imag  [63]  [15:9];
                    ibar_64 <= sort_imag  [64]  [15:9];
                    ibar_65 <= sort_imag  [65]  [15:9];
                    ibar_66 <= sort_imag  [66]  [15:9];
                    ibar_67 <= sort_imag  [67]  [15:9];
                    ibar_68 <= sort_imag  [68]  [15:9];
                    ibar_69 <= sort_imag  [69]  [15:9];
                    ibar_70 <= sort_imag  [70]  [15:9];
                    ibar_71 <= sort_imag  [71]  [15:9];
                    ibar_72 <= sort_imag  [72]  [15:9];
                    ibar_73 <= sort_imag  [73]  [15:9];
                    ibar_74 <= sort_imag  [74]  [15:9];
                    ibar_75 <= sort_imag  [75]  [15:9];
                    ibar_76 <= sort_imag  [76]  [15:9];
                    ibar_77 <= sort_imag  [77]  [15:9];
                    ibar_78 <= sort_imag  [78]  [15:9];
                    ibar_79 <= sort_imag  [79]  [15:9];
                    ibar_80 <= sort_imag  [80]  [15:9];
                    ibar_81 <= sort_imag  [81]  [15:9];
                    ibar_82 <= sort_imag  [82]  [15:9];
                    ibar_83 <= sort_imag  [83]  [15:9];
                    ibar_84 <= sort_imag  [84]  [15:9];
                    ibar_85 <= sort_imag  [85]  [15:9];
                    ibar_86 <= sort_imag  [86]  [15:9];
                    ibar_87 <= sort_imag  [87]  [15:9];
                    ibar_88 <= sort_imag  [88]  [15:9];
                    ibar_89 <= sort_imag  [89]  [15:9];
                    ibar_90 <= sort_imag  [90]  [15:9];
                    ibar_91 <= sort_imag  [91]  [15:9];
                    ibar_92 <= sort_imag  [92]  [15:9];
                    ibar_93 <= sort_imag  [93]  [15:9];
                    ibar_94 <= sort_imag  [94]  [15:9];
                    ibar_95 <= sort_imag  [95]  [15:9];
                    ibar_96 <= sort_imag  [96]  [15:9];
                    ibar_97 <= sort_imag  [97]  [15:9];
                    ibar_98 <= sort_imag  [98]  [15:9];
                    ibar_99 <= sort_imag  [99]  [15:9];
                    ibar_100 <= sort_imag [100] [15:9];
                    ibar_101 <= sort_imag [101] [15:9];
                    ibar_102 <= sort_imag [102] [15:9];
                    ibar_103 <= sort_imag [103] [15:9];
                    ibar_104 <= sort_imag [104] [15:9];
                    ibar_105 <= sort_imag [105] [15:9];
                    ibar_106 <= sort_imag [106] [15:9];
                    ibar_107 <= sort_imag [107] [15:9];
                    ibar_108 <= sort_imag [108] [15:9];
                    ibar_109 <= sort_imag [109] [15:9];
                    ibar_110 <= sort_imag [110] [15:9];
                    ibar_111 <= sort_imag [111] [15:9];
                    ibar_112 <= sort_imag [112] [15:9];
                    ibar_113 <= sort_imag [113] [15:9];
                    ibar_114 <= sort_imag [114] [15:9];
                    ibar_115 <= sort_imag [115] [15:9];
                    ibar_116 <= sort_imag [116] [15:9];
                    ibar_117 <= sort_imag [117] [15:9];
                    ibar_118 <= sort_imag [118] [15:9];
                    ibar_119 <= sort_imag [119] [15:9];
                    ibar_120 <= sort_imag [120] [15:9];
                    ibar_121 <= sort_imag [121] [15:9];
                    ibar_122 <= sort_imag [122] [15:9];
                    ibar_123 <= sort_imag [123] [15:9];
                    ibar_124 <= sort_imag [124] [15:9];
                    ibar_125 <= sort_imag [125] [15:9];
                    ibar_126 <= sort_imag [126] [15:9];
                    ibar_127 <= sort_imag [127] [15:9];
            end
            
        endcase
    end
end

endmodule