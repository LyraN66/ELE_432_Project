module ELE_432_Top_Module(
    input clk,
    input rst,
    
    output H_sync,
    output V_sync,
    output [3:0] Red,
    output [3:0] Green,
    output [3:0] Blue
    );
    
    wire start_vga;
    wire busy_vga;
    
    wire [6:0] bar_0_wire;
    wire [6:0] bar_1_wire;
    wire [6:0] bar_2_wire;
    wire [6:0] bar_3_wire;
    wire [6:0] bar_4_wire;
    wire [6:0] bar_5_wire;
    wire [6:0] bar_6_wire;
    wire [6:0] bar_7_wire;
    wire [6:0] bar_8_wire;
    wire [6:0] bar_9_wire;
    wire [6:0] bar_10_wire;
    wire [6:0] bar_11_wire;
    wire [6:0] bar_12_wire;
    wire [6:0] bar_13_wire;
    wire [6:0] bar_14_wire;
    wire [6:0] bar_15_wire;
    wire [6:0] bar_16_wire;
    wire [6:0] bar_17_wire;
    wire [6:0] bar_18_wire;
    wire [6:0] bar_19_wire;
    wire [6:0] bar_20_wire;
    wire [6:0] bar_21_wire;
    wire [6:0] bar_22_wire;
    wire [6:0] bar_23_wire;
    wire [6:0] bar_24_wire;
    wire [6:0] bar_25_wire;
    wire [6:0] bar_26_wire;
    wire [6:0] bar_27_wire;
    wire [6:0] bar_28_wire;
    wire [6:0] bar_29_wire;
    wire [6:0] bar_30_wire;
    wire [6:0] bar_31_wire;
    wire [6:0] bar_32_wire;
    wire [6:0] bar_33_wire;
    wire [6:0] bar_34_wire;
    wire [6:0] bar_35_wire;
    wire [6:0] bar_36_wire;
    wire [6:0] bar_37_wire;
    wire [6:0] bar_38_wire;
    wire [6:0] bar_39_wire;
    wire [6:0] bar_40_wire;
    wire [6:0] bar_41_wire;
    wire [6:0] bar_42_wire;
    wire [6:0] bar_43_wire;
    wire [6:0] bar_44_wire;
    wire [6:0] bar_45_wire;
    wire [6:0] bar_46_wire;
    wire [6:0] bar_47_wire;
    wire [6:0] bar_48_wire;
    wire [6:0] bar_49_wire;
    wire [6:0] bar_50_wire;
    wire [6:0] bar_51_wire;
    wire [6:0] bar_52_wire;
    wire [6:0] bar_53_wire;
    wire [6:0] bar_54_wire;
    wire [6:0] bar_55_wire;
    wire [6:0] bar_56_wire;
    wire [6:0] bar_57_wire;
    wire [6:0] bar_58_wire;
    wire [6:0] bar_59_wire;
    wire [6:0] bar_60_wire;
    wire [6:0] bar_61_wire;
    wire [6:0] bar_62_wire;
    wire [6:0] bar_63_wire;
    
    wire slow_clk;
    Divided_Clock Div_Clk(
        . clk(clk),
        . rst(rst),
        . div_clk(slow_clk)
    );
    
    VGA_Controller VGA(
        . clk(slow_clk),
        . rst(rst),
        . H_sync(H_sync),
        . V_sync(V_sync),
        
        . start(start_vga),
        . busy(busy_vga),
        
        . bar_0(bar_0_wire),
        . bar_1(bar_1_wire),
        . bar_2(bar_2_wire),
        . bar_3(bar_3_wire),
        . bar_4(bar_4_wire),
        . bar_5(bar_5_wire),
        . bar_6(bar_6_wire),
        . bar_7(bar_7_wire),
        . bar_8(bar_8_wire),
        . bar_9(bar_9_wire),
        . bar_10(bar_10_wire),
        . bar_11(bar_11_wire),
        . bar_12(bar_12_wire),
        . bar_13(bar_13_wire),
        . bar_14(bar_14_wire),
        . bar_15(bar_15_wire),
        . bar_16(bar_16_wire),
        . bar_17(bar_17_wire),
        . bar_18(bar_18_wire),
        . bar_19(bar_19_wire),
        . bar_20(bar_20_wire),
        . bar_21(bar_21_wire),
        . bar_22(bar_22_wire),
        . bar_23(bar_23_wire),
        . bar_24(bar_24_wire),
        . bar_25(bar_25_wire),
        . bar_26(bar_26_wire),
        . bar_27(bar_27_wire),
        . bar_28(bar_28_wire),
        . bar_29(bar_29_wire),
        . bar_30(bar_30_wire),
        . bar_31(bar_31_wire),
        . bar_32(bar_32_wire),
        . bar_33(bar_33_wire),
        . bar_34(bar_34_wire),
        . bar_35(bar_35_wire),
        . bar_36(bar_36_wire),
        . bar_37(bar_37_wire),
        . bar_38(bar_38_wire),
        . bar_39(bar_39_wire),
        . bar_40(bar_40_wire),
        . bar_41(bar_41_wire),
        . bar_42(bar_42_wire),
        . bar_43(bar_43_wire),
        . bar_44(bar_44_wire),
        . bar_45(bar_45_wire),
        . bar_46(bar_46_wire),
        . bar_47(bar_47_wire),
        . bar_48(bar_48_wire),
        . bar_49(bar_49_wire),
        . bar_50(bar_50_wire),
        . bar_51(bar_51_wire),
        . bar_52(bar_52_wire),
        . bar_53(bar_53_wire),
        . bar_54(bar_54_wire),
        . bar_55(bar_55_wire),
        . bar_56(bar_56_wire),
        . bar_57(bar_57_wire),
        . bar_58(bar_58_wire),
        . bar_59(bar_59_wire),
        . bar_60(bar_60_wire),
        . bar_61(bar_61_wire),
        . bar_62(bar_62_wire),
        . bar_63(bar_63_wire),
        
        . Red(Red),
        . Green(Green),
        . Blue(Blue)
    );
    
    wire start_fft;
    wire busy_fft;
    wire [15:0] real_part_fft;
    wire [15:0] imag_part_fft;
    FFT_Module FFT(
        . clk(slow_clk),
        . rst(rst),
        . start(start_fft),    
        . realpart(real_part_fft),
        . imagpart(imag_part_fft),

        . bar_0(bar_0_wire),
        . bar_1(bar_1_wire),
        . bar_2(bar_2_wire),
        . bar_3(bar_3_wire),
        . bar_4(bar_4_wire),
        . bar_5(bar_5_wire),
        . bar_6(bar_6_wire),
        . bar_7(bar_7_wire),
        . bar_8(bar_8_wire),
        . bar_9(bar_9_wire),
        . bar_10(bar_10_wire),
        . bar_11(bar_11_wire),
        . bar_12(bar_12_wire),
        . bar_13(bar_13_wire),
        . bar_14(bar_14_wire),
        . bar_15(bar_15_wire),
        . bar_16(bar_16_wire),
        . bar_17(bar_17_wire),
        . bar_18(bar_18_wire),
        . bar_19(bar_19_wire),
        . bar_20(bar_20_wire),
        . bar_21(bar_21_wire),
        . bar_22(bar_22_wire),
        . bar_23(bar_23_wire),
        . bar_24(bar_24_wire),
        . bar_25(bar_25_wire),
        . bar_26(bar_26_wire),
        . bar_27(bar_27_wire),
        . bar_28(bar_28_wire),
        . bar_29(bar_29_wire),
        . bar_30(bar_30_wire),
        . bar_31(bar_31_wire),
        . bar_32(bar_32_wire),
        . bar_33(bar_33_wire),
        . bar_34(bar_34_wire),
        . bar_35(bar_35_wire),
        . bar_36(bar_36_wire),
        . bar_37(bar_37_wire),
        . bar_38(bar_38_wire),
        . bar_39(bar_39_wire),
        . bar_40(bar_40_wire),
        . bar_41(bar_41_wire),
        . bar_42(bar_42_wire),
        . bar_43(bar_43_wire),
        . bar_44(bar_44_wire),
        . bar_45(bar_45_wire),
        . bar_46(bar_46_wire),
        . bar_47(bar_47_wire),
        . bar_48(bar_48_wire),
        . bar_49(bar_49_wire),
        . bar_50(bar_50_wire),
        . bar_51(bar_51_wire),
        . bar_52(bar_52_wire),
        . bar_53(bar_53_wire),
        . bar_54(bar_54_wire),
        . bar_55(bar_55_wire),
        . bar_56(bar_56_wire),
        . bar_57(bar_57_wire),
        . bar_58(bar_58_wire),
        . bar_59(bar_59_wire),
        . bar_60(bar_60_wire),
        . bar_61(bar_61_wire),
        . bar_62(bar_62_wire),
        . bar_63(bar_63_wire),
        . busy(busy_fft),
        . valid(start_vga)
    );
endmodule
