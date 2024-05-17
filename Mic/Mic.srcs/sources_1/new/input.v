`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 07:34:39 PM
// Design Name: 
// Module Name: input
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


module input_converter(
    input [9:0] mic_data,
    input       mic_data_valid,
    
    input rst,
    input clk,
    output reg start_fft,
    
    output [9:0] real_0 ,real_1 ,real_2 ,real_3 ,real_4 ,real_5 ,real_6 ,real_7 ,real_8 ,real_9 ,real_10 ,real_11 ,real_12 ,real_13 ,real_14 ,real_15 ,real_16 ,real_17 ,real_18 ,real_19 ,real_20 ,real_21 ,real_22 ,real_23 ,real_24 ,real_25 ,real_26 ,real_27 ,real_28 ,real_29 ,real_30 ,real_31 ,real_32 ,real_33 ,real_34 ,real_35 ,real_36 ,real_37 ,real_38 ,real_39 ,real_40 ,real_41 ,real_42 ,real_43 ,real_44 ,real_45 ,real_46 ,real_47 ,real_48 ,real_49 ,real_50 ,
real_51 ,real_52 ,real_53 ,real_54 ,real_55 ,real_56 ,real_57 ,real_58 ,real_59 ,real_60 ,real_61 ,real_62 ,real_63 ,real_64 ,real_65 ,real_66 ,real_67 ,real_68 ,real_69 ,real_70 ,real_71 ,real_72 ,real_73 ,real_74 ,real_75 ,real_76 ,real_77 ,real_78 ,real_79 ,real_80 ,real_81 ,real_82 ,real_83 ,real_84 ,real_85 ,real_86 ,real_87 ,real_88 ,real_89 ,real_90 ,real_91 ,real_92 ,real_93 ,real_94 ,real_95 ,real_96 ,real_97 ,real_98 ,real_99 ,real_100 ,
real_101 ,real_102 ,real_103 ,real_104 ,real_105 ,real_106 ,real_107 ,real_108 ,real_109 ,real_110 ,real_111 ,real_112 ,real_113 ,real_114 ,real_115 ,real_116 ,real_117 ,real_118 ,real_119 ,real_120 ,real_121 ,real_122 ,real_123 ,real_124 ,real_125 ,real_126 ,real_127 ,real_128 ,real_129 ,real_130 ,real_131 ,real_132 ,real_133 ,real_134 ,real_135 ,real_136 ,real_137 ,real_138 ,real_139 ,real_140 ,real_141 ,real_142 ,real_143 ,real_144 ,real_145 ,real_146 ,real_147 ,real_148 ,real_149 ,real_150 ,
real_151 ,real_152 ,real_153 ,real_154 ,real_155 ,real_156 ,real_157 ,real_158 ,real_159 ,real_160 ,real_161 ,real_162 ,real_163 ,real_164 ,real_165 ,real_166 ,real_167 ,real_168 ,real_169 ,real_170 ,real_171 ,real_172 ,real_173 ,real_174 ,real_175 ,real_176 ,real_177 ,real_178 ,real_179 ,real_180 ,real_181 ,real_182 ,real_183 ,real_184 ,real_185 ,real_186 ,real_187 ,real_188 ,real_189 ,real_190 ,real_191 ,real_192 ,real_193 ,real_194 ,real_195 ,real_196 ,real_197 ,real_198 ,real_199 ,real_200 ,
real_201 ,real_202 ,real_203 ,real_204 ,real_205 ,real_206 ,real_207 ,real_208 ,real_209 ,real_210 ,real_211 ,real_212 ,real_213 ,real_214 ,real_215 ,real_216 ,real_217 ,real_218 ,real_219 ,real_220 ,real_221 ,real_222 ,real_223 ,real_224 ,real_225 ,real_226 ,real_227 ,real_228 ,real_229 ,real_230 ,real_231 ,real_232 ,real_233 ,real_234 ,real_235 ,real_236 ,real_237 ,real_238 ,real_239 ,real_240 ,real_241 ,real_242 ,real_243 ,real_244 ,real_245 ,real_246 ,real_247 ,real_248 ,real_249 ,real_250 ,
real_251 ,real_252 ,real_253 ,real_254 ,real_255 
    
    );
    
    (* MARK_DEBUG = "TRUE" *) reg [8:0] counter;
    reg [1:0] state;
    
    reg [9:0] temp [0:255];
    
    assign real_0  =  temp[0] ;assign real_1  =  temp[1] ;assign real_2  =  temp[2] ;assign real_3  =  temp[3] ;assign real_4  =  temp[4] ;assign real_5  =  temp[5] ;assign real_6  =  temp[6] ;assign real_7  =  temp[7] ;assign real_8  =  temp[8] ;assign real_9  =  temp[9] ;assign real_10  =  temp[10] ;assign real_11  =  temp[11] ;assign real_12  =  temp[12] ;assign real_13  =  temp[13] ;assign real_14  =  temp[14] ;assign real_15  =  temp[15] ;assign real_16  =  temp[16] ;assign real_17  =  temp[17] ;assign real_18  =  temp[18] ;assign real_19  =  temp[19] ;assign real_20  =  temp[20] ;assign real_21  =  temp[21] ;assign real_22  =  temp[22] ;assign real_23  =  temp[23] ;assign real_24  =  temp[24] ;assign real_25  =  temp[25] ;assign real_26  =  temp[26] ;assign real_27  =  temp[27] ;assign real_28  =  temp[28] ;assign real_29  =  temp[29] ;assign real_30  =  temp[30] ;assign real_31  =  temp[31] ;assign real_32  =  temp[32] ;assign real_33  =  temp[33] ;assign real_34  =  temp[34] ;assign real_35  =  temp[35] ;assign real_36  =  temp[36] ;assign real_37  =  temp[37] ;assign real_38  =  temp[38] ;assign real_39  =  temp[39] ;assign real_40  =  temp[40] ;assign real_41  =  temp[41] ;assign real_42  =  temp[42] ;assign real_43  =  temp[43] ;assign real_44  =  temp[44] ;assign real_45  =  temp[45] ;assign real_46  =  temp[46] ;assign real_47  =  temp[47] ;assign real_48  =  temp[48] ;assign real_49  =  temp[49] ;assign real_50  =  temp[50] ;

assign real_51  =  temp[51] ;assign real_52  =  temp[52] ;assign real_53  =  temp[53] ;assign real_54  =  temp[54] ;assign real_55  =  temp[55] ;assign real_56  =  temp[56] ;assign real_57  =  temp[57] ;assign real_58  =  temp[58] ;assign real_59  =  temp[59] ;assign real_60  =  temp[60] ;assign real_61  =  temp[61] ;assign real_62  =  temp[62] ;assign real_63  =  temp[63] ;assign real_64  =  temp[64] ;assign real_65  =  temp[65] ;assign real_66  =  temp[66] ;assign real_67  =  temp[67] ;assign real_68  =  temp[68] ;assign real_69  =  temp[69] ;assign real_70  =  temp[70] ;assign real_71  =  temp[71] ;assign real_72  =  temp[72] ;assign real_73  =  temp[73] ;assign real_74  =  temp[74] ;assign real_75  =  temp[75] ;assign real_76  =  temp[76] ;assign real_77  =  temp[77] ;assign real_78  =  temp[78] ;assign real_79  =  temp[79] ;assign real_80  =  temp[80] ;assign real_81  =  temp[81] ;assign real_82  =  temp[82] ;assign real_83  =  temp[83] ;assign real_84  =  temp[84] ;assign real_85  =  temp[85] ;assign real_86  =  temp[86] ;assign real_87  =  temp[87] ;assign real_88  =  temp[88] ;assign real_89  =  temp[89] ;assign real_90  =  temp[90] ;assign real_91  =  temp[91] ;assign real_92  =  temp[92] ;assign real_93  =  temp[93] ;assign real_94  =  temp[94] ;assign real_95  =  temp[95] ;assign real_96  =  temp[96] ;assign real_97  =  temp[97] ;assign real_98  =  temp[98] ;assign real_99  =  temp[99] ;assign real_100  =  temp[100] ;

assign real_101  =  temp[101] ;assign real_102  =  temp[102] ;assign real_103  =  temp[103] ;assign real_104  =  temp[104] ;assign real_105  =  temp[105] ;assign real_106  =  temp[106] ;assign real_107  =  temp[107] ;assign real_108  =  temp[108] ;assign real_109  =  temp[109] ;assign real_110  =  temp[110] ;assign real_111  =  temp[111] ;assign real_112  =  temp[112] ;assign real_113  =  temp[113] ;assign real_114  =  temp[114] ;assign real_115  =  temp[115] ;assign real_116  =  temp[116] ;assign real_117  =  temp[117] ;assign real_118  =  temp[118] ;assign real_119  =  temp[119] ;assign real_120  =  temp[120] ;assign real_121  =  temp[121] ;assign real_122  =  temp[122] ;assign real_123  =  temp[123] ;assign real_124  =  temp[124] ;assign real_125  =  temp[125] ;assign real_126  =  temp[126] ;assign real_127  =  temp[127] ;assign real_128  =  temp[128] ;assign real_129  =  temp[129] ;assign real_130  =  temp[130] ;assign real_131  =  temp[131] ;assign real_132  =  temp[132] ;assign real_133  =  temp[133] ;assign real_134  =  temp[134] ;assign real_135  =  temp[135] ;assign real_136  =  temp[136] ;assign real_137  =  temp[137] ;assign real_138  =  temp[138] ;assign real_139  =  temp[139] ;assign real_140  =  temp[140] ;assign real_141  =  temp[141] ;assign real_142  =  temp[142] ;assign real_143  =  temp[143] ;assign real_144  =  temp[144] ;assign real_145  =  temp[145] ;assign real_146  =  temp[146] ;assign real_147  =  temp[147] ;assign real_148  =  temp[148] ;assign real_149  =  temp[149] ;assign real_150  =  temp[150] ;

assign real_151  =  temp[151] ;assign real_152  =  temp[152] ;assign real_153  =  temp[153] ;assign real_154  =  temp[154] ;assign real_155  =  temp[155] ;assign real_156  =  temp[156] ;assign real_157  =  temp[157] ;assign real_158  =  temp[158] ;assign real_159  =  temp[159] ;assign real_160  =  temp[160] ;assign real_161  =  temp[161] ;assign real_162  =  temp[162] ;assign real_163  =  temp[163] ;assign real_164  =  temp[164] ;assign real_165  =  temp[165] ;assign real_166  =  temp[166] ;assign real_167  =  temp[167] ;assign real_168  =  temp[168] ;assign real_169  =  temp[169] ;assign real_170  =  temp[170] ;assign real_171  =  temp[171] ;assign real_172  =  temp[172] ;assign real_173  =  temp[173] ;assign real_174  =  temp[174] ;assign real_175  =  temp[175] ;assign real_176  =  temp[176] ;assign real_177  =  temp[177] ;assign real_178  =  temp[178] ;assign real_179  =  temp[179] ;assign real_180  =  temp[180] ;assign real_181  =  temp[181] ;assign real_182  =  temp[182] ;assign real_183  =  temp[183] ;assign real_184  =  temp[184] ;assign real_185  =  temp[185] ;assign real_186  =  temp[186] ;assign real_187  =  temp[187] ;assign real_188  =  temp[188] ;assign real_189  =  temp[189] ;assign real_190  =  temp[190] ;assign real_191  =  temp[191] ;assign real_192  =  temp[192] ;assign real_193  =  temp[193] ;assign real_194  =  temp[194] ;assign real_195  =  temp[195] ;assign real_196  =  temp[196] ;assign real_197  =  temp[197] ;assign real_198  =  temp[198] ;assign real_199  =  temp[199] ;assign real_200  =  temp[200] ;

assign real_201  =  temp[201] ;assign real_202  =  temp[202] ;assign real_203  =  temp[203] ;assign real_204  =  temp[204] ;assign real_205  =  temp[205] ;assign real_206  =  temp[206] ;assign real_207  =  temp[207] ;assign real_208  =  temp[208] ;assign real_209  =  temp[209] ;assign real_210  =  temp[210] ;assign real_211  =  temp[211] ;assign real_212  =  temp[212] ;assign real_213  =  temp[213] ;assign real_214  =  temp[214] ;assign real_215  =  temp[215] ;assign real_216  =  temp[216] ;assign real_217  =  temp[217] ;assign real_218  =  temp[218] ;assign real_219  =  temp[219] ;assign real_220  =  temp[220] ;assign real_221  =  temp[221] ;assign real_222  =  temp[222] ;assign real_223  =  temp[223] ;assign real_224  =  temp[224] ;assign real_225  =  temp[225] ;assign real_226  =  temp[226] ;assign real_227  =  temp[227] ;assign real_228  =  temp[228] ;assign real_229  =  temp[229] ;assign real_230  =  temp[230] ;assign real_231  =  temp[231] ;assign real_232  =  temp[232] ;assign real_233  =  temp[233] ;assign real_234  =  temp[234] ;assign real_235  =  temp[235] ;assign real_236  =  temp[236] ;assign real_237  =  temp[237] ;assign real_238  =  temp[238] ;assign real_239  =  temp[239] ;assign real_240  =  temp[240] ;assign real_241  =  temp[241] ;assign real_242  =  temp[242] ;assign real_243  =  temp[243] ;assign real_244  =  temp[244] ;assign real_245  =  temp[245] ;assign real_246  =  temp[246] ;assign real_247  =  temp[247] ;assign real_248  =  temp[248] ;assign real_249  =  temp[249] ;assign real_250  =  temp[250] ;assign real_251  =  temp[251] ;assign real_252  =  temp[252] ;assign real_253  =  temp[253] ;assign real_254  =  temp[254] ;assign real_255  =  temp[255] ;
    
    reg shift;
    
    always @(posedge clk)begin
        if (rst) begin
            counter     <= 0;
            state       <= 0;
            start_fft   <= 0;
            shift       <= 0;
        end
        else begin
            start_fft   <= 0;
            if(mic_data_valid)begin
            shift <= 1;
                if(shift) begin
                    shift <= 0;
                    temp[0] <=  mic_data;
                    temp[1] <=  temp[0] ;temp[2] <=  temp[1] ;temp[3] <=  temp[2] ;temp[4] <=  temp[3] ;temp[5] <=  temp[4] ;temp[6] <=  temp[5] ;temp[7] <=  temp[6] ;temp[8] <=  temp[7] ;temp[9] <=  temp[8] ;temp[10] <=  temp[9] ;temp[11] <=  temp[10] ;temp[12] <=  temp[11] ;temp[13] <=  temp[12] ;temp[14] <=  temp[13] ;temp[15] <=  temp[14] ;temp[16] <=  temp[15] ;temp[17] <=  temp[16] ;temp[18] <=  temp[17] ;temp[19] <=  temp[18] ;temp[20] <=  temp[19] ;temp[21] <=  temp[20] ;temp[22] <=  temp[21] ;temp[23] <=  temp[22] ;temp[24] <=  temp[23] ;temp[25] <=  temp[24] ;temp[26] <=  temp[25] ;temp[27] <=  temp[26] ;temp[28] <=  temp[27] ;temp[29] <=  temp[28] ;temp[30] <=  temp[29] ;temp[31] <=  temp[30] ;temp[32] <=  temp[31] ;temp[33] <=  temp[32] ;temp[34] <=  temp[33] ;temp[35] <=  temp[34] ;temp[36] <=  temp[35] ;temp[37] <=  temp[36] ;temp[38] <=  temp[37] ;temp[39] <=  temp[38] ;temp[40] <=  temp[39] ;temp[41] <=  temp[40] ;temp[42] <=  temp[41] ;temp[43] <=  temp[42] ;temp[44] <=  temp[43] ;temp[45] <=  temp[44] ;temp[46] <=  temp[45] ;temp[47] <=  temp[46] ;temp[48] <=  temp[47] ;temp[49] <=  temp[48] ;temp[50] <=  temp[49] ;temp[51] <=  temp[50] ;
        
                    temp[52] <=  temp[51] ;temp[53] <=  temp[52] ;temp[54] <=  temp[53] ;temp[55] <=  temp[54] ;temp[56] <=  temp[55] ;temp[57] <=  temp[56] ;temp[58] <=  temp[57] ;temp[59] <=  temp[58] ;temp[60] <=  temp[59] ;temp[61] <=  temp[60] ;temp[62] <=  temp[61] ;temp[63] <=  temp[62] ;temp[64] <=  temp[63] ;temp[65] <=  temp[64] ;temp[66] <=  temp[65] ;temp[67] <=  temp[66] ;temp[68] <=  temp[67] ;temp[69] <=  temp[68] ;temp[70] <=  temp[69] ;temp[71] <=  temp[70] ;temp[72] <=  temp[71] ;temp[73] <=  temp[72] ;temp[74] <=  temp[73] ;temp[75] <=  temp[74] ;temp[76] <=  temp[75] ;temp[77] <=  temp[76] ;temp[78] <=  temp[77] ;temp[79] <=  temp[78] ;temp[80] <=  temp[79] ;temp[81] <=  temp[80] ;temp[82] <=  temp[81] ;temp[83] <=  temp[82] ;temp[84] <=  temp[83] ;temp[85] <=  temp[84] ;temp[86] <=  temp[85] ;temp[87] <=  temp[86] ;temp[88] <=  temp[87] ;temp[89] <=  temp[88] ;temp[90] <=  temp[89] ;temp[91] <=  temp[90] ;temp[92] <=  temp[91] ;temp[93] <=  temp[92] ;temp[94] <=  temp[93] ;temp[95] <=  temp[94] ;temp[96] <=  temp[95] ;temp[97] <=  temp[96] ;temp[98] <=  temp[97] ;temp[99] <=  temp[98] ;temp[100] <=  temp[99] ;temp[101] <=  temp[100] ;
                    
                    temp[102] <=  temp[101] ;temp[103] <=  temp[102] ;temp[104] <=  temp[103] ;temp[105] <=  temp[104] ;temp[106] <=  temp[105] ;temp[107] <=  temp[106] ;temp[108] <=  temp[107] ;temp[109] <=  temp[108] ;temp[110] <=  temp[109] ;temp[111] <=  temp[110] ;temp[112] <=  temp[111] ;temp[113] <=  temp[112] ;temp[114] <=  temp[113] ;temp[115] <=  temp[114] ;temp[116] <=  temp[115] ;temp[117] <=  temp[116] ;temp[118] <=  temp[117] ;temp[119] <=  temp[118] ;temp[120] <=  temp[119] ;temp[121] <=  temp[120] ;temp[122] <=  temp[121] ;temp[123] <=  temp[122] ;temp[124] <=  temp[123] ;temp[125] <=  temp[124] ;temp[126] <=  temp[125] ;temp[127] <=  temp[126] ;temp[128] <=  temp[127] ;temp[129] <=  temp[128] ;temp[130] <=  temp[129] ;temp[131] <=  temp[130] ;temp[132] <=  temp[131] ;temp[133] <=  temp[132] ;temp[134] <=  temp[133] ;temp[135] <=  temp[134] ;temp[136] <=  temp[135] ;temp[137] <=  temp[136] ;temp[138] <=  temp[137] ;temp[139] <=  temp[138] ;temp[140] <=  temp[139] ;temp[141] <=  temp[140] ;temp[142] <=  temp[141] ;temp[143] <=  temp[142] ;temp[144] <=  temp[143] ;temp[145] <=  temp[144] ;temp[146] <=  temp[145] ;temp[147] <=  temp[146] ;temp[148] <=  temp[147] ;temp[149] <=  temp[148] ;temp[150] <=  temp[149] ;temp[151] <=  temp[150] ;
                    
                    temp[152] <=  temp[151] ;temp[153] <=  temp[152] ;temp[154] <=  temp[153] ;temp[155] <=  temp[154] ;temp[156] <=  temp[155] ;temp[157] <=  temp[156] ;temp[158] <=  temp[157] ;temp[159] <=  temp[158] ;temp[160] <=  temp[159] ;temp[161] <=  temp[160] ;temp[162] <=  temp[161] ;temp[163] <=  temp[162] ;temp[164] <=  temp[163] ;temp[165] <=  temp[164] ;temp[166] <=  temp[165] ;temp[167] <=  temp[166] ;temp[168] <=  temp[167] ;temp[169] <=  temp[168] ;temp[170] <=  temp[169] ;temp[171] <=  temp[170] ;temp[172] <=  temp[171] ;temp[173] <=  temp[172] ;temp[174] <=  temp[173] ;temp[175] <=  temp[174] ;temp[176] <=  temp[175] ;temp[177] <=  temp[176] ;temp[178] <=  temp[177] ;temp[179] <=  temp[178] ;temp[180] <=  temp[179] ;temp[181] <=  temp[180] ;temp[182] <=  temp[181] ;temp[183] <=  temp[182] ;temp[184] <=  temp[183] ;temp[185] <=  temp[184] ;temp[186] <=  temp[185] ;temp[187] <=  temp[186] ;temp[188] <=  temp[187] ;temp[189] <=  temp[188] ;temp[190] <=  temp[189] ;temp[191] <=  temp[190] ;temp[192] <=  temp[191] ;temp[193] <=  temp[192] ;temp[194] <=  temp[193] ;temp[195] <=  temp[194] ;temp[196] <=  temp[195] ;temp[197] <=  temp[196] ;temp[198] <=  temp[197] ;temp[199] <=  temp[198] ;temp[200] <=  temp[199] ;temp[201] <=  temp[200] ;
                    
                    temp[202] <=  temp[201] ;temp[203] <=  temp[202] ;temp[204] <=  temp[203] ;temp[205] <=  temp[204] ;temp[206] <=  temp[205] ;temp[207] <=  temp[206] ;temp[208] <=  temp[207] ;temp[209] <=  temp[208] ;temp[210] <=  temp[209] ;temp[211] <=  temp[210] ;temp[212] <=  temp[211] ;temp[213] <=  temp[212] ;temp[214] <=  temp[213] ;temp[215] <=  temp[214] ;temp[216] <=  temp[215] ;temp[217] <=  temp[216] ;temp[218] <=  temp[217] ;temp[219] <=  temp[218] ;temp[220] <=  temp[219] ;temp[221] <=  temp[220] ;temp[222] <=  temp[221] ;temp[223] <=  temp[222] ;temp[224] <=  temp[223] ;temp[225] <=  temp[224] ;temp[226] <=  temp[225] ;temp[227] <=  temp[226] ;temp[228] <=  temp[227] ;temp[229] <=  temp[228] ;temp[230] <=  temp[229] ;temp[231] <=  temp[230] ;temp[232] <=  temp[231] ;temp[233] <=  temp[232] ;temp[234] <=  temp[233] ;temp[235] <=  temp[234] ;temp[236] <=  temp[235] ;temp[237] <=  temp[236] ;temp[238] <=  temp[237] ;temp[239] <=  temp[238] ;temp[240] <=  temp[239] ;temp[241] <=  temp[240] ;temp[242] <=  temp[241] ;temp[243] <=  temp[242] ;temp[244] <=  temp[243] ;temp[245] <=  temp[244] ;temp[246] <=  temp[245] ;temp[247] <=  temp[246] ;temp[248] <=  temp[247] ;temp[249] <=  temp[248] ;temp[250] <=  temp[249] ;temp[251] <=  temp[250] ;temp[252] <=  temp[251] ;temp[253] <=  temp[252] ;temp[254] <=  temp[253] ;temp[255] <=  temp[254] ;temp[256] <=  temp[255] ;
                    
                    if(counter <256) begin
                        counter <= counter + 1;
                    end
                end
                
                if (counter == 256)begin
                    start_fft   <= 1;
                end
            end
            
            end
            
        end
    
endmodule
