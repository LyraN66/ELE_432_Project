module VGA_Controller(
    input clk,
    input rst,
    output H_sync,
    output V_sync,
//    input [6:0] switch,
    // Bar Heights 
    input start,
    input [6:0] bar_0_real, bar_1_real, bar_2_real, bar_3_real, bar_4_real, bar_5_real, bar_6_real, bar_7_real,
    input [6:0] bar_8_real, bar_9_real, bar_10_real, bar_11_real, bar_12_real, bar_13_real, bar_14_real, bar_15_real,
    input [6:0] bar_16_real, bar_17_real, bar_18_real, bar_19_real, bar_20_real, bar_21_real, bar_22_real, bar_23_real,
    input [6:0] bar_24_real, bar_25_real, bar_26_real, bar_27_real, bar_28_real, bar_29_real, bar_30_real, bar_31_real,
    input [6:0] bar_32_real, bar_33_real, bar_34_real, bar_35_real, bar_36_real, bar_37_real, bar_38_real, bar_39_real,
    input [6:0] bar_40_real, bar_41_real, bar_42_real, bar_43_real, bar_44_real, bar_45_real, bar_46_real, bar_47_real,
    input [6:0] bar_48_real, bar_49_real, bar_50_real, bar_51_real, bar_52_real, bar_53_real, bar_54_real, bar_55_real,
    input [6:0] bar_56_real, bar_57_real, bar_58_real, bar_59_real, bar_60_real, bar_61_real, bar_62_real, bar_63_real,
    input [6:0] bar_64_real, bar_65_real, bar_66_real, bar_67_real, bar_68_real, bar_69_real, bar_70_real, bar_71_real,
    input [6:0] bar_72_real, bar_73_real, bar_74_real, bar_75_real, bar_76_real, bar_77_real, bar_78_real, bar_79_real,
    input [6:0] bar_80_real, bar_81_real, bar_82_real, bar_83_real, bar_84_real, bar_85_real, bar_86_real, bar_87_real,
    input [6:0] bar_88_real, bar_89_real, bar_90_real, bar_91_real, bar_92_real, bar_93_real, bar_94_real, bar_95_real,
    input [6:0] bar_96_real, bar_97_real, bar_98_real, bar_99_real, bar_100_real, bar_101_real, bar_102_real, bar_103_real,
    input [6:0] bar_104_real, bar_105_real, bar_106_real, bar_107_real, bar_108_real, bar_109_real, bar_110_real, bar_111_real,
    input [6:0] bar_112_real, bar_113_real, bar_114_real, bar_115_real, bar_116_real, bar_117_real, bar_118_real, bar_119_real,
    input [6:0] bar_120_real, bar_121_real, bar_122_real, bar_123_real, bar_124_real, bar_125_real, bar_126_real, bar_127_real,
    
    input [6:0] bar_0_imag, bar_1_imag, bar_2_imag, bar_3_imag, bar_4_imag, bar_5_imag, bar_6_imag, bar_7_imag,
    input [6:0] bar_8_imag, bar_9_imag, bar_10_imag, bar_11_imag, bar_12_imag, bar_13_imag, bar_14_imag, bar_15_imag,
    input [6:0] bar_16_imag, bar_17_imag, bar_18_imag, bar_19_imag, bar_20_imag, bar_21_imag, bar_22_imag, bar_23_imag,
    input [6:0] bar_24_imag, bar_25_imag, bar_26_imag, bar_27_imag, bar_28_imag, bar_29_imag, bar_30_imag, bar_31_imag,
    input [6:0] bar_32_imag, bar_33_imag, bar_34_imag, bar_35_imag, bar_36_imag, bar_37_imag, bar_38_imag, bar_39_imag,
    input [6:0] bar_40_imag, bar_41_imag, bar_42_imag, bar_43_imag, bar_44_imag, bar_45_imag, bar_46_imag, bar_47_imag,
    input [6:0] bar_48_imag, bar_49_imag, bar_50_imag, bar_51_imag, bar_52_imag, bar_53_imag, bar_54_imag, bar_55_imag,
    input [6:0] bar_56_imag, bar_57_imag, bar_58_imag, bar_59_imag, bar_60_imag, bar_61_imag, bar_62_imag, bar_63_imag,
    input [6:0] bar_64_imag, bar_65_imag, bar_66_imag, bar_67_imag, bar_68_imag, bar_69_imag, bar_70_imag, bar_71_imag,
    input [6:0] bar_72_imag, bar_73_imag, bar_74_imag, bar_75_imag, bar_76_imag, bar_77_imag, bar_78_imag, bar_79_imag,
    input [6:0] bar_80_imag, bar_81_imag, bar_82_imag, bar_83_imag, bar_84_imag, bar_85_imag, bar_86_imag, bar_87_imag,
    input [6:0] bar_88_imag, bar_89_imag, bar_90_imag, bar_91_imag, bar_92_imag, bar_93_imag, bar_94_imag, bar_95_imag,
    input [6:0] bar_96_imag, bar_97_imag, bar_98_imag, bar_99_imag, bar_100_imag, bar_101_imag, bar_102_imag, bar_103_imag,
    input [6:0] bar_104_imag, bar_105_imag, bar_106_imag, bar_107_imag, bar_108_imag, bar_109_imag, bar_110_imag, bar_111_imag,
    input [6:0] bar_112_imag, bar_113_imag, bar_114_imag, bar_115_imag, bar_116_imag, bar_117_imag, bar_118_imag, bar_119_imag,
    input [6:0] bar_120_imag, bar_121_imag, bar_122_imag, bar_123_imag, bar_124_imag, bar_125_imag, bar_126_imag, bar_127_imag,
    //
    output reg busy,
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue
    );
    
    reg [6:0] bar_0_real_reg, bar_1_real_reg, bar_2_real_reg, bar_3_real_reg, bar_4_real_reg, bar_5_real_reg, bar_6_real_reg, bar_7_real_reg;
    reg [6:0] bar_8_real_reg, bar_9_real_reg, bar_10_real_reg, bar_11_real_reg, bar_12_real_reg, bar_13_real_reg, bar_14_real_reg, bar_15_real_reg;
    reg [6:0] bar_16_real_reg, bar_17_real_reg, bar_18_real_reg, bar_19_real_reg, bar_20_real_reg, bar_21_real_reg, bar_22_real_reg, bar_23_real_reg;
    reg [6:0] bar_24_real_reg, bar_25_real_reg, bar_26_real_reg, bar_27_real_reg, bar_28_real_reg, bar_29_real_reg, bar_30_real_reg, bar_31_real_reg;
    reg [6:0] bar_32_real_reg, bar_33_real_reg, bar_34_real_reg, bar_35_real_reg, bar_36_real_reg, bar_37_real_reg, bar_38_real_reg, bar_39_real_reg;
    reg [6:0] bar_40_real_reg, bar_41_real_reg, bar_42_real_reg, bar_43_real_reg, bar_44_real_reg, bar_45_real_reg, bar_46_real_reg, bar_47_real_reg;
    reg [6:0] bar_48_real_reg, bar_49_real_reg, bar_50_real_reg, bar_51_real_reg, bar_52_real_reg, bar_53_real_reg, bar_54_real_reg, bar_55_real_reg;
    reg [6:0] bar_56_real_reg, bar_57_real_reg, bar_58_real_reg, bar_59_real_reg, bar_60_real_reg, bar_61_real_reg, bar_62_real_reg, bar_63_real_reg;
    reg [6:0] bar_64_real_reg, bar_65_real_reg, bar_66_real_reg, bar_67_real_reg, bar_68_real_reg, bar_69_real_reg, bar_70_real_reg, bar_71_real_reg;
    reg [6:0] bar_72_real_reg, bar_73_real_reg, bar_74_real_reg, bar_75_real_reg, bar_76_real_reg, bar_77_real_reg, bar_78_real_reg, bar_79_real_reg;
    reg [6:0] bar_80_real_reg, bar_81_real_reg, bar_82_real_reg, bar_83_real_reg, bar_84_real_reg, bar_85_real_reg, bar_86_real_reg, bar_87_real_reg;
    reg [6:0] bar_88_real_reg, bar_89_real_reg, bar_90_real_reg, bar_91_real_reg, bar_92_real_reg, bar_93_real_reg, bar_94_real_reg, bar_95_real_reg;
    reg [6:0] bar_96_real_reg, bar_97_real_reg, bar_98_real_reg, bar_99_real_reg, bar_100_real_reg, bar_101_real_reg, bar_102_real_reg, bar_103_real_reg;
    reg [6:0] bar_104_real_reg, bar_105_real_reg, bar_106_real_reg, bar_107_real_reg, bar_108_real_reg, bar_109_real_reg, bar_110_real_reg, bar_111_real_reg;
    reg [6:0] bar_112_real_reg, bar_113_real_reg, bar_114_real_reg, bar_115_real_reg, bar_116_real_reg, bar_117_real_reg, bar_118_real_reg, bar_119_real_reg;
    reg [6:0] bar_120_real_reg, bar_121_real_reg, bar_122_real_reg, bar_123_real_reg, bar_124_real_reg, bar_125_real_reg, bar_126_real_reg, bar_127_real_reg;
    
    reg [6:0] bar_0_imag_reg, bar_1_imag_reg, bar_2_imag_reg, bar_3_imag_reg, bar_4_imag_reg, bar_5_imag_reg, bar_6_imag_reg, bar_7_imag_reg;
    reg [6:0] bar_8_imag_reg, bar_9_imag_reg, bar_10_imag_reg, bar_11_imag_reg, bar_12_imag_reg, bar_13_imag_reg, bar_14_imag_reg, bar_15_imag_reg;
    reg [6:0] bar_16_imag_reg, bar_17_imag_reg, bar_18_imag_reg, bar_19_imag_reg, bar_20_imag_reg, bar_21_imag_reg, bar_22_imag_reg, bar_23_imag_reg;
    reg [6:0] bar_24_imag_reg, bar_25_imag_reg, bar_26_imag_reg, bar_27_imag_reg, bar_28_imag_reg, bar_29_imag_reg, bar_30_imag_reg, bar_31_imag_reg;
    reg [6:0] bar_32_imag_reg, bar_33_imag_reg, bar_34_imag_reg, bar_35_imag_reg, bar_36_imag_reg, bar_37_imag_reg, bar_38_imag_reg, bar_39_imag_reg;
    reg [6:0] bar_40_imag_reg, bar_41_imag_reg, bar_42_imag_reg, bar_43_imag_reg, bar_44_imag_reg, bar_45_imag_reg, bar_46_imag_reg, bar_47_imag_reg;
    reg [6:0] bar_48_imag_reg, bar_49_imag_reg, bar_50_imag_reg, bar_51_imag_reg, bar_52_imag_reg, bar_53_imag_reg, bar_54_imag_reg, bar_55_imag_reg;
    reg [6:0] bar_56_imag_reg, bar_57_imag_reg, bar_58_imag_reg, bar_59_imag_reg, bar_60_imag_reg, bar_61_imag_reg, bar_62_imag_reg, bar_63_imag_reg;
    reg [6:0] bar_64_imag_reg, bar_65_imag_reg, bar_66_imag_reg, bar_67_imag_reg, bar_68_imag_reg, bar_69_imag_reg, bar_70_imag_reg, bar_71_imag_reg;
    reg [6:0] bar_72_imag_reg, bar_73_imag_reg, bar_74_imag_reg, bar_75_imag_reg, bar_76_imag_reg, bar_77_imag_reg, bar_78_imag_reg, bar_79_imag_reg;
    reg [6:0] bar_80_imag_reg, bar_81_imag_reg, bar_82_imag_reg, bar_83_imag_reg, bar_84_imag_reg, bar_85_imag_reg, bar_86_imag_reg, bar_87_imag_reg;
    reg [6:0] bar_88_imag_reg, bar_89_imag_reg, bar_90_imag_reg, bar_91_imag_reg, bar_92_imag_reg, bar_93_imag_reg, bar_94_imag_reg, bar_95_imag_reg;
    reg [6:0] bar_96_imag_reg, bar_97_imag_reg, bar_98_imag_reg, bar_99_imag_reg, bar_100_imag_reg, bar_101_imag_reg, bar_102_imag_reg, bar_103_imag_reg;
    reg [6:0] bar_104_imag_reg, bar_105_imag_reg, bar_106_imag_reg, bar_107_imag_reg, bar_108_imag_reg, bar_109_imag_reg, bar_110_imag_reg, bar_111_imag_reg;
    reg [6:0] bar_112_imag_reg, bar_113_imag_reg, bar_114_imag_reg, bar_115_imag_reg, bar_116_imag_reg, bar_117_imag_reg, bar_118_imag_reg, bar_119_imag_reg;
    reg [6:0] bar_120_imag_reg, bar_121_imag_reg, bar_122_imag_reg, bar_123_imag_reg, bar_124_imag_reg, bar_125_imag_reg, bar_126_imag_reg, bar_127_imag_reg;
    
    reg ready;
    
    wire enable_V_top;
    wire [15:0] h_counter_top;
    horizantal_counter horizantal(
        . clk(clk),
        . rst(rst),
        . enable_V(enable_V_top),
        . h_counter(h_counter_top)
    );
    
    wire [15:0] v_counter_top;
    vertical_counter vertical(
        . clk(clk),
        . rst(rst),
        . enable_V(enable_V_top),
        . v_counter(v_counter_top)
    );
    
    wire [3:0] remainder = h_counter_top % 5;
//    wire [15:0] v_counter_wire = v_counter_top - 360;
    wire [15:0] v_counter_wire = 460 - v_counter_top;
//    wire [15:0] v_counter_wire_1 = v_counter_top - 240;
    wire [15:0] v_counter_wire_1 = 340 - v_counter_top;
    parameter Screen_Colour = 4'b0101;
    parameter Mix = 4'b1010;
    parameter Black = 4'b0000;
    parameter White = 4'b1111;
    
    reg [0:0] font [0:20447];
    reg [31:0] font_counter;
    wire font_data = font[font_counter][0];
    
    assign H_sync = (h_counter_top < 96) ? (1'b1) : (1'b0);
    assign V_sync = (v_counter_top < 2) ? (1'b1) : (1'b0);
    
    initial begin
        $readmemb("font_1.mem",font);
    end
    
    always @(posedge clk)begin 
        if(rst)begin
            Red <= Black; Green <= Black; Blue <= Black;
            font_counter <= 32'b0;
            ready <= 1'b0;
        end
        else begin
            ////////////////////////////////////////////////////////////////////
            //  Capture hight of the bars 
            ////////////////////////////////////////////////////////////////////
            ready <= (h_counter_top == 799 && v_counter_top == 524) ? (1'b0) : (ready);
            busy <= (h_counter_top != 799 || v_counter_top != 524) ? (1'b1) : (1'b0);
            if (h_counter_top == 799 && v_counter_top == 524) begin
                ready <= 1'b0;
                busy <= 1'b0;
            end
            else begin
                busy <= 1'b1;
            end
            if (start && !ready) begin 
                bar_0_real_reg <= bar_0_real;  bar_1_real_reg <= bar_1_real;  bar_2_real_reg <= bar_2_real;  bar_3_real_reg <= bar_3_real;
                bar_4_real_reg <= bar_4_real;  bar_5_real_reg <= bar_5_real;  bar_6_real_reg <= bar_6_real;  bar_7_real_reg <= bar_7_real;
                bar_8_real_reg <= bar_8_real;  bar_9_real_reg <= bar_9_real;  bar_10_real_reg <= bar_10_real; bar_11_real_reg <= bar_11_real;
                bar_12_real_reg <= bar_12_real; bar_13_real_reg <= bar_13_real; bar_14_real_reg <= bar_14_real; bar_15_real_reg <= bar_15_real;
                bar_16_real_reg <= bar_16_real; bar_17_real_reg <= bar_17_real; bar_18_real_reg <= bar_18_real; bar_19_real_reg <= bar_19_real;
                bar_20_real_reg <= bar_20_real; bar_21_real_reg <= bar_21_real; bar_22_real_reg <= bar_22_real; bar_23_real_reg <= bar_23_real;
                bar_24_real_reg <= bar_24_real; bar_25_real_reg <= bar_25_real; bar_26_real_reg <= bar_26_real; bar_27_real_reg <= bar_27_real;
                bar_28_real_reg <= bar_28_real; bar_29_real_reg <= bar_29_real; bar_30_real_reg <= bar_30_real; bar_31_real_reg <= bar_31_real;
                bar_32_real_reg <= bar_32_real; bar_33_real_reg <= bar_33_real; bar_34_real_reg <= bar_34_real; bar_35_real_reg <= bar_35_real;
                bar_36_real_reg <= bar_36_real; bar_37_real_reg <= bar_37_real; bar_38_real_reg <= bar_38_real; bar_39_real_reg <= bar_39_real;
                bar_40_real_reg <= bar_40_real; bar_41_real_reg <= bar_41_real; bar_42_real_reg <= bar_42_real; bar_43_real_reg <= bar_43_real;
                bar_44_real_reg <= bar_44_real; bar_45_real_reg <= bar_45_real; bar_46_real_reg <= bar_46_real; bar_47_real_reg <= bar_47_real;
                bar_48_real_reg <= bar_48_real; bar_49_real_reg <= bar_49_real; bar_50_real_reg <= bar_50_real; bar_51_real_reg <= bar_51_real;
                bar_52_real_reg <= bar_52_real; bar_53_real_reg <= bar_53_real; bar_54_real_reg <= bar_54_real; bar_55_real_reg <= bar_55_real;
                bar_56_real_reg <= bar_56_real; bar_57_real_reg <= bar_57_real; bar_58_real_reg <= bar_58_real; bar_59_real_reg <= bar_59_real;
                bar_60_real_reg <= bar_60_real; bar_61_real_reg <= bar_61_real; bar_62_real_reg <= bar_62_real; bar_63_real_reg <= bar_63_real;
                bar_64_real_reg <= bar_64_real; bar_65_real_reg <= bar_65_real; bar_66_real_reg <= bar_66_real; bar_67_real_reg <= bar_67_real;
                bar_68_real_reg <= bar_68_real; bar_69_real_reg <= bar_69_real; bar_70_real_reg <= bar_70_real; bar_71_real_reg <= bar_71_real;
                bar_72_real_reg <= bar_72_real; bar_73_real_reg <= bar_73_real; bar_74_real_reg <= bar_74_real; bar_75_real_reg <= bar_75_real;
                bar_76_real_reg <= bar_76_real; bar_77_real_reg <= bar_77_real; bar_78_real_reg <= bar_78_real; bar_79_real_reg <= bar_79_real;
                bar_80_real_reg <= bar_80_real; bar_81_real_reg <= bar_81_real; bar_82_real_reg <= bar_82_real; bar_83_real_reg <= bar_83_real;
                bar_84_real_reg <= bar_84_real; bar_85_real_reg <= bar_85_real; bar_86_real_reg <= bar_86_real; bar_87_real_reg <= bar_87_real;
                bar_88_real_reg <= bar_88_real; bar_89_real_reg <= bar_89_real; bar_90_real_reg <= bar_90_real; bar_91_real_reg <= bar_91_real;
                bar_92_real_reg <= bar_92_real; bar_93_real_reg <= bar_93_real; bar_94_real_reg <= bar_94_real; bar_95_real_reg <= bar_95_real;
                bar_96_real_reg <= bar_96_real; bar_97_real_reg <= bar_97_real; bar_98_real_reg <= bar_98_real; bar_99_real_reg <= bar_99_real;
                bar_100_real_reg <= bar_100_real; bar_101_real_reg <= bar_101_real; bar_102_real_reg <= bar_102_real; bar_103_real_reg <= bar_103_real;
                bar_104_real_reg <= bar_104_real; bar_105_real_reg <= bar_105_real; bar_106_real_reg <= bar_106_real; bar_107_real_reg <= bar_107_real;
                bar_108_real_reg <= bar_108_real; bar_109_real_reg <= bar_109_real; bar_110_real_reg <= bar_110_real; bar_111_real_reg <= bar_111_real;
                bar_112_real_reg <= bar_112_real; bar_113_real_reg <= bar_113_real; bar_114_real_reg <= bar_114_real; bar_115_real_reg <= bar_115_real;
                bar_116_real_reg <= bar_116_real; bar_117_real_reg <= bar_117_real; bar_118_real_reg <= bar_118_real; bar_119_real_reg <= bar_119_real;
                bar_120_real_reg <= bar_120_real; bar_121_real_reg <= bar_121_real; bar_122_real_reg <= bar_122_real; bar_123_real_reg <= bar_123_real;
                bar_124_real_reg <= bar_124_real; bar_125_real_reg <= bar_125_real; bar_126_real_reg <= bar_126_real; bar_127_real_reg <= bar_127_real;
                
                bar_0_imag_reg <= bar_0_imag;  bar_1_imag_reg <= bar_1_imag;  bar_2_imag_reg <= bar_2_imag;  bar_3_imag_reg <= bar_3_imag;
                bar_4_imag_reg <= bar_4_imag;  bar_5_imag_reg <= bar_5_imag;  bar_6_imag_reg <= bar_6_imag;  bar_7_imag_reg <= bar_7_imag;
                bar_8_imag_reg <= bar_8_imag;  bar_9_imag_reg <= bar_9_imag;  bar_10_imag_reg <= bar_10_imag; bar_11_imag_reg <= bar_11_imag;
                bar_12_imag_reg <= bar_12_imag; bar_13_imag_reg <= bar_13_imag; bar_14_imag_reg <= bar_14_imag; bar_15_imag_reg <= bar_15_imag;
                bar_16_imag_reg <= bar_16_imag; bar_17_imag_reg <= bar_17_imag; bar_18_imag_reg <= bar_18_imag; bar_19_imag_reg <= bar_19_imag;
                bar_20_imag_reg <= bar_20_imag; bar_21_imag_reg <= bar_21_imag; bar_22_imag_reg <= bar_22_imag; bar_23_imag_reg <= bar_23_imag;
                bar_24_imag_reg <= bar_24_imag; bar_25_imag_reg <= bar_25_imag; bar_26_imag_reg <= bar_26_imag; bar_27_imag_reg <= bar_27_imag;
                bar_28_imag_reg <= bar_28_imag; bar_29_imag_reg <= bar_29_imag; bar_30_imag_reg <= bar_30_imag; bar_31_imag_reg <= bar_31_imag;
                bar_32_imag_reg <= bar_32_imag; bar_33_imag_reg <= bar_33_imag; bar_34_imag_reg <= bar_34_imag; bar_35_imag_reg <= bar_35_imag;
                bar_36_imag_reg <= bar_36_imag; bar_37_imag_reg <= bar_37_imag; bar_38_imag_reg <= bar_38_imag; bar_39_imag_reg <= bar_39_imag;
                bar_40_imag_reg <= bar_40_imag; bar_41_imag_reg <= bar_41_imag; bar_42_imag_reg <= bar_42_imag; bar_43_imag_reg <= bar_43_imag;
                bar_44_imag_reg <= bar_44_imag; bar_45_imag_reg <= bar_45_imag; bar_46_imag_reg <= bar_46_imag; bar_47_imag_reg <= bar_47_imag;
                bar_48_imag_reg <= bar_48_imag; bar_49_imag_reg <= bar_49_imag; bar_50_imag_reg <= bar_50_imag; bar_51_imag_reg <= bar_51_imag;
                bar_52_imag_reg <= bar_52_imag; bar_53_imag_reg <= bar_53_imag; bar_54_imag_reg <= bar_54_imag; bar_55_imag_reg <= bar_55_imag;
                bar_56_imag_reg <= bar_56_imag; bar_57_imag_reg <= bar_57_imag; bar_58_imag_reg <= bar_58_imag; bar_59_imag_reg <= bar_59_imag;
                bar_60_imag_reg <= bar_60_imag; bar_61_imag_reg <= bar_61_imag; bar_62_imag_reg <= bar_62_imag; bar_63_imag_reg <= bar_63_imag;
                bar_64_imag_reg <= bar_64_imag; bar_65_imag_reg <= bar_65_imag; bar_66_imag_reg <= bar_66_imag; bar_67_imag_reg <= bar_67_imag;
                bar_68_imag_reg <= bar_68_imag; bar_69_imag_reg <= bar_69_imag; bar_70_imag_reg <= bar_70_imag; bar_71_imag_reg <= bar_71_imag;
                bar_72_imag_reg <= bar_72_imag; bar_73_imag_reg <= bar_73_imag; bar_74_imag_reg <= bar_74_imag; bar_75_imag_reg <= bar_75_imag;
                bar_76_imag_reg <= bar_76_imag; bar_77_imag_reg <= bar_77_imag; bar_78_imag_reg <= bar_78_imag; bar_79_imag_reg <= bar_79_imag;
                bar_80_imag_reg <= bar_80_imag; bar_81_imag_reg <= bar_81_imag; bar_82_imag_reg <= bar_82_imag; bar_83_imag_reg <= bar_83_imag;
                bar_84_imag_reg <= bar_84_imag; bar_85_imag_reg <= bar_85_imag; bar_86_imag_reg <= bar_86_imag; bar_87_imag_reg <= bar_87_imag;
                bar_88_imag_reg <= bar_88_imag; bar_89_imag_reg <= bar_89_imag; bar_90_imag_reg <= bar_90_imag; bar_91_imag_reg <= bar_91_imag;
                bar_92_imag_reg <= bar_92_imag; bar_93_imag_reg <= bar_93_imag; bar_94_imag_reg <= bar_94_imag; bar_95_imag_reg <= bar_95_imag;
                bar_96_imag_reg <= bar_96_imag; bar_97_imag_reg <= bar_97_imag; bar_98_imag_reg <= bar_98_imag; bar_99_imag_reg <= bar_99_imag;
                bar_100_imag_reg <= bar_100_imag; bar_101_imag_reg <= bar_101_imag; bar_102_imag_reg <= bar_102_imag; bar_103_imag_reg <= bar_103_imag;
                bar_104_imag_reg <= bar_104_imag; bar_105_imag_reg <= bar_105_imag; bar_106_imag_reg <= bar_106_imag; bar_107_imag_reg <= bar_107_imag;
                bar_108_imag_reg <= bar_108_imag; bar_109_imag_reg <= bar_109_imag; bar_110_imag_reg <= bar_110_imag; bar_111_imag_reg <= bar_111_imag;
                bar_112_imag_reg <= bar_112_imag; bar_113_imag_reg <= bar_113_imag; bar_114_imag_reg <= bar_114_imag; bar_115_imag_reg <= bar_115_imag;
                bar_116_imag_reg <= bar_116_imag; bar_117_imag_reg <= bar_117_imag; bar_118_imag_reg <= bar_118_imag; bar_119_imag_reg <= bar_119_imag;
                bar_120_imag_reg <= bar_120_imag; bar_121_imag_reg <= bar_121_imag; bar_122_imag_reg <= bar_122_imag; bar_123_imag_reg <= bar_123_imag;
                bar_124_imag_reg <= bar_124_imag; bar_125_imag_reg <= bar_125_imag; bar_126_imag_reg <= bar_126_imag; bar_127_imag_reg <= bar_127_imag;
                
                ready <= 1'b1;              
            end
            else if (h_counter_top < 784 && h_counter_top > 143 && v_counter_top < 515 && v_counter_top > 34)begin
                ////////////////////////////////////////////////////////////////////
                //  Draw bars by using input values , bars width are 3 pixel
                ////////////////////////////////////////////////////////////////////
                if ((v_counter_top < 460 && v_counter_top > 360))begin
//                    if ((remainder == 1) || (remainder == 2) || (remainder == 3))begin // inside of bar colours
//                        Red <= White; Green <= White; Blue <= White;
//                    end
//                    else 
                    if (remainder == 4 || remainder == 0)begin
                        Red <= White; Green <= Black; Blue <= Black;
                    end
                    case (h_counter_top)
                        146, 147, 148: assign_bars(bar_0_real_reg); 151, 152, 153: assign_bars(bar_1_real_reg); 156, 157, 158: assign_bars(bar_2_real_reg); 161, 162, 163: assign_bars(bar_3_real_reg);
                        166, 167, 168: assign_bars(bar_4_real_reg); 171, 172, 173: assign_bars(bar_5_real_reg); 176, 177, 178: assign_bars(bar_6_real_reg); 181, 182, 183: assign_bars(bar_7_real_reg);
                        186, 187, 188: assign_bars(bar_8_real_reg); 191, 192, 193: assign_bars(bar_9_real_reg); 196, 197, 198: assign_bars(bar_10_real_reg); 201, 202, 203: assign_bars(bar_11_real_reg);
                        206, 207, 208: assign_bars(bar_12_real_reg); 211, 212, 213: assign_bars(bar_13_real_reg); 216, 217, 218: assign_bars(bar_14_real_reg); 221, 222, 223: assign_bars(bar_15_real_reg);
                        226, 227, 228: assign_bars(bar_16_real_reg); 231, 232, 233: assign_bars(bar_17_real_reg); 236, 237, 238: assign_bars(bar_18_real_reg); 241, 242, 243: assign_bars(bar_19_real_reg);
                        246, 247, 248: assign_bars(bar_20_real_reg); 251, 252, 253: assign_bars(bar_21_real_reg); 256, 257, 258: assign_bars(bar_22_real_reg); 261, 262, 263: assign_bars(bar_23_real_reg);
                        266, 267, 268: assign_bars(bar_24_real_reg); 271, 272, 273: assign_bars(bar_25_real_reg); 276, 277, 278: assign_bars(bar_26_real_reg); 281, 282, 283: assign_bars(bar_27_real_reg);
                        286, 287, 288: assign_bars(bar_28_real_reg); 291, 292, 293: assign_bars(bar_29_real_reg); 296, 297, 298: assign_bars(bar_30_real_reg); 301, 302, 303: assign_bars(bar_31_real_reg);
                        306, 307, 308: assign_bars(bar_32_real_reg); 311, 312, 313: assign_bars(bar_33_real_reg); 316, 317, 318: assign_bars(bar_34_real_reg); 321, 322, 323: assign_bars(bar_35_real_reg);
                        326, 327, 328: assign_bars(bar_36_real_reg); 331, 332, 333: assign_bars(bar_37_real_reg); 336, 337, 338: assign_bars(bar_38_real_reg); 341, 342, 343: assign_bars(bar_39_real_reg);
                        346, 347, 348: assign_bars(bar_40_real_reg); 351, 352, 353: assign_bars(bar_41_real_reg); 356, 357, 358: assign_bars(bar_42_real_reg); 361, 362, 363: assign_bars(bar_43_real_reg);
                        366, 367, 368: assign_bars(bar_44_real_reg); 371, 372, 373: assign_bars(bar_45_real_reg); 376, 377, 378: assign_bars(bar_46_real_reg); 381, 382, 383: assign_bars(bar_47_real_reg);
                        386, 387, 388: assign_bars(bar_48_real_reg); 391, 392, 393: assign_bars(bar_49_real_reg); 396, 397, 398: assign_bars(bar_50_real_reg); 401, 402, 403: assign_bars(bar_51_real_reg);
                        406, 407, 408: assign_bars(bar_52_real_reg); 411, 412, 413: assign_bars(bar_53_real_reg); 416, 417, 418: assign_bars(bar_54_real_reg); 421, 422, 423: assign_bars(bar_55_real_reg);
                        426, 427, 428: assign_bars(bar_56_real_reg); 431, 432, 433: assign_bars(bar_57_real_reg); 436, 437, 438: assign_bars(bar_58_real_reg); 441, 442, 443: assign_bars(bar_59_real_reg);
                        446, 447, 448: assign_bars(bar_60_real_reg); 451, 452, 453: assign_bars(bar_61_real_reg); 456, 457, 458: assign_bars(bar_62_real_reg); 461, 462, 463: assign_bars(bar_63_real_reg);
                        466, 467, 468: assign_bars(bar_64_real_reg); 471, 472, 473: assign_bars(bar_65_real_reg); 476, 477, 478: assign_bars(bar_66_real_reg); 481, 482, 483: assign_bars(bar_67_real_reg);
                        486, 487, 488: assign_bars(bar_68_real_reg); 491, 492, 493: assign_bars(bar_69_real_reg); 496, 497, 498: assign_bars(bar_70_real_reg); 501, 502, 503: assign_bars(bar_71_real_reg);
                        506, 507, 508: assign_bars(bar_72_real_reg); 511, 512, 513: assign_bars(bar_73_real_reg); 516, 517, 518: assign_bars(bar_74_real_reg); 521, 522, 523: assign_bars(bar_75_real_reg);
                        526, 527, 528: assign_bars(bar_76_real_reg); 531, 532, 533: assign_bars(bar_77_real_reg); 536, 537, 538: assign_bars(bar_78_real_reg); 541, 542, 543: assign_bars(bar_79_real_reg);
                        546, 547, 548: assign_bars(bar_80_real_reg); 551, 552, 553: assign_bars(bar_81_real_reg); 556, 557, 558: assign_bars(bar_82_real_reg); 561, 562, 563: assign_bars(bar_83_real_reg);
                        566, 567, 568: assign_bars(bar_84_real_reg); 571, 572, 573: assign_bars(bar_85_real_reg); 576, 577, 578: assign_bars(bar_86_real_reg); 581, 582, 583: assign_bars(bar_87_real_reg);
                        586, 587, 588: assign_bars(bar_88_real_reg); 591, 592, 593: assign_bars(bar_89_real_reg); 596, 597, 598: assign_bars(bar_90_real_reg); 601, 602, 603: assign_bars(bar_91_real_reg);
                        606, 607, 608: assign_bars(bar_92_real_reg); 611, 612, 613: assign_bars(bar_93_real_reg); 616, 617, 618: assign_bars(bar_94_real_reg); 621, 622, 623: assign_bars(bar_95_real_reg);
                        626, 627, 628: assign_bars(bar_96_real_reg); 631, 632, 633: assign_bars(bar_97_real_reg); 636, 637, 638: assign_bars(bar_98_real_reg); 641, 642, 643: assign_bars(bar_99_real_reg);
                        646, 647, 648: assign_bars(bar_100_real_reg); 651, 652, 653: assign_bars(bar_101_real_reg); 656, 657, 658: assign_bars(bar_102_real_reg); 661, 662, 663: assign_bars(bar_103_real_reg);
                        666, 667, 668: assign_bars(bar_104_real_reg); 671, 672, 673: assign_bars(bar_105_real_reg); 676, 677, 678: assign_bars(bar_106_real_reg); 681, 682, 683: assign_bars(bar_107_real_reg);
                        686, 687, 688: assign_bars(bar_108_real_reg); 691, 692, 693: assign_bars(bar_109_real_reg); 696, 697, 698: assign_bars(bar_110_real_reg); 701, 702, 703: assign_bars(bar_111_real_reg);
                        706, 707, 708: assign_bars(bar_112_real_reg); 711, 712, 713: assign_bars(bar_113_real_reg); 716, 717, 718: assign_bars(bar_114_real_reg); 721, 722, 723: assign_bars(bar_115_real_reg);
                        726, 727, 728: assign_bars(bar_116_real_reg); 731, 732, 733: assign_bars(bar_117_real_reg); 736, 737, 738: assign_bars(bar_118_real_reg); 741, 742, 743: assign_bars(bar_119_real_reg);
                        746, 747, 748: assign_bars(bar_120_real_reg); 751, 752, 753: assign_bars(bar_121_real_reg); 756, 757, 758: assign_bars(bar_122_real_reg); 761, 762, 763: assign_bars(bar_123_real_reg);
                        766, 767, 768: assign_bars(bar_124_real_reg); 771, 772, 773: assign_bars(bar_125_real_reg); 776, 777, 778: assign_bars(bar_126_real_reg); 781, 782, 783: assign_bars(bar_127_real_reg);
                        
                    endcase
                end
                else if ((v_counter_top < 340 && v_counter_top > 240))begin
//                  if ((remainder == 1) || (remainder == 2) || (remainder == 3))begin // inside of bar colours
//                      Red <= White; Green <= White; Blue <= White;
//                  end
//                  else 
                    if (remainder == 4 || remainder == 0)begin
                        Red <= White; Green <= Black; Blue <= Black;
                    end
                    case (h_counter_top)
                        146, 147, 148: assign_bars_1(bar_0_imag_reg); 151, 152, 153: assign_bars_1(bar_1_imag_reg); 156, 157, 158: assign_bars_1(bar_2_imag_reg); 161, 162, 163: assign_bars_1(bar_3_imag_reg);
                        166, 167, 168: assign_bars_1(bar_4_imag_reg); 171, 172, 173: assign_bars_1(bar_5_imag_reg); 176, 177, 178: assign_bars_1(bar_6_imag_reg); 181, 182, 183: assign_bars_1(bar_7_imag_reg);
                        186, 187, 188: assign_bars_1(bar_8_imag_reg); 191, 192, 193: assign_bars_1(bar_9_imag_reg); 196, 197, 198: assign_bars_1(bar_10_imag_reg); 201, 202, 203: assign_bars_1(bar_11_imag_reg);
                        206, 207, 208: assign_bars_1(bar_12_imag_reg); 211, 212, 213: assign_bars_1(bar_13_imag_reg); 216, 217, 218: assign_bars_1(bar_14_imag_reg); 221, 222, 223: assign_bars_1(bar_15_imag_reg);
                        226, 227, 228: assign_bars_1(bar_16_imag_reg); 231, 232, 233: assign_bars_1(bar_17_imag_reg); 236, 237, 238: assign_bars_1(bar_18_imag_reg); 241, 242, 243: assign_bars_1(bar_19_imag_reg);
                        246, 247, 248: assign_bars_1(bar_20_imag_reg); 251, 252, 253: assign_bars_1(bar_21_imag_reg); 256, 257, 258: assign_bars_1(bar_22_imag_reg); 261, 262, 263: assign_bars_1(bar_23_imag_reg);
                        266, 267, 268: assign_bars_1(bar_24_imag_reg); 271, 272, 273: assign_bars_1(bar_25_imag_reg); 276, 277, 278: assign_bars_1(bar_26_imag_reg); 281, 282, 283: assign_bars_1(bar_27_imag_reg);
                        286, 287, 288: assign_bars_1(bar_28_imag_reg); 291, 292, 293: assign_bars_1(bar_29_imag_reg); 296, 297, 298: assign_bars_1(bar_30_imag_reg); 301, 302, 303: assign_bars_1(bar_31_imag_reg);
                        306, 307, 308: assign_bars_1(bar_32_imag_reg); 311, 312, 313: assign_bars_1(bar_33_imag_reg); 316, 317, 318: assign_bars_1(bar_34_imag_reg); 321, 322, 323: assign_bars_1(bar_35_imag_reg);
                        326, 327, 328: assign_bars_1(bar_36_imag_reg); 331, 332, 333: assign_bars_1(bar_37_imag_reg); 336, 337, 338: assign_bars_1(bar_38_imag_reg); 341, 342, 343: assign_bars_1(bar_39_imag_reg);
                        346, 347, 348: assign_bars_1(bar_40_imag_reg); 351, 352, 353: assign_bars_1(bar_41_imag_reg); 356, 357, 358: assign_bars_1(bar_42_imag_reg); 361, 362, 363: assign_bars_1(bar_43_imag_reg);
                        366, 367, 368: assign_bars_1(bar_44_imag_reg); 371, 372, 373: assign_bars_1(bar_45_imag_reg); 376, 377, 378: assign_bars_1(bar_46_imag_reg); 381, 382, 383: assign_bars_1(bar_47_imag_reg);
                        386, 387, 388: assign_bars_1(bar_48_imag_reg); 391, 392, 393: assign_bars_1(bar_49_imag_reg); 396, 397, 398: assign_bars_1(bar_50_imag_reg); 401, 402, 403: assign_bars_1(bar_51_imag_reg);
                        406, 407, 408: assign_bars_1(bar_52_imag_reg); 411, 412, 413: assign_bars_1(bar_53_imag_reg); 416, 417, 418: assign_bars_1(bar_54_imag_reg); 421, 422, 423: assign_bars_1(bar_55_imag_reg);
                        426, 427, 428: assign_bars_1(bar_56_imag_reg); 431, 432, 433: assign_bars_1(bar_57_imag_reg); 436, 437, 438: assign_bars_1(bar_58_imag_reg); 441, 442, 443: assign_bars_1(bar_59_imag_reg);
                        446, 447, 448: assign_bars_1(bar_60_imag_reg); 451, 452, 453: assign_bars_1(bar_61_imag_reg); 456, 457, 458: assign_bars_1(bar_62_imag_reg); 461, 462, 463: assign_bars_1(bar_63_imag_reg);
                        466, 467, 468: assign_bars_1(bar_64_imag_reg); 471, 472, 473: assign_bars_1(bar_65_imag_reg); 476, 477, 478: assign_bars_1(bar_66_imag_reg); 481, 482, 483: assign_bars_1(bar_67_imag_reg);
                        486, 487, 488: assign_bars_1(bar_68_imag_reg); 491, 492, 493: assign_bars_1(bar_69_imag_reg); 496, 497, 498: assign_bars_1(bar_70_imag_reg); 501, 502, 503: assign_bars_1(bar_71_imag_reg);
                        506, 507, 508: assign_bars_1(bar_72_imag_reg); 511, 512, 513: assign_bars_1(bar_73_imag_reg); 516, 517, 518: assign_bars_1(bar_74_imag_reg); 521, 522, 523: assign_bars_1(bar_75_imag_reg);
                        526, 527, 528: assign_bars_1(bar_76_imag_reg); 531, 532, 533: assign_bars_1(bar_77_imag_reg); 536, 537, 538: assign_bars_1(bar_78_imag_reg); 541, 542, 543: assign_bars_1(bar_79_imag_reg);
                        546, 547, 548: assign_bars_1(bar_80_imag_reg); 551, 552, 553: assign_bars_1(bar_81_imag_reg); 556, 557, 558: assign_bars_1(bar_82_imag_reg); 561, 562, 563: assign_bars_1(bar_83_imag_reg);
                        566, 567, 568: assign_bars_1(bar_84_imag_reg); 571, 572, 573: assign_bars_1(bar_85_imag_reg); 576, 577, 578: assign_bars_1(bar_86_imag_reg); 581, 582, 583: assign_bars_1(bar_87_imag_reg);
                        586, 587, 588: assign_bars_1(bar_88_imag_reg); 591, 592, 593: assign_bars_1(bar_89_imag_reg); 596, 597, 598: assign_bars_1(bar_90_imag_reg); 601, 602, 603: assign_bars_1(bar_91_imag_reg);
                        606, 607, 608: assign_bars_1(bar_92_imag_reg); 611, 612, 613: assign_bars_1(bar_93_imag_reg); 616, 617, 618: assign_bars_1(bar_94_imag_reg); 621, 622, 623: assign_bars_1(bar_95_imag_reg);
                        626, 627, 628: assign_bars_1(bar_96_imag_reg); 631, 632, 633: assign_bars_1(bar_97_imag_reg); 636, 637, 638: assign_bars_1(bar_98_imag_reg); 641, 642, 643: assign_bars_1(bar_99_imag_reg);
                        646, 647, 648: assign_bars_1(bar_100_imag_reg); 651, 652, 653: assign_bars_1(bar_101_imag_reg); 656, 657, 658: assign_bars_1(bar_102_imag_reg); 661, 662, 663: assign_bars_1(bar_103_imag_reg);
                        666, 667, 668: assign_bars_1(bar_104_imag_reg); 671, 672, 673: assign_bars_1(bar_105_imag_reg); 676, 677, 678: assign_bars_1(bar_106_imag_reg); 681, 682, 683: assign_bars_1(bar_107_imag_reg);
                        686, 687, 688: assign_bars_1(bar_108_imag_reg); 691, 692, 693: assign_bars_1(bar_109_imag_reg); 696, 697, 698: assign_bars_1(bar_110_imag_reg); 701, 702, 703: assign_bars_1(bar_111_imag_reg);
                        706, 707, 708: assign_bars_1(bar_112_imag_reg); 711, 712, 713: assign_bars_1(bar_113_imag_reg); 716, 717, 718: assign_bars_1(bar_114_imag_reg); 721, 722, 723: assign_bars_1(bar_115_imag_reg);
                        726, 727, 728: assign_bars_1(bar_116_imag_reg); 731, 732, 733: assign_bars_1(bar_117_imag_reg); 736, 737, 738: assign_bars_1(bar_118_imag_reg); 741, 742, 743: assign_bars_1(bar_119_imag_reg);
                        746, 747, 748: assign_bars_1(bar_120_imag_reg); 751, 752, 753: assign_bars_1(bar_121_imag_reg); 756, 757, 758: assign_bars_1(bar_122_imag_reg); 761, 762, 763: assign_bars_1(bar_123_imag_reg);
                        766, 767, 768: assign_bars_1(bar_124_imag_reg); 771, 772, 773: assign_bars_1(bar_125_imag_reg); 776, 777, 778: assign_bars_1(bar_126_imag_reg); 781, 782, 783: assign_bars_1(bar_127_imag_reg);
                    endcase
                end
                ////////////////////////////////////////////////////////////////////
                //  To print font to the screen but don't work -_-
                ////////////////////////////////////////////////////////////////////
                else if ((v_counter_top >= 50 && v_counter_top <= 193) )begin
                    if ((h_counter_top >= 400 && h_counter_top <= 541))begin
                        font_counter <= (font_counter == 32'd20447) ? (32'b0) : (font_counter + 1 );
                        if (font_data)begin
                            Red <= Black; Green <= Black; Blue <= Black;
                        end
                        else begin
                            Red <= White; Green <= Black; Blue <= Black;
                        end
                    end
                    else begin
                        Red <= White; Green <= Black; Blue <= Black;
                    end
                end
                ////////////////////////////////////////////////////////////////////
                //  Anything else is same with background
                ////////////////////////////////////////////////////////////////////
                else if (v_counter_top >= 460 || (v_counter_top <= 360 && v_counter_top > 193) || v_counter_top < 50)begin
                    Red <= White; Green <= Black; Blue <= Black;
                end
            end
            ////////////////////////////////////////////////////////////////////
            //  Anything else is black (out of screen)
            ////////////////////////////////////////////////////////////////////
            else begin
                Red <= Black; Green <= Black; Blue <= Black;
            end
        end
    end
    
    task assign_bars;
        input [6:0] bar_reg;
        begin
            Red     <= (v_counter_wire >= bar_reg) ? Black : White;
            Green   <= (v_counter_wire >= bar_reg) ? White : White;
            Blue    <= (v_counter_wire >= bar_reg) ? Black : White;
        end
    endtask
    
    task assign_bars_1;
        input [6:0] bar_reg;
        begin
            Red     <= (v_counter_wire_1 >= bar_reg) ? Black : White;
            Green   <= (v_counter_wire_1 >= bar_reg) ? White : White;
            Blue    <= (v_counter_wire_1 >= bar_reg) ? Black : White;
        end
    endtask
    
endmodule