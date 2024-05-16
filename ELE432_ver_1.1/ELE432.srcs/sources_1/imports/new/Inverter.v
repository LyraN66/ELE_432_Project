module Inverter(
    output [6:0] bar_0_real, bar_1_real, bar_2_real, bar_3_real, bar_4_real, bar_5_real, bar_6_real, bar_7_real,
    output [6:0] bar_8_real, bar_9_real, bar_10_real, bar_11_real, bar_12_real, bar_13_real, bar_14_real, bar_15_real,
    output [6:0] bar_16_real, bar_17_real, bar_18_real, bar_19_real, bar_20_real, bar_21_real, bar_22_real, bar_23_real,
    output [6:0] bar_24_real, bar_25_real, bar_26_real, bar_27_real, bar_28_real, bar_29_real, bar_30_real, bar_31_real,
    output [6:0] bar_32_real, bar_33_real, bar_34_real, bar_35_real, bar_36_real, bar_37_real, bar_38_real, bar_39_real,
    output [6:0] bar_40_real, bar_41_real, bar_42_real, bar_43_real, bar_44_real, bar_45_real, bar_46_real, bar_47_real,
    output [6:0] bar_48_real, bar_49_real, bar_50_real, bar_51_real, bar_52_real, bar_53_real, bar_54_real, bar_55_real,
    output [6:0] bar_56_real, bar_57_real, bar_58_real, bar_59_real, bar_60_real, bar_61_real, bar_62_real, bar_63_real,
    output [6:0] bar_64_real, bar_65_real, bar_66_real, bar_67_real, bar_68_real, bar_69_real, bar_70_real, bar_71_real,
    output [6:0] bar_72_real, bar_73_real, bar_74_real, bar_75_real, bar_76_real, bar_77_real, bar_78_real, bar_79_real,
    output [6:0] bar_80_real, bar_81_real, bar_82_real, bar_83_real, bar_84_real, bar_85_real, bar_86_real, bar_87_real,
    output [6:0] bar_88_real, bar_89_real, bar_90_real, bar_91_real, bar_92_real, bar_93_real, bar_94_real, bar_95_real,
    output [6:0] bar_96_real, bar_97_real, bar_98_real, bar_99_real, bar_100_real, bar_101_real, bar_102_real, bar_103_real,
    output [6:0] bar_104_real, bar_105_real, bar_106_real, bar_107_real, bar_108_real, bar_109_real, bar_110_real, bar_111_real,
    output [6:0] bar_112_real, bar_113_real, bar_114_real, bar_115_real, bar_116_real, bar_117_real, bar_118_real, bar_119_real,
    output [6:0] bar_120_real, bar_121_real, bar_122_real, bar_123_real, bar_124_real, bar_125_real, bar_126_real, bar_127_real,
    
    output [6:0] bar_0_imag, bar_1_imag, bar_2_imag, bar_3_imag, bar_4_imag, bar_5_imag, bar_6_imag, bar_7_imag,
    output [6:0] bar_8_imag, bar_9_imag, bar_10_imag, bar_11_imag, bar_12_imag, bar_13_imag, bar_14_imag, bar_15_imag,
    output [6:0] bar_16_imag, bar_17_imag, bar_18_imag, bar_19_imag, bar_20_imag, bar_21_imag, bar_22_imag, bar_23_imag,
    output [6:0] bar_24_imag, bar_25_imag, bar_26_imag, bar_27_imag, bar_28_imag, bar_29_imag, bar_30_imag, bar_31_imag,
    output [6:0] bar_32_imag, bar_33_imag, bar_34_imag, bar_35_imag, bar_36_imag, bar_37_imag, bar_38_imag, bar_39_imag,
    output [6:0] bar_40_imag, bar_41_imag, bar_42_imag, bar_43_imag, bar_44_imag, bar_45_imag, bar_46_imag, bar_47_imag,
    output [6:0] bar_48_imag, bar_49_imag, bar_50_imag, bar_51_imag, bar_52_imag, bar_53_imag, bar_54_imag, bar_55_imag,
    output [6:0] bar_56_imag, bar_57_imag, bar_58_imag, bar_59_imag, bar_60_imag, bar_61_imag, bar_62_imag, bar_63_imag,
    output [6:0] bar_64_imag, bar_65_imag, bar_66_imag, bar_67_imag, bar_68_imag, bar_69_imag, bar_70_imag, bar_71_imag,
    output [6:0] bar_72_imag, bar_73_imag, bar_74_imag, bar_75_imag, bar_76_imag, bar_77_imag, bar_78_imag, bar_79_imag,
    output [6:0] bar_80_imag, bar_81_imag, bar_82_imag, bar_83_imag, bar_84_imag, bar_85_imag, bar_86_imag, bar_87_imag,
    output [6:0] bar_88_imag, bar_89_imag, bar_90_imag, bar_91_imag, bar_92_imag, bar_93_imag, bar_94_imag, bar_95_imag,
    output [6:0] bar_96_imag, bar_97_imag, bar_98_imag, bar_99_imag, bar_100_imag, bar_101_imag, bar_102_imag, bar_103_imag,
    output [6:0] bar_104_imag, bar_105_imag, bar_106_imag, bar_107_imag, bar_108_imag, bar_109_imag, bar_110_imag, bar_111_imag,
    output [6:0] bar_112_imag, bar_113_imag, bar_114_imag, bar_115_imag, bar_116_imag, bar_117_imag, bar_118_imag, bar_119_imag,
    output [6:0] bar_120_imag, bar_121_imag, bar_122_imag, bar_123_imag, bar_124_imag, bar_125_imag, bar_126_imag, bar_127_imag,
    
    input [6:0] bar_0, bar_1, bar_2, bar_3, bar_4, bar_5, bar_6, bar_7, bar_8, bar_9, bar_10, bar_11, bar_12, bar_13, bar_14, bar_15, bar_16, bar_17, bar_18, bar_19, bar_20, bar_21, bar_22, bar_23, bar_24, bar_25, bar_26, bar_27, bar_28, bar_29, bar_30,
    bar_31, bar_32, bar_33, bar_34, bar_35, bar_36, bar_37, bar_38, bar_39, bar_40, bar_41, bar_42, bar_43, bar_44, bar_45, bar_46, bar_47, bar_48, bar_49, bar_50, bar_51, bar_52, bar_53, bar_54, bar_55, bar_56, bar_57, bar_58, bar_59, bar_60, bar_61, bar_62, bar_63,
    bar_64, bar_65, bar_66, bar_67, bar_68, bar_69, bar_70, bar_71, bar_72, bar_73, bar_74, bar_75, bar_76, bar_77, bar_78, bar_79, bar_80, bar_81, bar_82, bar_83, bar_84, bar_85, bar_86, bar_87, bar_88, bar_89, bar_90, bar_91, bar_92, bar_93, bar_94, bar_95, bar_96,
    bar_97, bar_98, bar_99, bar_100, bar_101, bar_102, bar_103, bar_104, bar_105, bar_106, bar_107, bar_108, bar_109, bar_110, bar_111, bar_112, bar_113, bar_114, bar_115, bar_116, bar_117, bar_118, bar_119, bar_120, bar_121, bar_122, bar_123, bar_124, bar_125, bar_126, bar_127,
    
    input [6:0] ibar_0, ibar_1, ibar_2, ibar_3, ibar_4, ibar_5, ibar_6, ibar_7, ibar_8, ibar_9, ibar_10, ibar_11, ibar_12, ibar_13, ibar_14, ibar_15, ibar_16, ibar_17, ibar_18, ibar_19, ibar_20, ibar_21, ibar_22, ibar_23, ibar_24, ibar_25, ibar_26, ibar_27, ibar_28, ibar_29, ibar_30,
    ibar_31, ibar_32, ibar_33, ibar_34, ibar_35, ibar_36, ibar_37, ibar_38, ibar_39, ibar_40, ibar_41, ibar_42, ibar_43, ibar_44, ibar_45, ibar_46, ibar_47, ibar_48, ibar_49, ibar_50, ibar_51, ibar_52, ibar_53, ibar_54, ibar_55, ibar_56, ibar_57, ibar_58, ibar_59, ibar_60, ibar_61, ibar_62, ibar_63,
    ibar_64, ibar_65, ibar_66, ibar_67, ibar_68, ibar_69, ibar_70, ibar_71, ibar_72, ibar_73, ibar_74, ibar_75, ibar_76, ibar_77, ibar_78, ibar_79, ibar_80, ibar_81, ibar_82, ibar_83, ibar_84, ibar_85, ibar_86, ibar_87, ibar_88, ibar_89, ibar_90, ibar_91, ibar_92, ibar_93, ibar_94, ibar_95, ibar_96,
    ibar_97, ibar_98, ibar_99, ibar_100, ibar_101, ibar_102, ibar_103, ibar_104, ibar_105, ibar_106, ibar_107, ibar_108, ibar_109, ibar_110, ibar_111, ibar_112, ibar_113, ibar_114, ibar_115, ibar_116, ibar_117, ibar_118, ibar_119, ibar_120, ibar_121, ibar_122, ibar_123, ibar_124, ibar_125, ibar_126, ibar_127
    );
    
    assign bar_0_real = (bar_0[6]) ? (~bar_0 + 1) : (bar_0);
    assign bar_1_real = (bar_1[6]) ? (~bar_1 + 1) : (bar_1);
    assign bar_2_real = (bar_2[6]) ? (~bar_2 + 1) : (bar_2);
    assign bar_3_real = (bar_3[6]) ? (~bar_3 + 1) : (bar_3);
    assign bar_4_real = (bar_4[6]) ? (~bar_4 + 1) : (bar_4);
    assign bar_5_real = (bar_5[6]) ? (~bar_5 + 1) : (bar_5);
    assign bar_6_real = (bar_6[6]) ? (~bar_6 + 1) : (bar_6);
    assign bar_7_real = (bar_7[6]) ? (~bar_7 + 1) : (bar_7);
    assign bar_8_real = (bar_8[6]) ? (~bar_8 + 1) : (bar_8);
    assign bar_9_real = (bar_9[6]) ? (~bar_9 + 1) : (bar_9);
    assign bar_10_real = (bar_10[6]) ? (~bar_10 + 1) : (bar_10);
    assign bar_11_real = (bar_11[6]) ? (~bar_11 + 1) : (bar_11);
    assign bar_12_real = (bar_12[6]) ? (~bar_12 + 1) : (bar_12);
    assign bar_13_real = (bar_13[6]) ? (~bar_13 + 1) : (bar_13);
    assign bar_14_real = (bar_14[6]) ? (~bar_14 + 1) : (bar_14);
    assign bar_15_real = (bar_15[6]) ? (~bar_15 + 1) : (bar_15);
    assign bar_16_real = (bar_16[6]) ? (~bar_16 + 1) : (bar_16);
    assign bar_17_real = (bar_17[6]) ? (~bar_17 + 1) : (bar_17);
    assign bar_18_real = (bar_18[6]) ? (~bar_18 + 1) : (bar_18);
    assign bar_19_real = (bar_19[6]) ? (~bar_19 + 1) : (bar_19);
    assign bar_20_real = (bar_20[6]) ? (~bar_20 + 1) : (bar_20);
    assign bar_21_real = (bar_21[6]) ? (~bar_21 + 1) : (bar_21);
    assign bar_22_real = (bar_22[6]) ? (~bar_22 + 1) : (bar_22);
    assign bar_23_real = (bar_23[6]) ? (~bar_23 + 1) : (bar_23);
    assign bar_24_real = (bar_24[6]) ? (~bar_24 + 1) : (bar_24);
    assign bar_25_real = (bar_25[6]) ? (~bar_25 + 1) : (bar_25);
    assign bar_26_real = (bar_26[6]) ? (~bar_26 + 1) : (bar_26);
    assign bar_27_real = (bar_27[6]) ? (~bar_27 + 1) : (bar_27);
    assign bar_28_real = (bar_28[6]) ? (~bar_28 + 1) : (bar_28);
    assign bar_29_real = (bar_29[6]) ? (~bar_29 + 1) : (bar_29);
    assign bar_30_real = (bar_30[6]) ? (~bar_30 + 1) : (bar_30);
    assign bar_31_real = (bar_31[6]) ? (~bar_31 + 1) : (bar_31);
    assign bar_32_real = (bar_32[6]) ? (~bar_32 + 1) : (bar_32);
    assign bar_33_real = (bar_33[6]) ? (~bar_33 + 1) : (bar_33);
    assign bar_34_real = (bar_34[6]) ? (~bar_34 + 1) : (bar_34);
    assign bar_35_real = (bar_35[6]) ? (~bar_35 + 1) : (bar_35);
    assign bar_36_real = (bar_36[6]) ? (~bar_36 + 1) : (bar_36);
    assign bar_37_real = (bar_37[6]) ? (~bar_37 + 1) : (bar_37);
    assign bar_38_real = (bar_38[6]) ? (~bar_38 + 1) : (bar_38);
    assign bar_39_real = (bar_39[6]) ? (~bar_39 + 1) : (bar_39);
    assign bar_40_real = (bar_40[6]) ? (~bar_40 + 1) : (bar_40);
    assign bar_41_real = (bar_41[6]) ? (~bar_41 + 1) : (bar_41);
    assign bar_42_real = (bar_42[6]) ? (~bar_42 + 1) : (bar_42);
    assign bar_43_real = (bar_43[6]) ? (~bar_43 + 1) : (bar_43);
    assign bar_44_real = (bar_44[6]) ? (~bar_44 + 1) : (bar_44);
    assign bar_45_real = (bar_45[6]) ? (~bar_45 + 1) : (bar_45);
    assign bar_46_real = (bar_46[6]) ? (~bar_46 + 1) : (bar_46);
    assign bar_47_real = (bar_47[6]) ? (~bar_47 + 1) : (bar_47);
    assign bar_48_real = (bar_48[6]) ? (~bar_48 + 1) : (bar_48);
    assign bar_49_real = (bar_49[6]) ? (~bar_49 + 1) : (bar_49);
    assign bar_50_real = (bar_50[6]) ? (~bar_50 + 1) : (bar_50);
    assign bar_51_real = (bar_51[6]) ? (~bar_51 + 1) : (bar_51);
    assign bar_52_real = (bar_52[6]) ? (~bar_52 + 1) : (bar_52);
    assign bar_53_real = (bar_53[6]) ? (~bar_53 + 1) : (bar_53);
    assign bar_54_real = (bar_54[6]) ? (~bar_54 + 1) : (bar_54);
    assign bar_55_real = (bar_55[6]) ? (~bar_55 + 1) : (bar_55);
    assign bar_56_real = (bar_56[6]) ? (~bar_56 + 1) : (bar_56);
    assign bar_57_real = (bar_57[6]) ? (~bar_57 + 1) : (bar_57);
    assign bar_58_real = (bar_58[6]) ? (~bar_58 + 1) : (bar_58);
    assign bar_59_real = (bar_59[6]) ? (~bar_59 + 1) : (bar_59);
    assign bar_60_real = (bar_60[6]) ? (~bar_60 + 1) : (bar_60);
    assign bar_61_real = (bar_61[6]) ? (~bar_61 + 1) : (bar_61);
    assign bar_62_real = (bar_62[6]) ? (~bar_62 + 1) : (bar_62);
    assign bar_63_real = (bar_63[6]) ? (~bar_63 + 1) : (bar_63);
    assign bar_64_real = (bar_64[6]) ? (~bar_64 + 1) : (bar_64);
    assign bar_65_real = (bar_65[6]) ? (~bar_65 + 1) : (bar_65);
    assign bar_66_real = (bar_66[6]) ? (~bar_66 + 1) : (bar_66);
    assign bar_67_real = (bar_67[6]) ? (~bar_67 + 1) : (bar_67);
    assign bar_68_real = (bar_68[6]) ? (~bar_68 + 1) : (bar_68);
    assign bar_69_real = (bar_69[6]) ? (~bar_69 + 1) : (bar_69);
    assign bar_70_real = (bar_70[6]) ? (~bar_70 + 1) : (bar_70);
    assign bar_71_real = (bar_71[6]) ? (~bar_71 + 1) : (bar_71);
    assign bar_72_real = (bar_72[6]) ? (~bar_72 + 1) : (bar_72);
    assign bar_73_real = (bar_73[6]) ? (~bar_73 + 1) : (bar_73);
    assign bar_74_real = (bar_74[6]) ? (~bar_74 + 1) : (bar_74);
    assign bar_75_real = (bar_75[6]) ? (~bar_75 + 1) : (bar_75);
    assign bar_76_real = (bar_76[6]) ? (~bar_76 + 1) : (bar_76);
    assign bar_77_real = (bar_77[6]) ? (~bar_77 + 1) : (bar_77);
    assign bar_78_real = (bar_78[6]) ? (~bar_78 + 1) : (bar_78);
    assign bar_79_real = (bar_79[6]) ? (~bar_79 + 1) : (bar_79);
    assign bar_80_real = (bar_80[6]) ? (~bar_80 + 1) : (bar_80);
    assign bar_81_real = (bar_81[6]) ? (~bar_81 + 1) : (bar_81);
    assign bar_82_real = (bar_82[6]) ? (~bar_82 + 1) : (bar_82);
    assign bar_83_real = (bar_83[6]) ? (~bar_83 + 1) : (bar_83);
    assign bar_84_real = (bar_84[6]) ? (~bar_84 + 1) : (bar_84);
    assign bar_85_real = (bar_85[6]) ? (~bar_85 + 1) : (bar_85);
    assign bar_86_real = (bar_86[6]) ? (~bar_86 + 1) : (bar_86);
    assign bar_87_real = (bar_87[6]) ? (~bar_87 + 1) : (bar_87);
    assign bar_88_real = (bar_88[6]) ? (~bar_88 + 1) : (bar_88);
    assign bar_89_real = (bar_89[6]) ? (~bar_89 + 1) : (bar_89);
    assign bar_90_real = (bar_90[6]) ? (~bar_90 + 1) : (bar_90);
    assign bar_91_real = (bar_91[6]) ? (~bar_91 + 1) : (bar_91);
    assign bar_92_real = (bar_92[6]) ? (~bar_92 + 1) : (bar_92);
    assign bar_93_real = (bar_93[6]) ? (~bar_93 + 1) : (bar_93);
    assign bar_94_real = (bar_94[6]) ? (~bar_94 + 1) : (bar_94);
    assign bar_95_real = (bar_95[6]) ? (~bar_95 + 1) : (bar_95);
    assign bar_96_real = (bar_96[6]) ? (~bar_96 + 1) : (bar_96);
    assign bar_97_real = (bar_97[6]) ? (~bar_97 + 1) : (bar_97);
    assign bar_98_real = (bar_98[6]) ? (~bar_98 + 1) : (bar_98);
    assign bar_99_real = (bar_99[6]) ? (~bar_99 + 1) : (bar_99);
    assign bar_100_real = (bar_100[6]) ? (~bar_100 + 1) : (bar_100);
    assign bar_101_real = (bar_101[6]) ? (~bar_101 + 1) : (bar_101);
    assign bar_102_real = (bar_102[6]) ? (~bar_102 + 1) : (bar_102);
    assign bar_103_real = (bar_103[6]) ? (~bar_103 + 1) : (bar_103);
    assign bar_104_real = (bar_104[6]) ? (~bar_104 + 1) : (bar_104);
    assign bar_105_real = (bar_105[6]) ? (~bar_105 + 1) : (bar_105);
    assign bar_106_real = (bar_106[6]) ? (~bar_106 + 1) : (bar_106);
    assign bar_107_real = (bar_107[6]) ? (~bar_107 + 1) : (bar_107);
    assign bar_108_real = (bar_108[6]) ? (~bar_108 + 1) : (bar_108);
    assign bar_109_real = (bar_109[6]) ? (~bar_109 + 1) : (bar_109);
    assign bar_110_real = (bar_110[6]) ? (~bar_110 + 1) : (bar_110);
    assign bar_111_real = (bar_111[6]) ? (~bar_111 + 1) : (bar_111);
    assign bar_112_real = (bar_112[6]) ? (~bar_112 + 1) : (bar_112);
    assign bar_113_real = (bar_113[6]) ? (~bar_113 + 1) : (bar_113);
    assign bar_114_real = (bar_114[6]) ? (~bar_114 + 1) : (bar_114);
    assign bar_115_real = (bar_115[6]) ? (~bar_115 + 1) : (bar_115);
    assign bar_116_real = (bar_116[6]) ? (~bar_116 + 1) : (bar_116);
    assign bar_117_real = (bar_117[6]) ? (~bar_117 + 1) : (bar_117);
    assign bar_118_real = (bar_118[6]) ? (~bar_118 + 1) : (bar_118);
    assign bar_119_real = (bar_119[6]) ? (~bar_119 + 1) : (bar_119);
    assign bar_120_real = (bar_120[6]) ? (~bar_120 + 1) : (bar_120);
    assign bar_121_real = (bar_121[6]) ? (~bar_121 + 1) : (bar_121);
    assign bar_122_real = (bar_122[6]) ? (~bar_122 + 1) : (bar_122);
    assign bar_123_real = (bar_123[6]) ? (~bar_123 + 1) : (bar_123);
    assign bar_124_real = (bar_124[6]) ? (~bar_124 + 1) : (bar_124);
    assign bar_125_real = (bar_125[6]) ? (~bar_125 + 1) : (bar_125);
    assign bar_126_real = (bar_126[6]) ? (~bar_126 + 1) : (bar_126);
    assign bar_127_real = (bar_127[6]) ? (~bar_127 + 1) : (bar_127);
    
    assign bar_0_imag = (ibar_0[6]) ? (~ibar_0 + 1) : (ibar_0);
    assign bar_1_imag = (ibar_1[6]) ? (~ibar_1 + 1) : (ibar_1);
    assign bar_2_imag = (ibar_2[6]) ? (~ibar_2 + 1) : (ibar_2);
    assign bar_3_imag = (ibar_3[6]) ? (~ibar_3 + 1) : (ibar_3);
    assign bar_4_imag = (ibar_4[6]) ? (~ibar_4 + 1) : (ibar_4);
    assign bar_5_imag = (ibar_5[6]) ? (~ibar_5 + 1) : (ibar_5);
    assign bar_6_imag = (ibar_6[6]) ? (~ibar_6 + 1) : (ibar_6);
    assign bar_7_imag = (ibar_7[6]) ? (~ibar_7 + 1) : (ibar_7);
    assign bar_8_imag = (ibar_8[6]) ? (~ibar_8 + 1) : (ibar_8);
    assign bar_9_imag = (ibar_9[6]) ? (~ibar_9 + 1) : (ibar_9);
    assign bar_10_imag = (ibar_10[6]) ? (~ibar_10 + 1) : (ibar_10);
    assign bar_11_imag = (ibar_11[6]) ? (~ibar_11 + 1) : (ibar_11);
    assign bar_12_imag = (ibar_12[6]) ? (~ibar_12 + 1) : (ibar_12);
    assign bar_13_imag = (ibar_13[6]) ? (~ibar_13 + 1) : (ibar_13);
    assign bar_14_imag = (ibar_14[6]) ? (~ibar_14 + 1) : (ibar_14);
    assign bar_15_imag = (ibar_15[6]) ? (~ibar_15 + 1) : (ibar_15);
    assign bar_16_imag = (ibar_16[6]) ? (~ibar_16 + 1) : (ibar_16);
    assign bar_17_imag = (ibar_17[6]) ? (~ibar_17 + 1) : (ibar_17);
    assign bar_18_imag = (ibar_18[6]) ? (~ibar_18 + 1) : (ibar_18);
    assign bar_19_imag = (ibar_19[6]) ? (~ibar_19 + 1) : (ibar_19);
    assign bar_20_imag = (ibar_20[6]) ? (~ibar_20 + 1) : (ibar_20);
    assign bar_21_imag = (ibar_21[6]) ? (~ibar_21 + 1) : (ibar_21);
    assign bar_22_imag = (ibar_22[6]) ? (~ibar_22 + 1) : (ibar_22);
    assign bar_23_imag = (ibar_23[6]) ? (~ibar_23 + 1) : (ibar_23);
    assign bar_24_imag = (ibar_24[6]) ? (~ibar_24 + 1) : (ibar_24);
    assign bar_25_imag = (ibar_25[6]) ? (~ibar_25 + 1) : (ibar_25);
    assign bar_26_imag = (ibar_26[6]) ? (~ibar_26 + 1) : (ibar_26);
    assign bar_27_imag = (ibar_27[6]) ? (~ibar_27 + 1) : (ibar_27);
    assign bar_28_imag = (ibar_28[6]) ? (~ibar_28 + 1) : (ibar_28);
    assign bar_29_imag = (ibar_29[6]) ? (~ibar_29 + 1) : (ibar_29);
    assign bar_30_imag = (ibar_30[6]) ? (~ibar_30 + 1) : (ibar_30);
    assign bar_31_imag = (ibar_31[6]) ? (~ibar_31 + 1) : (ibar_31);
    assign bar_32_imag = (ibar_32[6]) ? (~ibar_32 + 1) : (ibar_32);
    assign bar_33_imag = (ibar_33[6]) ? (~ibar_33 + 1) : (ibar_33);
    assign bar_34_imag = (ibar_34[6]) ? (~ibar_34 + 1) : (ibar_34);
    assign bar_35_imag = (ibar_35[6]) ? (~ibar_35 + 1) : (ibar_35);
    assign bar_36_imag = (ibar_36[6]) ? (~ibar_36 + 1) : (ibar_36);
    assign bar_37_imag = (ibar_37[6]) ? (~ibar_37 + 1) : (ibar_37);
    assign bar_38_imag = (ibar_38[6]) ? (~ibar_38 + 1) : (ibar_38);
    assign bar_39_imag = (ibar_39[6]) ? (~ibar_39 + 1) : (ibar_39);
    assign bar_40_imag = (ibar_40[6]) ? (~ibar_40 + 1) : (ibar_40);
    assign bar_41_imag = (ibar_41[6]) ? (~ibar_41 + 1) : (ibar_41);
    assign bar_42_imag = (ibar_42[6]) ? (~ibar_42 + 1) : (ibar_42);
    assign bar_43_imag = (ibar_43[6]) ? (~ibar_43 + 1) : (ibar_43);
    assign bar_44_imag = (ibar_44[6]) ? (~ibar_44 + 1) : (ibar_44);
    assign bar_45_imag = (ibar_45[6]) ? (~ibar_45 + 1) : (ibar_45);
    assign bar_46_imag = (ibar_46[6]) ? (~ibar_46 + 1) : (ibar_46);
    assign bar_47_imag = (ibar_47[6]) ? (~ibar_47 + 1) : (ibar_47);
    assign bar_48_imag = (ibar_48[6]) ? (~ibar_48 + 1) : (ibar_48);
    assign bar_49_imag = (ibar_49[6]) ? (~ibar_49 + 1) : (ibar_49);
    assign bar_50_imag = (ibar_50[6]) ? (~ibar_50 + 1) : (ibar_50);
    assign bar_51_imag = (ibar_51[6]) ? (~ibar_51 + 1) : (ibar_51);
    assign bar_52_imag = (ibar_52[6]) ? (~ibar_52 + 1) : (ibar_52);
    assign bar_53_imag = (ibar_53[6]) ? (~ibar_53 + 1) : (ibar_53);
    assign bar_54_imag = (ibar_54[6]) ? (~ibar_54 + 1) : (ibar_54);
    assign bar_55_imag = (ibar_55[6]) ? (~ibar_55 + 1) : (ibar_55);
    assign bar_56_imag = (ibar_56[6]) ? (~ibar_56 + 1) : (ibar_56);
    assign bar_57_imag = (ibar_57[6]) ? (~ibar_57 + 1) : (ibar_57);
    assign bar_58_imag = (ibar_58[6]) ? (~ibar_58 + 1) : (ibar_58);
    assign bar_59_imag = (ibar_59[6]) ? (~ibar_59 + 1) : (ibar_59);
    assign bar_60_imag = (ibar_60[6]) ? (~ibar_60 + 1) : (ibar_60);
    assign bar_61_imag = (ibar_61[6]) ? (~ibar_61 + 1) : (ibar_61);
    assign bar_62_imag = (ibar_62[6]) ? (~ibar_62 + 1) : (ibar_62);
    assign bar_63_imag = (ibar_63[6]) ? (~ibar_63 + 1) : (ibar_63);
    assign bar_64_imag = (ibar_64[6]) ? (~ibar_64 + 1) : (ibar_64);
    assign bar_65_imag = (ibar_65[6]) ? (~ibar_65 + 1) : (ibar_65);
    assign bar_66_imag = (ibar_66[6]) ? (~ibar_66 + 1) : (ibar_66);
    assign bar_67_imag = (ibar_67[6]) ? (~ibar_67 + 1) : (ibar_67);
    assign bar_68_imag = (ibar_68[6]) ? (~ibar_68 + 1) : (ibar_68);
    assign bar_69_imag = (ibar_69[6]) ? (~ibar_69 + 1) : (ibar_69);
    assign bar_70_imag = (ibar_70[6]) ? (~ibar_70 + 1) : (ibar_70);
    assign bar_71_imag = (ibar_71[6]) ? (~ibar_71 + 1) : (ibar_71);
    assign bar_72_imag = (ibar_72[6]) ? (~ibar_72 + 1) : (ibar_72);
    assign bar_73_imag = (ibar_73[6]) ? (~ibar_73 + 1) : (ibar_73);
    assign bar_74_imag = (ibar_74[6]) ? (~ibar_74 + 1) : (ibar_74);
    assign bar_75_imag = (ibar_75[6]) ? (~ibar_75 + 1) : (ibar_75);
    assign bar_76_imag = (ibar_76[6]) ? (~ibar_76 + 1) : (ibar_76);
    assign bar_77_imag = (ibar_77[6]) ? (~ibar_77 + 1) : (ibar_77);
    assign bar_78_imag = (ibar_78[6]) ? (~ibar_78 + 1) : (ibar_78);
    assign bar_79_imag = (ibar_79[6]) ? (~ibar_79 + 1) : (ibar_79);
    assign bar_80_imag = (ibar_80[6]) ? (~ibar_80 + 1) : (ibar_80);
    assign bar_81_imag = (ibar_81[6]) ? (~ibar_81 + 1) : (ibar_81);
    assign bar_82_imag = (ibar_82[6]) ? (~ibar_82 + 1) : (ibar_82);
    assign bar_83_imag = (ibar_83[6]) ? (~ibar_83 + 1) : (ibar_83);
    assign bar_84_imag = (ibar_84[6]) ? (~ibar_84 + 1) : (ibar_84);
    assign bar_85_imag = (ibar_85[6]) ? (~ibar_85 + 1) : (ibar_85);
    assign bar_86_imag = (ibar_86[6]) ? (~ibar_86 + 1) : (ibar_86);
    assign bar_87_imag = (ibar_87[6]) ? (~ibar_87 + 1) : (ibar_87);
    assign bar_88_imag = (ibar_88[6]) ? (~ibar_88 + 1) : (ibar_88);
    assign bar_89_imag = (ibar_89[6]) ? (~ibar_89 + 1) : (ibar_89);
    assign bar_90_imag = (ibar_90[6]) ? (~ibar_90 + 1) : (ibar_90);
    assign bar_91_imag = (ibar_91[6]) ? (~ibar_91 + 1) : (ibar_91);
    assign bar_92_imag = (ibar_92[6]) ? (~ibar_92 + 1) : (ibar_92);
    assign bar_93_imag = (ibar_93[6]) ? (~ibar_93 + 1) : (ibar_93);
    assign bar_94_imag = (ibar_94[6]) ? (~ibar_94 + 1) : (ibar_94);
    assign bar_95_imag = (ibar_95[6]) ? (~ibar_95 + 1) : (ibar_95);
    assign bar_96_imag = (ibar_96[6]) ? (~ibar_96 + 1) : (ibar_96);
    assign bar_97_imag = (ibar_97[6]) ? (~ibar_97 + 1) : (ibar_97);
    assign bar_98_imag = (ibar_98[6]) ? (~ibar_98 + 1) : (ibar_98);
    assign bar_99_imag = (ibar_99[6]) ? (~ibar_99 + 1) : (ibar_99);
    assign bar_100_imag = (ibar_100[6]) ? (~ibar_100 + 1) : (ibar_100);
    assign bar_101_imag = (ibar_101[6]) ? (~ibar_101 + 1) : (ibar_101);
    assign bar_102_imag = (ibar_102[6]) ? (~ibar_102 + 1) : (ibar_102);
    assign bar_103_imag = (ibar_103[6]) ? (~ibar_103 + 1) : (ibar_103);
    assign bar_104_imag = (ibar_104[6]) ? (~ibar_104 + 1) : (ibar_104);
    assign bar_105_imag = (ibar_105[6]) ? (~ibar_105 + 1) : (ibar_105);
    assign bar_106_imag = (ibar_106[6]) ? (~ibar_106 + 1) : (ibar_106);
    assign bar_107_imag = (ibar_107[6]) ? (~ibar_107 + 1) : (ibar_107);
    assign bar_108_imag = (ibar_108[6]) ? (~ibar_108 + 1) : (ibar_108);
    assign bar_109_imag = (ibar_109[6]) ? (~ibar_109 + 1) : (ibar_109);
    assign bar_110_imag = (ibar_110[6]) ? (~ibar_110 + 1) : (ibar_110);
    assign bar_111_imag = (ibar_111[6]) ? (~ibar_111 + 1) : (ibar_111);
    assign bar_112_imag = (ibar_112[6]) ? (~ibar_112 + 1) : (ibar_112);
    assign bar_113_imag = (ibar_113[6]) ? (~ibar_113 + 1) : (ibar_113);
    assign bar_114_imag = (ibar_114[6]) ? (~ibar_114 + 1) : (ibar_114);
    assign bar_115_imag = (ibar_115[6]) ? (~ibar_115 + 1) : (ibar_115);
    assign bar_116_imag = (ibar_116[6]) ? (~ibar_116 + 1) : (ibar_116);
    assign bar_117_imag = (ibar_117[6]) ? (~ibar_117 + 1) : (ibar_117);
    assign bar_118_imag = (ibar_118[6]) ? (~ibar_118 + 1) : (ibar_118);
    assign bar_119_imag = (ibar_119[6]) ? (~ibar_119 + 1) : (ibar_119);
    assign bar_120_imag = (ibar_120[6]) ? (~ibar_120 + 1) : (ibar_120);
    assign bar_121_imag = (ibar_121[6]) ? (~ibar_121 + 1) : (ibar_121);
    assign bar_122_imag = (ibar_122[6]) ? (~ibar_122 + 1) : (ibar_122);
    assign bar_123_imag = (ibar_123[6]) ? (~ibar_123 + 1) : (ibar_123);
    assign bar_124_imag = (ibar_124[6]) ? (~ibar_124 + 1) : (ibar_124);
    assign bar_125_imag = (ibar_125[6]) ? (~ibar_125 + 1) : (ibar_125);
    assign bar_126_imag = (ibar_126[6]) ? (~ibar_126 + 1) : (ibar_126);
    assign bar_127_imag = (ibar_127[6]) ? (~ibar_127 + 1) : (ibar_127);
    
endmodule
