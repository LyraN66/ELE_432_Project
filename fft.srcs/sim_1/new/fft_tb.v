
module fft_tb();

reg clk,rst,start;
reg [15:0] realpart, imagpart;
wire signed [21:0] freq_realpart;
wire [21:0] freq_imagpart;

wire valid,busy;

wire [21:0]  bar_0, bar_1, bar_2, bar_3, bar_4, bar_5, bar_6, bar_7, bar_8, bar_9, bar_10, bar_11, bar_12, bar_13, bar_14, bar_15, bar_16, bar_17, bar_18, bar_19, bar_20, bar_21, bar_22, bar_23, bar_24, bar_25, bar_26, bar_27, bar_28, bar_29, bar_30,
bar_31, bar_32, bar_33, bar_34, bar_35, bar_36, bar_37, bar_38, bar_39, bar_40, bar_41, bar_42, bar_43, bar_44, bar_45, bar_46, bar_47, bar_48, bar_49, bar_50, bar_51, bar_52, bar_53, bar_54, bar_55, bar_56, bar_57, bar_58, bar_59, bar_60, bar_61, bar_62, bar_63,
bar_64, bar_65, bar_66, bar_67, bar_68, bar_69, bar_70, bar_71, bar_72, bar_73, bar_74, bar_75, bar_76, bar_77, bar_78, bar_79, bar_80, bar_81, bar_82, bar_83, bar_84, bar_85, bar_86, bar_87, bar_88, bar_89, bar_90, bar_91, bar_92, bar_93, bar_94, bar_95, bar_96,
bar_97, bar_98, bar_99, bar_100, bar_101, bar_102, bar_103, bar_104, bar_105, bar_106, bar_107, bar_108, bar_109, bar_110, bar_111, bar_112, bar_113, bar_114, bar_115, bar_116, bar_117, bar_118, bar_119, bar_120, bar_121, bar_122, bar_123, bar_124, bar_125, bar_126, bar_127;
    
wire [21:0] ibar_0, ibar_1, ibar_2, ibar_3, ibar_4, ibar_5, ibar_6, ibar_7, ibar_8, ibar_9, ibar_10, ibar_11, ibar_12, ibar_13, ibar_14, ibar_15, ibar_16, ibar_17, ibar_18, ibar_19, ibar_20, ibar_21, ibar_22, ibar_23, ibar_24, ibar_25, ibar_26, ibar_27, ibar_28, ibar_29, ibar_30,
ibar_31, ibar_32, ibar_33, ibar_34, ibar_35, ibar_36, ibar_37, ibar_38, ibar_39, ibar_40, ibar_41, ibar_42, ibar_43, ibar_44, ibar_45, ibar_46, ibar_47, ibar_48, ibar_49, ibar_50, ibar_51, ibar_52, ibar_53, ibar_54, ibar_55, ibar_56, ibar_57, ibar_58, ibar_59, ibar_60, ibar_61, ibar_62, ibar_63,
ibar_64, ibar_65, ibar_66, ibar_67, ibar_68, ibar_69, ibar_70, ibar_71, ibar_72, ibar_73, ibar_74, ibar_75, ibar_76, ibar_77, ibar_78, ibar_79, ibar_80, ibar_81, ibar_82, ibar_83, ibar_84, ibar_85, ibar_86, ibar_87, ibar_88, ibar_89, ibar_90, ibar_91, ibar_92, ibar_93, ibar_94, ibar_95, ibar_96,
ibar_97, ibar_98, ibar_99, ibar_100, ibar_101, ibar_102, ibar_103, ibar_104, ibar_105, ibar_106, ibar_107, ibar_108, ibar_109, ibar_110, ibar_111, ibar_112, ibar_113, ibar_114, ibar_115, ibar_116, ibar_117, ibar_118, ibar_119, ibar_120, ibar_121, ibar_122, ibar_123, ibar_124, ibar_125, ibar_126, ibar_127;


fft dut(
    clk,
    rst,
    start,
    realpart,
    imagpart,
    busy,
    valid,
    bar_0, bar_1, bar_2, bar_3, bar_4, bar_5, bar_6, bar_7, bar_8, bar_9, bar_10, bar_11, bar_12, bar_13, bar_14, bar_15, bar_16, bar_17, bar_18, bar_19, bar_20, bar_21, bar_22, bar_23, bar_24, bar_25, bar_26, bar_27, bar_28, bar_29, bar_30,
bar_31, bar_32, bar_33, bar_34, bar_35, bar_36, bar_37, bar_38, bar_39, bar_40, bar_41, bar_42, bar_43, bar_44, bar_45, bar_46, bar_47, bar_48, bar_49, bar_50, bar_51, bar_52, bar_53, bar_54, bar_55, bar_56, bar_57, bar_58, bar_59, bar_60, bar_61, bar_62, bar_63,
bar_64, bar_65, bar_66, bar_67, bar_68, bar_69, bar_70, bar_71, bar_72, bar_73, bar_74, bar_75, bar_76, bar_77, bar_78, bar_79, bar_80, bar_81, bar_82, bar_83, bar_84, bar_85, bar_86, bar_87, bar_88, bar_89, bar_90, bar_91, bar_92, bar_93, bar_94, bar_95, bar_96,
bar_97, bar_98, bar_99, bar_100, bar_101, bar_102, bar_103, bar_104, bar_105, bar_106, bar_107, bar_108, bar_109, bar_110, bar_111, bar_112, bar_113, bar_114, bar_115, bar_116, bar_117, bar_118, bar_119, bar_120, bar_121, bar_122, bar_123, bar_124, bar_125, bar_126, bar_127,
    
   ibar_0, ibar_1, ibar_2, ibar_3, ibar_4, ibar_5, ibar_6, ibar_7, ibar_8, ibar_9, ibar_10, ibar_11, ibar_12, ibar_13, ibar_14, ibar_15, ibar_16, ibar_17, ibar_18, ibar_19, ibar_20, ibar_21, ibar_22, ibar_23, ibar_24, ibar_25, ibar_26, ibar_27, ibar_28, ibar_29, ibar_30,
ibar_31, ibar_32, ibar_33, ibar_34, ibar_35, ibar_36, ibar_37, ibar_38, ibar_39, ibar_40, ibar_41, ibar_42, ibar_43, ibar_44, ibar_45, ibar_46, ibar_47, ibar_48, ibar_49, ibar_50, ibar_51, ibar_52, ibar_53, ibar_54, ibar_55, ibar_56, ibar_57, ibar_58, ibar_59, ibar_60, ibar_61, ibar_62, ibar_63,
ibar_64, ibar_65, ibar_66, ibar_67, ibar_68, ibar_69, ibar_70, ibar_71, ibar_72, ibar_73, ibar_74, ibar_75, ibar_76, ibar_77, ibar_78, ibar_79, ibar_80, ibar_81, ibar_82, ibar_83, ibar_84, ibar_85, ibar_86, ibar_87, ibar_88, ibar_89, ibar_90, ibar_91, ibar_92, ibar_93, ibar_94, ibar_95, ibar_96,
ibar_97, ibar_98, ibar_99, ibar_100, ibar_101, ibar_102, ibar_103, ibar_104, ibar_105, ibar_106, ibar_107, ibar_108, ibar_109, ibar_110, ibar_111, ibar_112, ibar_113, ibar_114, ibar_115, ibar_116, ibar_117, ibar_118, ibar_119, ibar_120, ibar_121, ibar_122, ibar_123, ibar_124, ibar_125, ibar_126, ibar_127
);

always #5 clk = ~clk ;

integer i=0;

initial begin
clk=0;
#10;
rst=1;
#20;
rst=0;
#10
start=1;
#10
start=0;

    repeat(256) begin
         if(i<124) begin
            realpart=16'd10000 ; 
         end
         else begin
            realpart=0;
         end
         imagpart = 0;
         #10;
         i=i+1;
    end
    wait(valid);
end
endmodule 

