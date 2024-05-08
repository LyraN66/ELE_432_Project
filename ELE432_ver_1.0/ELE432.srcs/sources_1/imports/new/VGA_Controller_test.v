module VGA_Controller_test(
    input clk,
    input rst,
    output H_sync,
    output V_sync,
//    input [6:0] switch,
    // Bar Heights 
//    input start,
//    input [6:0] bar_0, bar_1, bar_2, bar_3, bar_4, bar_5, bar_6, bar_7,
//    input [6:0] bar_8, bar_9, bar_10, bar_11, bar_12, bar_13, bar_14, bar_15,
//    input [6:0] bar_16, bar_17, bar_18, bar_19, bar_20, bar_21, bar_22, bar_23,
//    input [6:0] bar_24, bar_25, bar_26, bar_27, bar_28, bar_29, bar_30, bar_31,
//    input [6:0] bar_32, bar_33, bar_34, bar_35, bar_36, bar_37, bar_38, bar_39,
//    input [6:0] bar_40, bar_41, bar_42, bar_43, bar_44, bar_45, bar_46, bar_47,
//    input [6:0] bar_48, bar_49, bar_50, bar_51, bar_52, bar_53, bar_54, bar_55,
//    input [6:0] bar_56, bar_57, bar_58, bar_59, bar_60, bar_61, bar_62, bar_63,
    //
//    output reg busy,
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue
    );
    
//    reg [6:0] bar_0_reg, bar_1_reg, bar_2_reg, bar_3_reg, bar_4_reg, bar_5_reg, bar_6_reg, bar_7_reg;
//    reg [6:0] bar_8_reg, bar_9_reg, bar_10_reg, bar_11_reg, bar_12_reg, bar_13_reg, bar_14_reg, bar_15_reg;
//    reg [6:0] bar_16_reg, bar_17_reg, bar_18_reg, bar_19_reg, bar_20_reg, bar_21_reg, bar_22_reg, bar_23_reg;
//    reg [6:0] bar_24_reg, bar_25_reg, bar_26_reg, bar_27_reg, bar_28_reg, bar_29_reg, bar_30_reg, bar_31_reg;
//    reg [6:0] bar_32_reg, bar_33_reg, bar_34_reg, bar_35_reg, bar_36_reg, bar_37_reg, bar_38_reg, bar_39_reg;
//    reg [6:0] bar_40_reg, bar_41_reg, bar_42_reg, bar_43_reg, bar_44_reg, bar_45_reg, bar_46_reg, bar_47_reg;
//    reg [6:0] bar_48_reg, bar_49_reg, bar_50_reg, bar_51_reg, bar_52_reg, bar_53_reg, bar_54_reg, bar_55_reg;
//    reg [6:0] bar_56_reg, bar_57_reg, bar_58_reg, bar_59_reg, bar_60_reg, bar_61_reg, bar_62_reg, bar_63_reg;
    reg ready;
    
    wire slow_clk;
    Divided_Clock Div_Clk(
        . clk(clk),
        . rst(rst),
        . div_clk(slow_clk)
    );
    
    wire enable_V_top;
    wire [15:0] h_counter_top;
    horizantal_counter horizantal(
        . clk(slow_clk),
        . rst(rst),
        . enable_V(enable_V_top),
        . h_counter(h_counter_top)
    );
    
    wire [15:0] v_counter_top;
    vertical_counter vertical(
        . clk(slow_clk),
        . rst(rst),
        . enable_V(enable_V_top),
        . v_counter(v_counter_top)
    );
    
    wire [3:0] remainder = h_counter_top % 5;
    wire [15:0] v_counter_wire = v_counter_top - 360;
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
    
    always @(posedge slow_clk)begin 
        if(rst)begin
            Red <= Black; Green <= Black; Blue <= Black;
//            font_counter <= 32'b0;
            ready <= 1'b0;
        end
        else begin
            ////////////////////////////////////////////////////////////////////
            //  Capture hight of the bars 
            ////////////////////////////////////////////////////////////////////
            if (h_counter_top == 799 && v_counter_top == 524) begin
                ready <= 1'b0;
//                busy <= 1'b0;
            end
            else begin
//                busy <= 1'b1;
            end
//            if (start && !ready) begin 
//                bar_0_reg  <= bar_0; bar_1_reg   <= bar_1; bar_2_reg   <= bar_2;  bar_3_reg  <= bar_3;  bar_4_reg  <= bar_4;  bar_5_reg  <= bar_5;  bar_6_reg  <= bar_6;  bar_7_reg  <= bar_7;
//                bar_8_reg  <= bar_8; bar_9_reg   <= bar_9; bar_10_reg  <= bar_10; bar_11_reg <= bar_11; bar_12_reg <= bar_12; bar_13_reg <= bar_13; bar_14_reg <= bar_14; bar_15_reg <= bar_15;
//                bar_16_reg <= bar_16; bar_17_reg <= bar_17; bar_18_reg <= bar_18; bar_19_reg <= bar_19; bar_20_reg <= bar_20; bar_21_reg <= bar_21; bar_22_reg <= bar_22; bar_23_reg <= bar_23;
//                bar_24_reg <= bar_24; bar_25_reg <= bar_25; bar_26_reg <= bar_26; bar_27_reg <= bar_27; bar_28_reg <= bar_28; bar_29_reg <= bar_29; bar_30_reg <= bar_30; bar_31_reg <= bar_31;
//                bar_32_reg <= bar_32; bar_33_reg <= bar_33; bar_34_reg <= bar_34; bar_35_reg <= bar_35; bar_36_reg <= bar_36; bar_37_reg <= bar_37; bar_38_reg <= bar_38; bar_39_reg <= bar_39;
//                bar_40_reg <= bar_40; bar_41_reg <= bar_41; bar_42_reg <= bar_42; bar_43_reg <= bar_43; bar_44_reg <= bar_44; bar_45_reg <= bar_45; bar_46_reg <= bar_46; bar_47_reg <= bar_47;
//                bar_48_reg <= bar_48; bar_49_reg <= bar_49; bar_50_reg <= bar_50; bar_51_reg <= bar_51; bar_52_reg <= bar_52; bar_53_reg <= bar_53; bar_54_reg <= bar_54; bar_55_reg <= bar_55;
//                bar_56_reg <= bar_56; bar_57_reg <= bar_57; bar_58_reg <= bar_58; bar_59_reg <= bar_59; bar_60_reg <= bar_60; bar_61_reg <= bar_61; bar_62_reg <= bar_62; bar_63_reg <= bar_63;
//                ready <= 1'b1;              
//            end
//            else 
            if (h_counter_top < 784 && h_counter_top > 143 && v_counter_top < 515 && v_counter_top > 34)begin
                ////////////////////////////////////////////////////////////////////
                //  Draw bars by using input values , bars width are 3 pixel
                ////////////////////////////////////////////////////////////////////
                if ((v_counter_top < 460 && v_counter_top > 360))begin
                    if ((remainder == 1) || (remainder == 2) || (remainder == 3))begin // inside of bar colours
                        Red <= White; Green <= White; Blue <= White;
                    end
                    else if (remainder == 4 || remainder == 0)begin
                        Red <= White; Green <= Black; Blue <= Black;
                    end
//                    case (h_counter_top)
//                        321, 322, 323: assign_bars(bar_0_reg); 326, 327, 328: assign_bars(bar_1_reg); 331, 332, 333: assign_bars(bar_2_reg); 336, 337, 338: assign_bars(bar_3_reg);
//                        341, 342, 343: assign_bars(bar_4_reg); 346, 347, 348: assign_bars(bar_5_reg); 351, 352, 353: assign_bars(bar_6_reg); 356, 357, 358: assign_bars(bar_7_reg);
//                        361, 362, 363: assign_bars(bar_8_reg); 366, 367, 368: assign_bars(bar_9_reg); 371, 372, 373: assign_bars(bar_10_reg); 376, 377, 378: assign_bars(bar_11_reg);
//                        381, 382, 383: assign_bars(bar_12_reg); 386, 387, 388: assign_bars(bar_13_reg); 391, 392, 393: assign_bars(bar_14_reg); 396, 397, 398: assign_bars(bar_15_reg);
//                        401, 402, 403: assign_bars(bar_16_reg); 406, 407, 408: assign_bars(bar_17_reg); 411, 412, 413: assign_bars(bar_18_reg); 416, 417, 418: assign_bars(bar_19_reg);
//                        421, 422, 423: assign_bars(bar_20_reg); 426, 427, 428: assign_bars(bar_21_reg); 431, 432, 433: assign_bars(bar_22_reg); 436, 437, 438: assign_bars(bar_23_reg);
//                        441, 442, 443: assign_bars(bar_24_reg); 446, 447, 448: assign_bars(bar_25_reg); 451, 452, 453: assign_bars(bar_26_reg); 456, 457, 458: assign_bars(bar_27_reg);
//                        461, 462, 463: assign_bars(bar_28_reg); 466, 467, 468: assign_bars(bar_29_reg); 471, 472, 473: assign_bars(bar_30_reg); 476, 477, 478: assign_bars(bar_31_reg);
//                        481, 482, 483: assign_bars(bar_32_reg); 486, 487, 488: assign_bars(bar_33_reg); 491, 492, 493: assign_bars(bar_34_reg); 496, 497, 498: assign_bars(bar_35_reg);
//                        501, 502, 503: assign_bars(bar_36_reg); 506, 507, 508: assign_bars(bar_37_reg); 511, 512, 513: assign_bars(bar_38_reg); 516, 517, 518: assign_bars(bar_39_reg);
//                        521, 522, 523: assign_bars(bar_40_reg); 526, 527, 528: assign_bars(bar_41_reg); 531, 532, 533: assign_bars(bar_42_reg); 536, 537, 538: assign_bars(bar_43_reg);
//                        541, 542, 543: assign_bars(bar_44_reg); 546, 547, 548: assign_bars(bar_45_reg); 551, 552, 553: assign_bars(bar_46_reg); 556, 557, 558: assign_bars(bar_47_reg);
//                        561, 562, 563: assign_bars(bar_48_reg); 566, 567, 568: assign_bars(bar_49_reg); 571, 572, 573: assign_bars(bar_50_reg); 576, 577, 578: assign_bars(bar_51_reg);
//                        581, 582, 583: assign_bars(bar_52_reg); 586, 587, 588: assign_bars(bar_53_reg); 591, 592, 593: assign_bars(bar_54_reg); 596, 597, 598: assign_bars(bar_55_reg);
//                        601, 602, 603: assign_bars(bar_56_reg); 606, 607, 608: assign_bars(bar_57_reg); 611, 612, 613: assign_bars(bar_58_reg); 616, 617, 618: assign_bars(bar_59_reg);
//                        621, 622, 623: assign_bars(bar_60_reg); 626, 627, 628: assign_bars(bar_61_reg); 631, 632, 633: assign_bars(bar_62_reg); 636, 637, 638: assign_bars(bar_63_reg);           
//                    endcase
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
            Red     <= (v_counter_wire >= bar_reg) ? Mix : White;
            Green   <= (v_counter_wire >= bar_reg) ? Mix : White;
            Blue    <= (v_counter_wire >= bar_reg) ? White : White;
        end
    endtask
    
endmodule