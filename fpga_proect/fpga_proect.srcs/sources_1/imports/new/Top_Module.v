    module ELE_432_Top_Module(
        input clk,
        input rst,          // middle button (N17)    // switch 0 (J15)
        
        input mic_data,     
        output mic_clock,
        output LR_sel,
        
        //output [7:0] mic_output,
        output H_sync,
        output V_sync,
        output [3:0] Red,
        output [3:0] Green,
        output [3:0] Blue
        );
        
         (* MARK_DEBUG = "TRUE" *) wire [9:0] data_out_mic;
        
        //assign mic_output[7:1] = data_out_mic;
        //assign mic_output[0] = valid_mic;
        
        (* MARK_DEBUG = "TRUE" *) wire start_vga;
        wire busy_vga;
        
        wire [13:0] bar_0_real, bar_1_real, bar_2_real, bar_3_real, bar_4_real, bar_5_real, bar_6_real, bar_7_real;
        wire [13:0] bar_8_real, bar_9_real, bar_10_real, bar_11_real, bar_12_real, bar_13_real, bar_14_real, bar_15_real;
        wire [13:0] bar_16_real, bar_17_real, bar_18_real, bar_19_real, bar_20_real, bar_21_real, bar_22_real, bar_23_real;
        wire [13:0] bar_24_real, bar_25_real, bar_26_real, bar_27_real, bar_28_real, bar_29_real, bar_30_real, bar_31_real;
        wire [13:0] bar_32_real, bar_33_real, bar_34_real, bar_35_real, bar_36_real, bar_37_real, bar_38_real, bar_39_real;
        wire [13:0] bar_40_real, bar_41_real, bar_42_real, bar_43_real, bar_44_real, bar_45_real, bar_46_real, bar_47_real;
        wire [13:0] bar_48_real, bar_49_real, bar_50_real, bar_51_real, bar_52_real, bar_53_real, bar_54_real, bar_55_real;
        wire [13:0] bar_56_real, bar_57_real, bar_58_real, bar_59_real, bar_60_real, bar_61_real, bar_62_real, bar_63_real;
        wire [13:0] bar_64_real, bar_65_real, bar_66_real, bar_67_real, bar_68_real, bar_69_real, bar_70_real, bar_71_real;
        wire [13:0] bar_72_real, bar_73_real, bar_74_real, bar_75_real, bar_76_real, bar_77_real, bar_78_real, bar_79_real;
        wire [13:0] bar_80_real, bar_81_real, bar_82_real, bar_83_real, bar_84_real, bar_85_real, bar_86_real, bar_87_real;
        wire [13:0] bar_88_real, bar_89_real, bar_90_real, bar_91_real, bar_92_real, bar_93_real, bar_94_real, bar_95_real;
        wire [13:0] bar_96_real, bar_97_real, bar_98_real, bar_99_real, bar_100_real, bar_101_real, bar_102_real, bar_103_real;
        wire [13:0] bar_104_real, bar_105_real, bar_106_real, bar_107_real, bar_108_real, bar_109_real, bar_110_real, bar_111_real;
        wire [13:0] bar_112_real, bar_113_real, bar_114_real, bar_115_real, bar_116_real, bar_117_real, bar_118_real, bar_119_real;
        wire [13:0] bar_120_real, bar_121_real, bar_122_real, bar_123_real, bar_124_real, bar_125_real, bar_126_real, bar_127_real;
              
        wire [13:0] bar_0_imag, bar_1_imag, bar_2_imag, bar_3_imag, bar_4_imag, bar_5_imag, bar_6_imag, bar_7_imag;
        wire [13:0] bar_8_imag, bar_9_imag, bar_10_imag, bar_11_imag, bar_12_imag, bar_13_imag, bar_14_imag, bar_15_imag;
        wire [13:0] bar_16_imag, bar_17_imag, bar_18_imag, bar_19_imag, bar_20_imag, bar_21_imag, bar_22_imag, bar_23_imag;
        wire [13:0] bar_24_imag, bar_25_imag, bar_26_imag, bar_27_imag, bar_28_imag, bar_29_imag, bar_30_imag, bar_31_imag;
        wire [13:0] bar_32_imag, bar_33_imag, bar_34_imag, bar_35_imag, bar_36_imag, bar_37_imag, bar_38_imag, bar_39_imag;
        wire [13:0] bar_40_imag, bar_41_imag, bar_42_imag, bar_43_imag, bar_44_imag, bar_45_imag, bar_46_imag, bar_47_imag;
        wire [13:0] bar_48_imag, bar_49_imag, bar_50_imag, bar_51_imag, bar_52_imag, bar_53_imag, bar_54_imag, bar_55_imag;
        wire [13:0] bar_56_imag, bar_57_imag, bar_58_imag, bar_59_imag, bar_60_imag, bar_61_imag, bar_62_imag, bar_63_imag;
        wire [13:0] bar_64_imag, bar_65_imag, bar_66_imag, bar_67_imag, bar_68_imag, bar_69_imag, bar_70_imag, bar_71_imag;
        wire [13:0] bar_72_imag, bar_73_imag, bar_74_imag, bar_75_imag, bar_76_imag, bar_77_imag, bar_78_imag, bar_79_imag;
        wire [13:0] bar_80_imag, bar_81_imag, bar_82_imag, bar_83_imag, bar_84_imag, bar_85_imag, bar_86_imag, bar_87_imag;
        wire [13:0] bar_88_imag, bar_89_imag, bar_90_imag, bar_91_imag, bar_92_imag, bar_93_imag, bar_94_imag, bar_95_imag;
        wire [13:0] bar_96_imag, bar_97_imag, bar_98_imag, bar_99_imag, bar_100_imag, bar_101_imag, bar_102_imag, bar_103_imag;
        wire [13:0] bar_104_imag, bar_105_imag, bar_106_imag, bar_107_imag, bar_108_imag, bar_109_imag, bar_110_imag, bar_111_imag;
        wire [13:0] bar_112_imag, bar_113_imag, bar_114_imag, bar_115_imag, bar_116_imag, bar_117_imag, bar_118_imag, bar_119_imag;
        wire [13:0] bar_120_imag, bar_121_imag, bar_122_imag, bar_123_imag, bar_124_imag, bar_125_imag, bar_126_imag, bar_127_imag;
        
        wire slow_clk;
        Divided_Clock Div_Clk(
            . clk(clk),
            . rst(rst),
            . div_clk(slow_clk)
        );
        
        (* MARK_DEBUG = "TRUE" *) wire valid_mic;
        pdm_microphone Mic(
            . clk(slow_clk),        // Clock input
            . rst(rst),
            . M_DATA(mic_data),     // Microphone data input
            . mic_data_valid(valid_mic),
            . mic_data(data_out_mic), // 10-bit microphone data output
            . M_CLK(mic_clock),
            . M_LRSEL(LR_sel)
        );
        
        
        wire [6:0] bar_0_wire_r,bar_1_wire_r,bar_2_wire_r,bar_3_wire_r,bar_4_wire_r,bar_5_wire_r,bar_6_wire_r,bar_7_wire_r,bar_8_wire_r,bar_9_wire_r,bar_10_wire_r,bar_11_wire_r,bar_12_wire_r,bar_13_wire_r,bar_14_wire_r,bar_15_wire_r,bar_16_wire_r,bar_17_wire_r,bar_18_wire_r,bar_19_wire_r,bar_20_wire_r,bar_21_wire_r,bar_22_wire_r,bar_23_wire_r,bar_24_wire_r,bar_25_wire_r,bar_26_wire_r,bar_27_wire_r,bar_28_wire_r,bar_29_wire_r,bar_30_wire_r,bar_31_wire_r,bar_32_wire_r,bar_33_wire_r,bar_34_wire_r,bar_35_wire_r,bar_36_wire_r,bar_37_wire_r,bar_38_wire_r,bar_39_wire_r,bar_40_wire_r,bar_41_wire_r,bar_42_wire_r,bar_43_wire_r,bar_44_wire_r,bar_45_wire_r,bar_46_wire_r,bar_47_wire_r,bar_48_wire_r,bar_49_wire_r,bar_50_wire_r,
    bar_51_wire_r,bar_52_wire_r,bar_53_wire_r,bar_54_wire_r,bar_55_wire_r,bar_56_wire_r,bar_57_wire_r,bar_58_wire_r,bar_59_wire_r,bar_60_wire_r,bar_61_wire_r,bar_62_wire_r,bar_63_wire_r,bar_64_wire_r,bar_65_wire_r,bar_66_wire_r,bar_67_wire_r,bar_68_wire_r,bar_69_wire_r,bar_70_wire_r,bar_71_wire_r,bar_72_wire_r,bar_73_wire_r,bar_74_wire_r,bar_75_wire_r,bar_76_wire_r,bar_77_wire_r,bar_78_wire_r,bar_79_wire_r,bar_80_wire_r,bar_81_wire_r,bar_82_wire_r,bar_83_wire_r,bar_84_wire_r,bar_85_wire_r,bar_86_wire_r,bar_87_wire_r,bar_88_wire_r,bar_89_wire_r,bar_90_wire_r,bar_91_wire_r,bar_92_wire_r,bar_93_wire_r,bar_94_wire_r,bar_95_wire_r,bar_96_wire_r,bar_97_wire_r,bar_98_wire_r,bar_99_wire_r,bar_100_wire_r,
    bar_101_wire_r,bar_102_wire_r,bar_103_wire_r,bar_104_wire_r,bar_105_wire_r,bar_106_wire_r,bar_107_wire_r,bar_108_wire_r,bar_109_wire_r,bar_110_wire_r,bar_111_wire_r,bar_112_wire_r,bar_113_wire_r,bar_114_wire_r,bar_115_wire_r,bar_116_wire_r,bar_117_wire_r,bar_118_wire_r,bar_119_wire_r,bar_120_wire_r,bar_121_wire_r,bar_122_wire_r,bar_123_wire_r,bar_124_wire_r,bar_125_wire_r,bar_126_wire_r,bar_127_wire_r;
        
        
        wire [6:0] bar_0_wire_i,bar_1_wire_i,bar_2_wire_i,bar_3_wire_i,bar_4_wire_i,bar_5_wire_i,bar_6_wire_i,bar_7_wire_i,bar_8_wire_i,bar_9_wire_i,bar_10_wire_i,bar_11_wire_i,bar_12_wire_i,bar_13_wire_i,bar_14_wire_i,bar_15_wire_i,bar_16_wire_i,bar_17_wire_i,bar_18_wire_i,bar_19_wire_i,bar_20_wire_i,bar_21_wire_i,bar_22_wire_i,bar_23_wire_i,bar_24_wire_i,bar_25_wire_i,bar_26_wire_i,bar_27_wire_i,bar_28_wire_i,bar_29_wire_i,bar_30_wire_i,bar_31_wire_i,bar_32_wire_i,bar_33_wire_i,bar_34_wire_i,bar_35_wire_i,bar_36_wire_i,bar_37_wire_i,bar_38_wire_i,bar_39_wire_i,bar_40_wire_i,bar_41_wire_i,bar_42_wire_i,bar_43_wire_i,bar_44_wire_i,bar_45_wire_i,bar_46_wire_i,bar_47_wire_i,bar_48_wire_i,bar_49_wire_i,bar_50_wire_i,
    bar_51_wire_i,bar_52_wire_i,bar_53_wire_i,bar_54_wire_i,bar_55_wire_i,bar_56_wire_i,bar_57_wire_i,bar_58_wire_i,bar_59_wire_i,bar_60_wire_i,bar_61_wire_i,bar_62_wire_i,bar_63_wire_i,bar_64_wire_i,bar_65_wire_i,bar_66_wire_i,bar_67_wire_i,bar_68_wire_i,bar_69_wire_i,bar_70_wire_i,bar_71_wire_i,bar_72_wire_i,bar_73_wire_i,bar_74_wire_i,bar_75_wire_i,bar_76_wire_i,bar_77_wire_i,bar_78_wire_i,bar_79_wire_i,bar_80_wire_i,bar_81_wire_i,bar_82_wire_i,bar_83_wire_i,bar_84_wire_i,bar_85_wire_i,bar_86_wire_i,bar_87_wire_i,bar_88_wire_i,bar_89_wire_i,bar_90_wire_i,bar_91_wire_i,bar_92_wire_i,bar_93_wire_i,bar_94_wire_i,bar_95_wire_i,bar_96_wire_i,bar_97_wire_i,bar_98_wire_i,bar_99_wire_i,bar_100_wire_i,
    bar_101_wire_i,bar_102_wire_i,bar_103_wire_i,bar_104_wire_i,bar_105_wire_i,bar_106_wire_i,bar_107_wire_i,bar_108_wire_i,bar_109_wire_i,bar_110_wire_i,bar_111_wire_i,bar_112_wire_i,bar_113_wire_i,bar_114_wire_i,bar_115_wire_i,bar_116_wire_i,bar_117_wire_i,bar_118_wire_i,bar_119_wire_i,bar_120_wire_i,bar_121_wire_i,bar_122_wire_i,bar_123_wire_i,bar_124_wire_i,bar_125_wire_i,bar_126_wire_i,bar_127_wire_i;
        
         Inverter inv(
        
        
            .bar_0_real(bar_0_wire_r),.bar_1_real(bar_1_wire_r),.bar_2_real(bar_2_wire_r),.bar_3_real(bar_3_wire_r),.bar_4_real(bar_4_wire_r),.bar_5_real(bar_5_wire_r),.bar_6_real(bar_6_wire_r),.bar_7_real(bar_7_wire_r),.bar_8_real(bar_8_wire_r),.bar_9_real(bar_9_wire_r),.bar_10_real(bar_10_wire_r),.bar_11_real(bar_11_wire_r),.bar_12_real(bar_12_wire_r),.bar_13_real(bar_13_wire_r),.bar_14_real(bar_14_wire_r),.bar_15_real(bar_15_wire_r),.bar_16_real(bar_16_wire_r),.bar_17_real(bar_17_wire_r),.bar_18_real(bar_18_wire_r),.bar_19_real(bar_19_wire_r),.bar_20_real(bar_20_wire_r),.bar_21_real(bar_21_wire_r),.bar_22_real(bar_22_wire_r),.bar_23_real(bar_23_wire_r),.bar_24_real(bar_24_wire_r),.bar_25_real(bar_25_wire_r),.bar_26_real(bar_26_wire_r),.bar_27_real(bar_27_wire_r),.bar_28_real(bar_28_wire_r),.bar_29_real(bar_29_wire_r),.bar_30_real(bar_30_wire_r),.bar_31_real(bar_31_wire_r),.bar_32_real(bar_32_wire_r),.bar_33_real(bar_33_wire_r),.bar_34_real(bar_34_wire_r),.bar_35_real(bar_35_wire_r),.bar_36_real(bar_36_wire_r),.bar_37_real(bar_37_wire_r),.bar_38_real(bar_38_wire_r),.bar_39_real(bar_39_wire_r),.bar_40_real(bar_40_wire_r),.bar_41_real(bar_41_wire_r),.bar_42_real(bar_42_wire_r),.bar_43_real(bar_43_wire_r),.bar_44_real(bar_44_wire_r),.bar_45_real(bar_45_wire_r),.bar_46_real(bar_46_wire_r),.bar_47_real(bar_47_wire_r),.bar_48_real(bar_48_wire_r),.bar_49_real(bar_49_wire_r),.bar_50_real(bar_50_wire_r),
            .bar_51_real(bar_51_wire_r),.bar_52_real(bar_52_wire_r),.bar_53_real(bar_53_wire_r),.bar_54_real(bar_54_wire_r),.bar_55_real(bar_55_wire_r),.bar_56_real(bar_56_wire_r),.bar_57_real(bar_57_wire_r),.bar_58_real(bar_58_wire_r),.bar_59_real(bar_59_wire_r),.bar_60_real(bar_60_wire_r),.bar_61_real(bar_61_wire_r),.bar_62_real(bar_62_wire_r),.bar_63_real(bar_63_wire_r),.bar_64_real(bar_64_wire_r),.bar_65_real(bar_65_wire_r),.bar_66_real(bar_66_wire_r),.bar_67_real(bar_67_wire_r),.bar_68_real(bar_68_wire_r),.bar_69_real(bar_69_wire_r),.bar_70_real(bar_70_wire_r),.bar_71_real(bar_71_wire_r),.bar_72_real(bar_72_wire_r),.bar_73_real(bar_73_wire_r),.bar_74_real(bar_74_wire_r),.bar_75_real(bar_75_wire_r),.bar_76_real(bar_76_wire_r),.bar_77_real(bar_77_wire_r),.bar_78_real(bar_78_wire_r),.bar_79_real(bar_79_wire_r),.bar_80_real(bar_80_wire_r),.bar_81_real(bar_81_wire_r),.bar_82_real(bar_82_wire_r),.bar_83_real(bar_83_wire_r),.bar_84_real(bar_84_wire_r),.bar_85_real(bar_85_wire_r),.bar_86_real(bar_86_wire_r),.bar_87_real(bar_87_wire_r),.bar_88_real(bar_88_wire_r),.bar_89_real(bar_89_wire_r),.bar_90_real(bar_90_wire_r),.bar_91_real(bar_91_wire_r),.bar_92_real(bar_92_wire_r),.bar_93_real(bar_93_wire_r),.bar_94_real(bar_94_wire_r),.bar_95_real(bar_95_wire_r),.bar_96_real(bar_96_wire_r),.bar_97_real(bar_97_wire_r),.bar_98_real(bar_98_wire_r),.bar_99_real(bar_99_wire_r),.bar_100_real(bar_100_wire_r),
            .bar_101_real(bar_101_wire_r),.bar_102_real(bar_102_wire_r),.bar_103_real(bar_103_wire_r),.bar_104_real(bar_104_wire_r),.bar_105_real(bar_105_wire_r),.bar_106_real(bar_106_wire_r),.bar_107_real(bar_107_wire_r),.bar_108_real(bar_108_wire_r),.bar_109_real(bar_109_wire_r),.bar_110_real(bar_110_wire_r),.bar_111_real(bar_111_wire_r),.bar_112_real(bar_112_wire_r),.bar_113_real(bar_113_wire_r),.bar_114_real(bar_114_wire_r),.bar_115_real(bar_115_wire_r),.bar_116_real(bar_116_wire_r),.bar_117_real(bar_117_wire_r),.bar_118_real(bar_118_wire_r),.bar_119_real(bar_119_wire_r),.bar_120_real(bar_120_wire_r),.bar_121_real(bar_121_wire_r),.bar_122_real(bar_122_wire_r),.bar_123_real(bar_123_wire_r),.bar_124_real(bar_124_wire_r),.bar_125_real(bar_125_wire_r),.bar_126_real(bar_126_wire_r),.bar_127_real(bar_127_wire_r),
            
            .bar_0_imag(bar_0_wire_i),.bar_1_imag(bar_1_wire_i),.bar_2_imag(bar_2_wire_i),.bar_3_imag(bar_3_wire_i),.bar_4_imag(bar_4_wire_i),.bar_5_imag(bar_5_wire_i),.bar_6_imag(bar_6_wire_i),.bar_7_imag(bar_7_wire_i),.bar_8_imag(bar_8_wire_i),.bar_9_imag(bar_9_wire_i),.bar_10_imag(bar_10_wire_i),
    
            .bar_11_imag(bar_11_wire_i),.bar_12_imag(bar_12_wire_i),.bar_13_imag(bar_13_wire_i),.bar_14_imag(bar_14_wire_i),.bar_15_imag(bar_15_wire_i),.bar_16_imag(bar_16_wire_i),.bar_17_imag(bar_17_wire_i),.bar_18_imag(bar_18_wire_i),.bar_19_imag(bar_19_wire_i),.bar_20_imag(bar_20_wire_i),
            
            .bar_21_imag(bar_21_wire_i),.bar_22_imag(bar_22_wire_i),.bar_23_imag(bar_23_wire_i),.bar_24_imag(bar_24_wire_i),.bar_25_imag(bar_25_wire_i),.bar_26_imag(bar_26_wire_i),.bar_27_imag(bar_27_wire_i),.bar_28_imag(bar_28_wire_i),.bar_29_imag(bar_29_wire_i),.bar_30_imag(bar_30_wire_i),
            
            .bar_31_imag(bar_31_wire_i),.bar_32_imag(bar_32_wire_i),.bar_33_imag(bar_33_wire_i),.bar_34_imag(bar_34_wire_i),.bar_35_imag(bar_35_wire_i),.bar_36_imag(bar_36_wire_i),.bar_37_imag(bar_37_wire_i),.bar_38_imag(bar_38_wire_i),.bar_39_imag(bar_39_wire_i),.bar_40_imag(bar_40_wire_i),
            
            .bar_41_imag(bar_41_wire_i),.bar_42_imag(bar_42_wire_i),.bar_43_imag(bar_43_wire_i),.bar_44_imag(bar_44_wire_i),.bar_45_imag(bar_45_wire_i),.bar_46_imag(bar_46_wire_i),.bar_47_imag(bar_47_wire_i),.bar_48_imag(bar_48_wire_i),.bar_49_imag(bar_49_wire_i),.bar_50_imag(bar_50_wire_i),
            
            .bar_51_imag(bar_51_wire_i),.bar_52_imag(bar_52_wire_i),.bar_53_imag(bar_53_wire_i),.bar_54_imag(bar_54_wire_i),.bar_55_imag(bar_55_wire_i),.bar_56_imag(bar_56_wire_i),.bar_57_imag(bar_57_wire_i),.bar_58_imag(bar_58_wire_i),.bar_59_imag(bar_59_wire_i),.bar_60_imag(bar_60_wire_i),
            
            .bar_61_imag(bar_61_wire_i),.bar_62_imag(bar_62_wire_i),.bar_63_imag(bar_63_wire_i),.bar_64_imag(bar_64_wire_i),.bar_65_imag(bar_65_wire_i),.bar_66_imag(bar_66_wire_i),.bar_67_imag(bar_67_wire_i),.bar_68_imag(bar_68_wire_i),.bar_69_imag(bar_69_wire_i),.bar_70_imag(bar_70_wire_i),
            
            .bar_71_imag(bar_71_wire_i),.bar_72_imag(bar_72_wire_i),.bar_73_imag(bar_73_wire_i),.bar_74_imag(bar_74_wire_i),.bar_75_imag(bar_75_wire_i),.bar_76_imag(bar_76_wire_i),.bar_77_imag(bar_77_wire_i),.bar_78_imag(bar_78_wire_i),.bar_79_imag(bar_79_wire_i),.bar_80_imag(bar_80_wire_i),
            
            .bar_81_imag(bar_81_wire_i),.bar_82_imag(bar_82_wire_i),.bar_83_imag(bar_83_wire_i),.bar_84_imag(bar_84_wire_i),.bar_85_imag(bar_85_wire_i),.bar_86_imag(bar_86_wire_i),.bar_87_imag(bar_87_wire_i),.bar_88_imag(bar_88_wire_i),.bar_89_imag(bar_89_wire_i),.bar_90_imag(bar_90_wire_i),
            
            .bar_91_imag(bar_91_wire_i),.bar_92_imag(bar_92_wire_i),.bar_93_imag(bar_93_wire_i),.bar_94_imag(bar_94_wire_i),.bar_95_imag(bar_95_wire_i),.bar_96_imag(bar_96_wire_i),.bar_97_imag(bar_97_wire_i),.bar_98_imag(bar_98_wire_i),.bar_99_imag(bar_99_wire_i),.bar_100_imag(bar_100_wire_i),
            
            .bar_101_imag(bar_101_wire_i),.bar_102_imag(bar_102_wire_i),.bar_103_imag(bar_103_wire_i),.bar_104_imag(bar_104_wire_i),.bar_105_imag(bar_105_wire_i),.bar_106_imag(bar_106_wire_i),.bar_107_imag(bar_107_wire_i),.bar_108_imag(bar_108_wire_i),.bar_109_imag(bar_109_wire_i),.bar_110_imag(bar_110_wire_i),
            
            .bar_111_imag(bar_111_wire_i),.bar_112_imag(bar_112_wire_i),.bar_113_imag(bar_113_wire_i),.bar_114_imag(bar_114_wire_i),.bar_115_imag(bar_115_wire_i),.bar_116_imag(bar_116_wire_i),.bar_117_imag(bar_117_wire_i),.bar_118_imag(bar_118_wire_i),.bar_119_imag(bar_119_wire_i),.bar_120_imag(bar_120_wire_i),.bar_121_imag(bar_121_wire_i),.bar_122_imag(bar_122_wire_i),.bar_123_imag(bar_123_wire_i),.bar_124_imag(bar_124_wire_i),.bar_125_imag(bar_125_wire_i),.bar_126_imag(bar_126_wire_i),.bar_127_imag(bar_127_wire_i),
        
        
        
            .bar_0(bar_0_real),
            .bar_1(bar_1_real),.bar_2(bar_2_real),.bar_3(bar_3_real),.bar_4(bar_4_real),.bar_5(bar_5_real),.bar_6(bar_6_real),.bar_7(bar_7_real),.bar_8(bar_8_real),.bar_9(bar_9_real),.bar_10(bar_10_real),
            .bar_11(bar_11_real),.bar_12(bar_12_real),.bar_13(bar_13_real),.bar_14(bar_14_real),.bar_15(bar_15_real),.bar_16(bar_16_real),.bar_17(bar_17_real),.bar_18(bar_18_real),.bar_19(bar_19_real),.bar_20(bar_20_real),
            .bar_21(bar_21_real),.bar_22(bar_22_real),.bar_23(bar_23_real),.bar_24(bar_24_real),.bar_25(bar_25_real),.bar_26(bar_26_real),.bar_27(bar_27_real),.bar_28(bar_28_real),.bar_29(bar_29_real),.bar_30(bar_30_real),
            .bar_31(bar_31_real),.bar_32(bar_32_real),.bar_33(bar_33_real),.bar_34(bar_34_real),.bar_35(bar_35_real),.bar_36(bar_36_real),.bar_37(bar_37_real),.bar_38(bar_38_real),.bar_39(bar_39_real),.bar_40(bar_40_real),
            .bar_41(bar_41_real),.bar_42(bar_42_real),.bar_43(bar_43_real),.bar_44(bar_44_real),.bar_45(bar_45_real),.bar_46(bar_46_real),.bar_47(bar_47_real),.bar_48(bar_48_real),.bar_49(bar_49_real),.bar_50(bar_50_real),
            .bar_51(bar_51_real),.bar_52(bar_52_real),.bar_53(bar_53_real),.bar_54(bar_54_real),.bar_55(bar_55_real),.bar_56(bar_56_real),.bar_57(bar_57_real),.bar_58(bar_58_real),.bar_59(bar_59_real),.bar_60(bar_60_real),
            .bar_61(bar_61_real),.bar_62(bar_62_real),.bar_63(bar_63_real),.bar_64(bar_64_real),.bar_65(bar_65_real),.bar_66(bar_66_real),.bar_67(bar_67_real),.bar_68(bar_68_real),.bar_69(bar_69_real),.bar_70(bar_70_real),
            .bar_71(bar_71_real),.bar_72(bar_72_real),.bar_73(bar_73_real),.bar_74(bar_74_real),.bar_75(bar_75_real),.bar_76(bar_76_real),.bar_77(bar_77_real),.bar_78(bar_78_real),.bar_79(bar_79_real),.bar_80(bar_80_real),
            .bar_81(bar_81_real),.bar_82(bar_82_real),.bar_83(bar_83_real),.bar_84(bar_84_real),.bar_85(bar_85_real),.bar_86(bar_86_real),.bar_87(bar_87_real),.bar_88(bar_88_real),.bar_89(bar_89_real),.bar_90(bar_90_real),
            .bar_91(bar_91_real),.bar_92(bar_92_real),.bar_93(bar_93_real),.bar_94(bar_94_real),.bar_95(bar_95_real),.bar_96(bar_96_real),.bar_97(bar_97_real),.bar_98(bar_98_real),.bar_99(bar_99_real),.bar_100(bar_100_real),
            .bar_101(bar_101_real),.bar_102(bar_102_real),.bar_103(bar_103_real),.bar_104(bar_104_real),.bar_105(bar_105_real),.bar_106(bar_106_real),.bar_107(bar_107_real),.bar_108(bar_108_real),.bar_109(bar_109_real),.bar_110(bar_110_real),
            .bar_111(bar_111_real),.bar_112(bar_112_real),.bar_113(bar_113_real),.bar_114(bar_114_real),.bar_115(bar_115_real),.bar_116(bar_116_real),.bar_117(bar_117_real),.bar_118(bar_118_real),.bar_119(bar_119_real),.bar_120(bar_120_real),
            .bar_121(bar_121_real),.bar_122(bar_122_real),.bar_123(bar_123_real),.bar_124(bar_124_real),.bar_125(bar_125_real),.bar_126(bar_126_real),.bar_127(bar_127_real),
                    
            .ibar_0(bar_0_imag),
            .ibar_1(bar_1_imag),.ibar_2(bar_2_imag),.ibar_3(bar_3_imag),.ibar_4(bar_4_imag),.ibar_5(bar_5_imag),.ibar_6(bar_6_imag),.ibar_7(bar_7_imag),.ibar_8(bar_8_imag),.ibar_9(bar_9_imag),.ibar_10(bar_10_imag),
            .ibar_11(bar_11_imag),.ibar_12(bar_12_imag),.ibar_13(bar_13_imag),.ibar_14(bar_14_imag),.ibar_15(bar_15_imag),.ibar_16(bar_16_imag),.ibar_17(bar_17_imag),.ibar_18(bar_18_imag),.ibar_19(bar_19_imag),.ibar_20(bar_20_imag),
            .ibar_21(bar_21_imag),.ibar_22(bar_22_imag),.ibar_23(bar_23_imag),.ibar_24(bar_24_imag),.ibar_25(bar_25_imag),.ibar_26(bar_26_imag),.ibar_27(bar_27_imag),.ibar_28(bar_28_imag),.ibar_29(bar_29_imag),.ibar_30(bar_30_imag),
            .ibar_31(bar_31_imag),.ibar_32(bar_32_imag),.ibar_33(bar_33_imag),.ibar_34(bar_34_imag),.ibar_35(bar_35_imag),.ibar_36(bar_36_imag),.ibar_37(bar_37_imag),.ibar_38(bar_38_imag),.ibar_39(bar_39_imag),.ibar_40(bar_40_imag),
            .ibar_41(bar_41_imag),.ibar_42(bar_42_imag),.ibar_43(bar_43_imag),.ibar_44(bar_44_imag),.ibar_45(bar_45_imag),.ibar_46(bar_46_imag),.ibar_47(bar_47_imag),.ibar_48(bar_48_imag),.ibar_49(bar_49_imag),.ibar_50(bar_50_imag),
            .ibar_51(bar_51_imag),.ibar_52(bar_52_imag),.ibar_53(bar_53_imag),.ibar_54(bar_54_imag),.ibar_55(bar_55_imag),.ibar_56(bar_56_imag),.ibar_57(bar_57_imag),.ibar_58(bar_58_imag),.ibar_59(bar_59_imag),.ibar_60(bar_60_imag),
            .ibar_61(bar_61_imag),.ibar_62(bar_62_imag),.ibar_63(bar_63_imag),.ibar_64(bar_64_imag),.ibar_65(bar_65_imag),.ibar_66(bar_66_imag),.ibar_67(bar_67_imag),.ibar_68(bar_68_imag),.ibar_69(bar_69_imag),.ibar_70(bar_70_imag),
            .ibar_71(bar_71_imag),.ibar_72(bar_72_imag),.ibar_73(bar_73_imag),.ibar_74(bar_74_imag),.ibar_75(bar_75_imag),.ibar_76(bar_76_imag),.ibar_77(bar_77_imag),.ibar_78(bar_78_imag),.ibar_79(bar_79_imag),.ibar_80(bar_80_imag),
            .ibar_81(bar_81_imag),.ibar_82(bar_82_imag),.ibar_83(bar_83_imag),.ibar_84(bar_84_imag),.ibar_85(bar_85_imag),.ibar_86(bar_86_imag),.ibar_87(bar_87_imag),.ibar_88(bar_88_imag),.ibar_89(bar_89_imag),.ibar_90(bar_90_imag),
            .ibar_91(bar_91_imag),.ibar_92(bar_92_imag),.ibar_93(bar_93_imag),.ibar_94(bar_94_imag),.ibar_95(bar_95_imag),.ibar_96(bar_96_imag),.ibar_97(bar_97_imag),.ibar_98(bar_98_imag),.ibar_99(bar_99_imag),.ibar_100(bar_100_imag),
            .ibar_101(bar_101_imag),.ibar_102(bar_102_imag),.ibar_103(bar_103_imag),.ibar_104(bar_104_imag),.ibar_105(bar_105_imag),.ibar_106(bar_106_imag),.ibar_107(bar_107_imag),.ibar_108(bar_108_imag),.ibar_109(bar_109_imag),.ibar_110(bar_110_imag),
            .ibar_111(bar_111_imag),.ibar_112(bar_112_imag),.ibar_113(bar_113_imag),.ibar_114(bar_114_imag),.ibar_115(bar_115_imag),.ibar_116(bar_116_imag),.ibar_117(bar_117_imag),.ibar_118(bar_118_imag),.ibar_119(bar_119_imag),.ibar_120(bar_120_imag),
            .ibar_121(bar_121_imag),.ibar_122(bar_122_imag),.ibar_123(bar_123_imag),.ibar_124(bar_124_imag),.ibar_125(bar_125_imag),.ibar_126(bar_126_imag),.ibar_127(bar_127_imag)
    );
        
       
        
        VGA_Controller VGA(
            . clk(slow_clk),
            . rst(rst),
            . H_sync(H_sync),
            . V_sync(V_sync),
            
            . start(start_vga),
            . busy(busy_vga),
            
            .bar_0_real(bar_0_wire_r), .bar_1_real(bar_1_wire_r), .bar_2_real(bar_2_wire_r), .bar_3_real(bar_3_wire_r), .bar_4_real(bar_4_wire_r), .bar_5_real(bar_5_wire_r), .bar_6_real(bar_6_wire_r), .bar_7_real(bar_7_wire_r), .bar_8_real(bar_8_wire_r), .bar_9_real(bar_9_wire_r), .bar_10_real(bar_10_wire_r), .bar_11_real(bar_11_wire_r), .bar_12_real(bar_12_wire_r), .bar_13_real(bar_13_wire_r), .bar_14_real(bar_14_wire_r), .bar_15_real(bar_15_wire_r), .bar_16_real(bar_16_wire_r), .bar_17_real(bar_17_wire_r), .bar_18_real(bar_18_wire_r), .bar_19_real(bar_19_wire_r), .bar_20_real(bar_20_wire_r), .bar_21_real(bar_21_wire_r), .bar_22_real(bar_22_wire_r), .bar_23_real(bar_23_wire_r), .bar_24_real(bar_24_wire_r), .bar_25_real(bar_25_wire_r), .bar_26_real(bar_26_wire_r), .bar_27_real(bar_27_wire_r), .bar_28_real(bar_28_wire_r), .bar_29_real(bar_29_wire_r), .bar_30_real(bar_30_wire_r), .bar_31_real(bar_31_wire_r), .bar_32_real(bar_32_wire_r), .bar_33_real(bar_33_wire_r), .bar_34_real(bar_34_wire_r), .bar_35_real(bar_35_wire_r), .bar_36_real(bar_36_wire_r), .bar_37_real(bar_37_wire_r), .bar_38_real(bar_38_wire_r), .bar_39_real(bar_39_wire_r), .bar_40_real(bar_40_wire_r), .bar_41_real(bar_41_wire_r), .bar_42_real(bar_42_wire_r), .bar_43_real(bar_43_wire_r), .bar_44_real(bar_44_wire_r), .bar_45_real(bar_45_wire_r), .bar_46_real(bar_46_wire_r), .bar_47_real(bar_47_wire_r), .bar_48_real(bar_48_wire_r), .bar_49_real(bar_49_wire_r), .bar_50_real(bar_50_wire_r), 
            .bar_51_real(bar_51_wire_r), .bar_52_real(bar_52_wire_r), .bar_53_real(bar_53_wire_r), .bar_54_real(bar_54_wire_r), .bar_55_real(bar_55_wire_r), .bar_56_real(bar_56_wire_r), .bar_57_real(bar_57_wire_r), .bar_58_real(bar_58_wire_r), .bar_59_real(bar_59_wire_r), .bar_60_real(bar_60_wire_r), .bar_61_real(bar_61_wire_r), .bar_62_real(bar_62_wire_r), .bar_63_real(bar_63_wire_r), .bar_64_real(bar_64_wire_r), .bar_65_real(bar_65_wire_r), .bar_66_real(bar_66_wire_r), .bar_67_real(bar_67_wire_r), .bar_68_real(bar_68_wire_r), .bar_69_real(bar_69_wire_r), .bar_70_real(bar_70_wire_r), .bar_71_real(bar_71_wire_r), .bar_72_real(bar_72_wire_r), .bar_73_real(bar_73_wire_r), .bar_74_real(bar_74_wire_r), .bar_75_real(bar_75_wire_r), .bar_76_real(bar_76_wire_r), .bar_77_real(bar_77_wire_r), .bar_78_real(bar_78_wire_r), .bar_79_real(bar_79_wire_r), .bar_80_real(bar_80_wire_r), .bar_81_real(bar_81_wire_r), .bar_82_real(bar_82_wire_r), .bar_83_real(bar_83_wire_r), .bar_84_real(bar_84_wire_r), .bar_85_real(bar_85_wire_r), .bar_86_real(bar_86_wire_r), .bar_87_real(bar_87_wire_r), .bar_88_real(bar_88_wire_r), .bar_89_real(bar_89_wire_r), .bar_90_real(bar_90_wire_r), .bar_91_real(bar_91_wire_r), .bar_92_real(bar_92_wire_r), .bar_93_real(bar_93_wire_r), .bar_94_real(bar_94_wire_r), .bar_95_real(bar_95_wire_r), .bar_96_real(bar_96_wire_r), .bar_97_real(bar_97_wire_r), .bar_98_real(bar_98_wire_r), .bar_99_real(bar_99_wire_r), .bar_100_real(bar_100_wire_r), 
            .bar_101_real(bar_101_wire_r), .bar_102_real(bar_102_wire_r), .bar_103_real(bar_103_wire_r), .bar_104_real(bar_104_wire_r), .bar_105_real(bar_105_wire_r), .bar_106_real(bar_106_wire_r), .bar_107_real(bar_107_wire_r), .bar_108_real(bar_108_wire_r), .bar_109_real(bar_109_wire_r), .bar_110_real(bar_110_wire_r), .bar_111_real(bar_111_wire_r), .bar_112_real(bar_112_wire_r), .bar_113_real(bar_113_wire_r), .bar_114_real(bar_114_wire_r), .bar_115_real(bar_115_wire_r), .bar_116_real(bar_116_wire_r), .bar_117_real(bar_117_wire_r), .bar_118_real(bar_118_wire_r), .bar_119_real(bar_119_wire_r), .bar_120_real(bar_120_wire_r), .bar_121_real(bar_121_wire_r), .bar_122_real(bar_122_wire_r), .bar_123_real(bar_123_wire_r), .bar_124_real(bar_124_wire_r), .bar_125_real(bar_125_wire_r), .bar_126_real(bar_126_wire_r), .bar_127_real(bar_127_wire_r), 
            
            .bar_0_imag(bar_0_wire_i), .bar_1_imag(bar_1_wire_i), .bar_2_imag(bar_2_wire_i), .bar_3_imag(bar_3_wire_i), .bar_4_imag(bar_4_wire_i), .bar_5_imag(bar_5_wire_i), .bar_6_imag(bar_6_wire_i), .bar_7_imag(bar_7_wire_i), .bar_8_imag(bar_8_wire_i), .bar_9_imag(bar_9_wire_i), .bar_10_imag(bar_10_wire_i), .bar_11_imag(bar_11_wire_i), .bar_12_imag(bar_12_wire_i), .bar_13_imag(bar_13_wire_i), .bar_14_imag(bar_14_wire_i), .bar_15_imag(bar_15_wire_i), .bar_16_imag(bar_16_wire_i), .bar_17_imag(bar_17_wire_i), .bar_18_imag(bar_18_wire_i), .bar_19_imag(bar_19_wire_i), .bar_20_imag(bar_20_wire_i), .bar_21_imag(bar_21_wire_i), .bar_22_imag(bar_22_wire_i), .bar_23_imag(bar_23_wire_i), .bar_24_imag(bar_24_wire_i), .bar_25_imag(bar_25_wire_i), .bar_26_imag(bar_26_wire_i), .bar_27_imag(bar_27_wire_i), .bar_28_imag(bar_28_wire_i), .bar_29_imag(bar_29_wire_i), .bar_30_imag(bar_30_wire_i), .bar_31_imag(bar_31_wire_i), .bar_32_imag(bar_32_wire_i), .bar_33_imag(bar_33_wire_i), .bar_34_imag(bar_34_wire_i), .bar_35_imag(bar_35_wire_i), .bar_36_imag(bar_36_wire_i), .bar_37_imag(bar_37_wire_i), .bar_38_imag(bar_38_wire_i), .bar_39_imag(bar_39_wire_i), .bar_40_imag(bar_40_wire_i), .bar_41_imag(bar_41_wire_i), .bar_42_imag(bar_42_wire_i), .bar_43_imag(bar_43_wire_i), .bar_44_imag(bar_44_wire_i), .bar_45_imag(bar_45_wire_i), .bar_46_imag(bar_46_wire_i), .bar_47_imag(bar_47_wire_i), .bar_48_imag(bar_48_wire_i), .bar_49_imag(bar_49_wire_i), .bar_50_imag(bar_50_wire_i), 
            .bar_51_imag(bar_51_wire_i), .bar_52_imag(bar_52_wire_i), .bar_53_imag(bar_53_wire_i), .bar_54_imag(bar_54_wire_i), .bar_55_imag(bar_55_wire_i), .bar_56_imag(bar_56_wire_i), .bar_57_imag(bar_57_wire_i), .bar_58_imag(bar_58_wire_i), .bar_59_imag(bar_59_wire_i), .bar_60_imag(bar_60_wire_i), .bar_61_imag(bar_61_wire_i), .bar_62_imag(bar_62_wire_i), .bar_63_imag(bar_63_wire_i), .bar_64_imag(bar_64_wire_i), .bar_65_imag(bar_65_wire_i), .bar_66_imag(bar_66_wire_i), .bar_67_imag(bar_67_wire_i), .bar_68_imag(bar_68_wire_i), .bar_69_imag(bar_69_wire_i), .bar_70_imag(bar_70_wire_i), .bar_71_imag(bar_71_wire_i), .bar_72_imag(bar_72_wire_i), .bar_73_imag(bar_73_wire_i), .bar_74_imag(bar_74_wire_i), .bar_75_imag(bar_75_wire_i), .bar_76_imag(bar_76_wire_i), .bar_77_imag(bar_77_wire_i), .bar_78_imag(bar_78_wire_i), .bar_79_imag(bar_79_wire_i), .bar_80_imag(bar_80_wire_i), .bar_81_imag(bar_81_wire_i), .bar_82_imag(bar_82_wire_i), .bar_83_imag(bar_83_wire_i), .bar_84_imag(bar_84_wire_i), .bar_85_imag(bar_85_wire_i), .bar_86_imag(bar_86_wire_i), .bar_87_imag(bar_87_wire_i), .bar_88_imag(bar_88_wire_i), .bar_89_imag(bar_89_wire_i), .bar_90_imag(bar_90_wire_i), .bar_91_imag(bar_91_wire_i), .bar_92_imag(bar_92_wire_i), .bar_93_imag(bar_93_wire_i), .bar_94_imag(bar_94_wire_i), .bar_95_imag(bar_95_wire_i), .bar_96_imag(bar_96_wire_i), .bar_97_imag(bar_97_wire_i), .bar_98_imag(bar_98_wire_i), .bar_99_imag(bar_99_wire_i), .bar_100_imag(bar_100_wire_i), 
            .bar_101_imag(bar_101_wire_i), .bar_102_imag(bar_102_wire_i), .bar_103_imag(bar_103_wire_i), .bar_104_imag(bar_104_wire_i), .bar_105_imag(bar_105_wire_i), .bar_106_imag(bar_106_wire_i), .bar_107_imag(bar_107_wire_i), .bar_108_imag(bar_108_wire_i), .bar_109_imag(bar_109_wire_i), .bar_110_imag(bar_110_wire_i), .bar_111_imag(bar_111_wire_i), .bar_112_imag(bar_112_wire_i), .bar_113_imag(bar_113_wire_i), .bar_114_imag(bar_114_wire_i), .bar_115_imag(bar_115_wire_i), .bar_116_imag(bar_116_wire_i), .bar_117_imag(bar_117_wire_i), .bar_118_imag(bar_118_wire_i), .bar_119_imag(bar_119_wire_i), .bar_120_imag(bar_120_wire_i), .bar_121_imag(bar_121_wire_i), .bar_122_imag(bar_122_wire_i), .bar_123_imag(bar_123_wire_i), .bar_124_imag(bar_124_wire_i), .bar_125_imag(bar_125_wire_i), .bar_126_imag(bar_126_wire_i), .bar_127_imag(bar_127_wire_i), 
    
            . Red(Red),
            . Green(Green),
            . Blue(Blue)
        );
        
        
         wire [9:0] real_0 ,real_1 ,real_2 ,real_3 ,real_4 ,real_5 ,real_6 ,real_7 ,real_8 ,real_9 ,real_10 ,real_11 ,real_12 ,real_13 ,real_14 ,real_15 ,real_16 ,real_17 ,real_18 ,real_19 ,real_20 ,real_21 ,real_22 ,real_23 ,real_24 ,real_25 ,real_26 ,real_27 ,real_28 ,real_29 ,real_30 ,real_31 ,real_32 ,real_33 ,real_34 ,real_35 ,real_36 ,real_37 ,real_38 ,real_39 ,real_40 ,real_41 ,real_42 ,real_43 ,real_44 ,real_45 ,real_46 ,real_47 ,real_48 ,real_49 ,real_50 ,
    real_51 ,real_52 ,real_53 ,real_54 ,real_55 ,real_56 ,real_57 ,real_58 ,real_59 ,real_60 ,real_61 ,real_62 ,real_63 ,real_64 ,real_65 ,real_66 ,real_67 ,real_68 ,real_69 ,real_70 ,real_71 ,real_72 ,real_73 ,real_74 ,real_75 ,real_76 ,real_77 ,real_78 ,real_79 ,real_80 ,real_81 ,real_82 ,real_83 ,real_84 ,real_85 ,real_86 ,real_87 ,real_88 ,real_89 ,real_90 ,real_91 ,real_92 ,real_93 ,real_94 ,real_95 ,real_96 ,real_97 ,real_98 ,real_99 ,real_100 ,
    real_101 ,real_102 ,real_103 ,real_104 ,real_105 ,real_106 ,real_107 ,real_108 ,real_109 ,real_110 ,real_111 ,real_112 ,real_113 ,real_114 ,real_115 ,real_116 ,real_117 ,real_118 ,real_119 ,real_120 ,real_121 ,real_122 ,real_123 ,real_124 ,real_125 ,real_126 ,real_127 ,real_128 ,real_129 ,real_130 ,real_131 ,real_132 ,real_133 ,real_134 ,real_135 ,real_136 ,real_137 ,real_138 ,real_139 ,real_140 ,real_141 ,real_142 ,real_143 ,real_144 ,real_145 ,real_146 ,real_147 ,real_148 ,real_149 ,real_150 ,
    real_151 ,real_152 ,real_153 ,real_154 ,real_155 ,real_156 ,real_157 ,real_158 ,real_159 ,real_160 ,real_161 ,real_162 ,real_163 ,real_164 ,real_165 ,real_166 ,real_167 ,real_168 ,real_169 ,real_170 ,real_171 ,real_172 ,real_173 ,real_174 ,real_175 ,real_176 ,real_177 ,real_178 ,real_179 ,real_180 ,real_181 ,real_182 ,real_183 ,real_184 ,real_185 ,real_186 ,real_187 ,real_188 ,real_189 ,real_190 ,real_191 ,real_192 ,real_193 ,real_194 ,real_195 ,real_196 ,real_197 ,real_198 ,real_199 ,real_200 ,
    real_201 ,real_202 ,real_203 ,real_204 ,real_205 ,real_206 ,real_207 ,real_208 ,real_209 ,real_210 ,real_211 ,real_212 ,real_213 ,real_214 ,real_215 ,real_216 ,real_217 ,real_218 ,real_219 ,real_220 ,real_221 ,real_222 ,real_223 ,real_224 ,real_225 ,real_226 ,real_227 ,real_228 ,real_229 ,real_230 ,real_231 ,real_232 ,real_233 ,real_234 ,real_235 ,real_236 ,real_237 ,real_238 ,real_239 ,real_240 ,real_241 ,real_242 ,real_243 ,real_244 ,real_245 ,real_246 ,real_247 ,real_248 ,real_249 ,real_250 ,
    real_251 ,real_252 ,real_253 ,real_254 ,real_255 ;
        
        
        (* MARK_DEBUG = "TRUE" *) wire start_fft;
        
        input_converter ic(
        .mic_data       (data_out_mic-10'd123),
        .mic_data_valid (valid_mic),
       
        .rst(rst),
        .clk(slow_clk),
        .start_fft(start_fft),
        
    .real_0(real_0),.real_1(real_1),.real_2(real_2),.real_3(real_3),.real_4(real_4),.real_5(real_5),.real_6(real_6),.real_7(real_7),.real_8(real_8),.real_9(real_9),.real_10(real_10),.real_11(real_11),.real_12(real_12),.real_13(real_13),.real_14(real_14),.real_15(real_15),.real_16(real_16),.real_17(real_17),.real_18(real_18),.real_19(real_19),.real_20(real_20),.real_21(real_21),.real_22(real_22),.real_23(real_23),.real_24(real_24),.real_25(real_25),.real_26(real_26),.real_27(real_27),.real_28(real_28),.real_29(real_29),.real_30(real_30),.real_31(real_31),.real_32(real_32),.real_33(real_33),.real_34(real_34),.real_35(real_35),.real_36(real_36),.real_37(real_37),.real_38(real_38),.real_39(real_39),.real_40(real_40),.real_41(real_41),.real_42(real_42),.real_43(real_43),.real_44(real_44),.real_45(real_45),.real_46(real_46),.real_47(real_47),.real_48(real_48),.real_49(real_49),.real_50(real_50),
    
    .real_51(real_51),.real_52(real_52),.real_53(real_53),.real_54(real_54),.real_55(real_55),.real_56(real_56),.real_57(real_57),.real_58(real_58),.real_59(real_59),.real_60(real_60),.real_61(real_61),.real_62(real_62),.real_63(real_63),.real_64(real_64),.real_65(real_65),.real_66(real_66),.real_67(real_67),.real_68(real_68),.real_69(real_69),.real_70(real_70),.real_71(real_71),.real_72(real_72),.real_73(real_73),.real_74(real_74),.real_75(real_75),.real_76(real_76),.real_77(real_77),.real_78(real_78),.real_79(real_79),.real_80(real_80),.real_81(real_81),.real_82(real_82),.real_83(real_83),.real_84(real_84),.real_85(real_85),.real_86(real_86),.real_87(real_87),.real_88(real_88),.real_89(real_89),.real_90(real_90),.real_91(real_91),.real_92(real_92),.real_93(real_93),.real_94(real_94),.real_95(real_95),.real_96(real_96),.real_97(real_97),.real_98(real_98),.real_99(real_99),.real_100(real_100),
    
    .real_101(real_101),.real_102(real_102),.real_103(real_103),.real_104(real_104),.real_105(real_105),.real_106(real_106),.real_107(real_107),.real_108(real_108),.real_109(real_109),.real_110(real_110),.real_111(real_111),.real_112(real_112),.real_113(real_113),.real_114(real_114),.real_115(real_115),.real_116(real_116),.real_117(real_117),.real_118(real_118),.real_119(real_119),.real_120(real_120),.real_121(real_121),.real_122(real_122),.real_123(real_123),.real_124(real_124),.real_125(real_125),.real_126(real_126),.real_127(real_127),.real_128(real_128),.real_129(real_129),.real_130(real_130),.real_131(real_131),.real_132(real_132),.real_133(real_133),.real_134(real_134),.real_135(real_135),.real_136(real_136),.real_137(real_137),.real_138(real_138),.real_139(real_139),.real_140(real_140),.real_141(real_141),.real_142(real_142),.real_143(real_143),.real_144(real_144),.real_145(real_145),.real_146(real_146),.real_147(real_147),.real_148(real_148),.real_149(real_149),.real_150(real_150),
    
    .real_151(real_151),.real_152(real_152),.real_153(real_153),.real_154(real_154),.real_155(real_155),.real_156(real_156),.real_157(real_157),.real_158(real_158),.real_159(real_159),.real_160(real_160),.real_161(real_161),.real_162(real_162),.real_163(real_163),.real_164(real_164),.real_165(real_165),.real_166(real_166),.real_167(real_167),.real_168(real_168),.real_169(real_169),.real_170(real_170),.real_171(real_171),.real_172(real_172),.real_173(real_173),.real_174(real_174),.real_175(real_175),.real_176(real_176),.real_177(real_177),.real_178(real_178),.real_179(real_179),.real_180(real_180),.real_181(real_181),.real_182(real_182),.real_183(real_183),.real_184(real_184),.real_185(real_185),.real_186(real_186),.real_187(real_187),.real_188(real_188),.real_189(real_189),.real_190(real_190),.real_191(real_191),.real_192(real_192),.real_193(real_193),.real_194(real_194),.real_195(real_195),.real_196(real_196),.real_197(real_197),.real_198(real_198),.real_199(real_199),.real_200(real_200),
    
    .real_201(real_201),.real_202(real_202),.real_203(real_203),.real_204(real_204),.real_205(real_205),.real_206(real_206),.real_207(real_207),.real_208(real_208),.real_209(real_209),.real_210(real_210),.real_211(real_211),.real_212(real_212),.real_213(real_213),.real_214(real_214),.real_215(real_215),.real_216(real_216),.real_217(real_217),.real_218(real_218),.real_219(real_219),.real_220(real_220),.real_221(real_221),.real_222(real_222),.real_223(real_223),.real_224(real_224),.real_225(real_225),.real_226(real_226),.real_227(real_227),.real_228(real_228),.real_229(real_229),.real_230(real_230),.real_231(real_231),.real_232(real_232),.real_233(real_233),.real_234(real_234),.real_235(real_235),.real_236(real_236),.real_237(real_237),.real_238(real_238),.real_239(real_239),.real_240(real_240),.real_241(real_241),.real_242(real_242),.real_243(real_243),.real_244(real_244),.real_245(real_245),.real_246(real_246),.real_247(real_247),.real_248(real_248),.real_249(real_249),.real_250(real_250),.real_251(real_251),.real_252(real_252),.real_253(real_253),.real_254(real_254),.real_255(real_255)
        
        );
        
        
        
        
        
        
        wire busy_fft;
        wire [15:0] real_part_fft;
        wire [15:0] imag_part_fft;
        FFT_Module FFT(
            . clk(slow_clk),
            . rst(rst),
            . start(start_fft),    
    .real_0(real_0),.real_1(real_1),.real_2(real_2),.real_3(real_3),.real_4(real_4),.real_5(real_5),.real_6(real_6),.real_7(real_7),.real_8(real_8),.real_9(real_9),.real_10(real_10),.real_11(real_11),.real_12(real_12),.real_13(real_13),.real_14(real_14),.real_15(real_15),.real_16(real_16),.real_17(real_17),.real_18(real_18),.real_19(real_19),.real_20(real_20),.real_21(real_21),.real_22(real_22),.real_23(real_23),.real_24(real_24),.real_25(real_25),.real_26(real_26),.real_27(real_27),.real_28(real_28),.real_29(real_29),.real_30(real_30),.real_31(real_31),.real_32(real_32),.real_33(real_33),.real_34(real_34),.real_35(real_35),.real_36(real_36),.real_37(real_37),.real_38(real_38),.real_39(real_39),.real_40(real_40),.real_41(real_41),.real_42(real_42),.real_43(real_43),.real_44(real_44),.real_45(real_45),.real_46(real_46),.real_47(real_47),.real_48(real_48),.real_49(real_49),.real_50(real_50),
    
    .real_51(real_51),.real_52(real_52),.real_53(real_53),.real_54(real_54),.real_55(real_55),.real_56(real_56),.real_57(real_57),.real_58(real_58),.real_59(real_59),.real_60(real_60),.real_61(real_61),.real_62(real_62),.real_63(real_63),.real_64(real_64),.real_65(real_65),.real_66(real_66),.real_67(real_67),.real_68(real_68),.real_69(real_69),.real_70(real_70),.real_71(real_71),.real_72(real_72),.real_73(real_73),.real_74(real_74),.real_75(real_75),.real_76(real_76),.real_77(real_77),.real_78(real_78),.real_79(real_79),.real_80(real_80),.real_81(real_81),.real_82(real_82),.real_83(real_83),.real_84(real_84),.real_85(real_85),.real_86(real_86),.real_87(real_87),.real_88(real_88),.real_89(real_89),.real_90(real_90),.real_91(real_91),.real_92(real_92),.real_93(real_93),.real_94(real_94),.real_95(real_95),.real_96(real_96),.real_97(real_97),.real_98(real_98),.real_99(real_99),.real_100(real_100),
    
    .real_101(real_101),.real_102(real_102),.real_103(real_103),.real_104(real_104),.real_105(real_105),.real_106(real_106),.real_107(real_107),.real_108(real_108),.real_109(real_109),.real_110(real_110),.real_111(real_111),.real_112(real_112),.real_113(real_113),.real_114(real_114),.real_115(real_115),.real_116(real_116),.real_117(real_117),.real_118(real_118),.real_119(real_119),.real_120(real_120),.real_121(real_121),.real_122(real_122),.real_123(real_123),.real_124(real_124),.real_125(real_125),.real_126(real_126),.real_127(real_127),.real_128(real_128),.real_129(real_129),.real_130(real_130),.real_131(real_131),.real_132(real_132),.real_133(real_133),.real_134(real_134),.real_135(real_135),.real_136(real_136),.real_137(real_137),.real_138(real_138),.real_139(real_139),.real_140(real_140),.real_141(real_141),.real_142(real_142),.real_143(real_143),.real_144(real_144),.real_145(real_145),.real_146(real_146),.real_147(real_147),.real_148(real_148),.real_149(real_149),.real_150(real_150),
    
    .real_151(real_151),.real_152(real_152),.real_153(real_153),.real_154(real_154),.real_155(real_155),.real_156(real_156),.real_157(real_157),.real_158(real_158),.real_159(real_159),.real_160(real_160),.real_161(real_161),.real_162(real_162),.real_163(real_163),.real_164(real_164),.real_165(real_165),.real_166(real_166),.real_167(real_167),.real_168(real_168),.real_169(real_169),.real_170(real_170),.real_171(real_171),.real_172(real_172),.real_173(real_173),.real_174(real_174),.real_175(real_175),.real_176(real_176),.real_177(real_177),.real_178(real_178),.real_179(real_179),.real_180(real_180),.real_181(real_181),.real_182(real_182),.real_183(real_183),.real_184(real_184),.real_185(real_185),.real_186(real_186),.real_187(real_187),.real_188(real_188),.real_189(real_189),.real_190(real_190),.real_191(real_191),.real_192(real_192),.real_193(real_193),.real_194(real_194),.real_195(real_195),.real_196(real_196),.real_197(real_197),.real_198(real_198),.real_199(real_199),.real_200(real_200),
    
    .real_201(real_201),.real_202(real_202),.real_203(real_203),.real_204(real_204),.real_205(real_205),.real_206(real_206),.real_207(real_207),.real_208(real_208),.real_209(real_209),.real_210(real_210),.real_211(real_211),.real_212(real_212),.real_213(real_213),.real_214(real_214),.real_215(real_215),.real_216(real_216),.real_217(real_217),.real_218(real_218),.real_219(real_219),.real_220(real_220),.real_221(real_221),.real_222(real_222),.real_223(real_223),.real_224(real_224),.real_225(real_225),.real_226(real_226),.real_227(real_227),.real_228(real_228),.real_229(real_229),.real_230(real_230),.real_231(real_231),.real_232(real_232),.real_233(real_233),.real_234(real_234),.real_235(real_235),.real_236(real_236),.real_237(real_237),.real_238(real_238),.real_239(real_239),.real_240(real_240),.real_241(real_241),.real_242(real_242),.real_243(real_243),.real_244(real_244),.real_245(real_245),.real_246(real_246),.real_247(real_247),.real_248(real_248),.real_249(real_249),.real_250(real_250),.real_251(real_251),.real_252(real_252),.real_253(real_253),.real_254(real_254),.real_255(real_255),
            
            .bar_0(bar_0_real),.bar_1(bar_1_real),.bar_2(bar_2_real),.bar_3(bar_3_real),.bar_4(bar_4_real),.bar_5(bar_5_real),.bar_6(bar_6_real),.bar_7(bar_7_real),
            .bar_8(bar_8_real),.bar_9(bar_9_real),.bar_10(bar_10_real),.bar_11(bar_11_real),.bar_12(bar_12_real),.bar_13(bar_13_real),.bar_14(bar_14_real),.bar_15(bar_15_real),
            .bar_16(bar_16_real),.bar_17(bar_17_real),.bar_18(bar_18_real),.bar_19(bar_19_real),.bar_20(bar_20_real),.bar_21(bar_21_real),.bar_22(bar_22_real),.bar_23(bar_23_real),
            .bar_24(bar_24_real),.bar_25(bar_25_real),.bar_26(bar_26_real),.bar_27(bar_27_real),.bar_28(bar_28_real),.bar_29(bar_29_real),.bar_30(bar_30_real),.bar_31(bar_31_real),
            .bar_32(bar_32_real),.bar_33(bar_33_real),.bar_34(bar_34_real),.bar_35(bar_35_real),.bar_36(bar_36_real),.bar_37(bar_37_real),.bar_38(bar_38_real),.bar_39(bar_39_real),
            .bar_40(bar_40_real),.bar_41(bar_41_real),.bar_42(bar_42_real),.bar_43(bar_43_real),.bar_44(bar_44_real),.bar_45(bar_45_real),.bar_46(bar_46_real),.bar_47(bar_47_real),
            .bar_48(bar_48_real),  .bar_49(bar_49_real),  .bar_50(bar_50_real),  .bar_51(bar_51_real),  .bar_52(bar_52_real),  .bar_53(bar_53_real),  .bar_54(bar_54_real),  .bar_55(bar_55_real),
            .bar_56(bar_56_real),  .bar_57(bar_57_real),  .bar_58(bar_58_real),  .bar_59(bar_59_real),  .bar_60(bar_60_real),  .bar_61(bar_61_real),  .bar_62(bar_62_real),  .bar_63(bar_63_real),
            .bar_64(bar_64_real),  .bar_65(bar_65_real),  .bar_66(bar_66_real),  .bar_67(bar_67_real),  .bar_68(bar_68_real),  .bar_69(bar_69_real),  .bar_70(bar_70_real),  .bar_71(bar_71_real),
            .bar_72(bar_72_real),  .bar_73(bar_73_real),  .bar_74(bar_74_real),  .bar_75(bar_75_real),  .bar_76(bar_76_real),  .bar_77(bar_77_real),  .bar_78(bar_78_real),  .bar_79(bar_79_real),
            .bar_80(bar_80_real),  .bar_81(bar_81_real),  .bar_82(bar_82_real),  .bar_83(bar_83_real),  .bar_84(bar_84_real),  .bar_85(bar_85_real),  .bar_86(bar_86_real),  .bar_87(bar_87_real),
            .bar_88(bar_88_real),  .bar_89(bar_89_real),  .bar_90(bar_90_real),  .bar_91(bar_91_real),  .bar_92(bar_92_real),  .bar_93(bar_93_real),  .bar_94(bar_94_real),  .bar_95(bar_95_real),
            .bar_96(bar_96_real),  .bar_97(bar_97_real),  .bar_98(bar_98_real),  .bar_99(bar_99_real),  .bar_100(bar_100_real),.bar_101(bar_101_real),.bar_102(bar_102_real),.bar_103(bar_103_real),
            .bar_104(bar_104_real),.bar_105(bar_105_real),.bar_106(bar_106_real),.bar_107(bar_107_real),.bar_108(bar_108_real),.bar_109(bar_109_real),.bar_110(bar_110_real),.bar_111(bar_111_real),
            .bar_112(bar_112_real),.bar_113(bar_113_real),.bar_114(bar_114_real),.bar_115(bar_115_real),.bar_116(bar_116_real),.bar_117(bar_117_real),.bar_118(bar_118_real),.bar_119(bar_119_real),
            .bar_120(bar_120_real),.bar_121(bar_121_real),.bar_122(bar_122_real),.bar_123(bar_123_real),.bar_124(bar_124_real),.bar_125(bar_125_real),.bar_126(bar_126_real),.bar_127(bar_127_real),
            
            
            .ibar_0(bar_0_imag),    .ibar_1(bar_1_imag),    .ibar_2(bar_2_imag),    .ibar_3(bar_3_imag),   .ibar_4(bar_4_imag),  .ibar_5(bar_5_imag),  .ibar_6(bar_6_imag),  .ibar_7(bar_7_imag),
            .ibar_8(bar_8_imag),    .ibar_9(bar_9_imag),    .ibar_10(bar_10_imag),  .ibar_11(bar_11_imag), .ibar_12(bar_12_imag),.ibar_13(bar_13_imag),.ibar_14(bar_14_imag),.ibar_15(bar_15_imag),
            .ibar_16(bar_16_imag),  .ibar_17(bar_17_imag),  .ibar_18(bar_18_imag),  .ibar_19(bar_19_imag), .ibar_20(bar_20_imag),.ibar_21(bar_21_imag),.ibar_22(bar_22_imag),.ibar_23(bar_23_imag),
            .ibar_24(bar_24_imag),  .ibar_25(bar_25_imag),  .ibar_26(bar_26_imag),  .ibar_27(bar_27_imag), .ibar_28(bar_28_imag),.ibar_29(bar_29_imag),.ibar_30(bar_30_imag),.ibar_31(bar_31_imag),
            .ibar_32(bar_32_imag),  .ibar_33(bar_33_imag),  .ibar_34(bar_34_imag),  .ibar_35(bar_35_imag), .ibar_36(bar_36_imag),.ibar_37(bar_37_imag),.ibar_38(bar_38_imag),.ibar_39(bar_39_imag),
            .ibar_40(bar_40_imag),  .ibar_41(bar_41_imag),  .ibar_42(bar_42_imag),  .ibar_43(bar_43_imag), .ibar_44(bar_44_imag),.ibar_45(bar_45_imag),.ibar_46(bar_46_imag),.ibar_47(bar_47_imag),
            .ibar_48(bar_48_imag),  .ibar_49(bar_49_imag),  .ibar_50(bar_50_imag),  .ibar_51(bar_51_imag),  .ibar_52(bar_52_imag),  .ibar_53(bar_53_imag),  .ibar_54(bar_54_imag),  .ibar_55(bar_55_imag),
            .ibar_56(bar_56_imag),  .ibar_57(bar_57_imag),  .ibar_58(bar_58_imag),  .ibar_59(bar_59_imag),  .ibar_60(bar_60_imag),  .ibar_61(bar_61_imag),  .ibar_62(bar_62_imag),  .ibar_63(bar_63_imag),
            .ibar_64(bar_64_imag),  .ibar_65(bar_65_imag),  .ibar_66(bar_66_imag),  .ibar_67(bar_67_imag),  .ibar_68(bar_68_imag),  .ibar_69(bar_69_imag),  .ibar_70(bar_70_imag),  .ibar_71(bar_71_imag),
            .ibar_72(bar_72_imag),  .ibar_73(bar_73_imag),  .ibar_74(bar_74_imag),  .ibar_75(bar_75_imag),  .ibar_76(bar_76_imag),  .ibar_77(bar_77_imag),  .ibar_78(bar_78_imag),  .ibar_79(bar_79_imag),
            .ibar_80(bar_80_imag),  .ibar_81(bar_81_imag),  .ibar_82(bar_82_imag),  .ibar_83(bar_83_imag),  .ibar_84(bar_84_imag),  .ibar_85(bar_85_imag),  .ibar_86(bar_86_imag),  .ibar_87(bar_87_imag),
            .ibar_88(bar_88_imag),  .ibar_89(bar_89_imag),  .ibar_90(bar_90_imag),  .ibar_91(bar_91_imag),  .ibar_92(bar_92_imag),  .ibar_93(bar_93_imag),  .ibar_94(bar_94_imag),  .ibar_95(bar_95_imag),
            .ibar_96(bar_96_imag),  .ibar_97(bar_97_imag),  .ibar_98(bar_98_imag),  .ibar_99(bar_99_imag),  .ibar_100(bar_100_imag),.ibar_101(bar_101_imag),.ibar_102(bar_102_imag),.ibar_103(bar_103_imag),
            .ibar_104(bar_104_imag),.ibar_105(bar_105_imag),.ibar_106(bar_106_imag),.ibar_107(bar_107_imag),.ibar_108(bar_108_imag),.ibar_109(bar_109_imag),.ibar_110(bar_110_imag),.ibar_111(bar_111_imag),
            .ibar_112(bar_112_imag),.ibar_113(bar_113_imag),.ibar_114(bar_114_imag),.ibar_115(bar_115_imag),.ibar_116(bar_116_imag),.ibar_117(bar_117_imag),.ibar_118(bar_118_imag),.ibar_119(bar_119_imag),
            .ibar_120(bar_120_imag),.ibar_121(bar_121_imag),.ibar_122(bar_122_imag),.ibar_123(bar_123_imag),.ibar_124(bar_124_imag),.ibar_125(bar_125_imag),.ibar_126(bar_126_imag),.ibar_127(bar_127_imag),
            
            . busy(busy_fft),
            . valid(start_vga)
        );
        
        always @(posedge clk)begin
            
        end
    endmodule
