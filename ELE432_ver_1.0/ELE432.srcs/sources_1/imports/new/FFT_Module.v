module FFT_Module(
    input clk,
    input rst,
    input start,
    input [15:0] realpart,
    input [15:0] imagpart,
    
    output reg busy, valid,
    output reg [6:0] bar_0, bar_1, bar_2, bar_3, bar_4, bar_5, bar_6, bar_7,
    output reg [6:0] bar_8, bar_9, bar_10, bar_11, bar_12, bar_13, bar_14, bar_15,
    output reg [6:0] bar_16, bar_17, bar_18, bar_19, bar_20, bar_21, bar_22, bar_23,
    output reg [6:0] bar_24, bar_25, bar_26, bar_27, bar_28, bar_29, bar_30, bar_31,
    output reg [6:0] bar_32, bar_33, bar_34, bar_35, bar_36, bar_37, bar_38, bar_39,
    output reg [6:0] bar_40, bar_41, bar_42, bar_43, bar_44, bar_45, bar_46, bar_47,
    output reg [6:0] bar_48, bar_49, bar_50, bar_51, bar_52, bar_53, bar_54, bar_55,
    output reg [6:0] bar_56, bar_57, bar_58, bar_59, bar_60, bar_61, bar_62, bar_63
    );
endmodule
