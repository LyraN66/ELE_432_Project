// Displays anything on the 7 segment display :)
// shortest one

module Seven_Segment_Display_Final_Manual(
    input clk,
    input [3:0] pos_0,
    input [3:0] pos_1,
    input [3:0] pos_2,
    input [3:0] pos_3,
    input [3:0] pos_4,
    input [3:0] pos_5,
    input [3:0] pos_6,
    input [3:0] pos_7,
    output reg [7:0] AN_X_Display,  // AN_7 = AN_X[7]
    output reg [7:0] CX_Display     // CA = CX[7]
    );
    
    reg [7:0] text [0:7];
    reg [7:0] integer_values [0:15];
    
    reg [19:0 ] counter;
    reg clk_updated;
    reg [7:0] digit;  // decide the location on display
    reg [7:0] value;  // decides the value which will be written
    
    // FSM regs 
    reg [3:0] state = 3'b000;
    reg [3:0] AN_0=3'b000;
    reg [3:0] AN_1=3'b001;
    reg [3:0] AN_2=3'b010;
    reg [3:0] AN_3=3'b011;
    reg [3:0] AN_4=3'b100;
    reg [3:0] AN_5=3'b101;
    reg [3:0] AN_6=3'b110;
    reg [3:0] AN_7=3'b111;
       
    initial begin
        counter <= 20'b0;
        clk_updated <= 1'b0;
        digit <= 8'b11111110;
        AN_X_Display <= 8'b11111111;
        value <= 8'b11111111;
        state <= 3'b001;
        integer_values[0] <= 8'b00000011;    // 0
        integer_values[1] <= 8'b10011111;    // 1 
        integer_values[2] <= 8'b00100101;    // 2
        integer_values[3] <= 8'b00001101;    // 3
        integer_values[4] <= 8'b10011001;    // 4
        integer_values[5] <= 8'b01001001;    // 5
        integer_values[6] <= 8'b01000001;    // 6
        integer_values[7] <= 8'b00011111;    // 7
        integer_values[8] <= 8'b00000001;    // 8
        integer_values[9] <= 8'b00011001;    // 9
        integer_values[10] <= 8'b00010001;   // A
        integer_values[11] <= 8'b11000001;   // b
        integer_values[12] <= 8'b01100011;   // C
        integer_values[13] <= 8'b10000101;   // d
        integer_values[14] <= 8'b01100001;   // E
        integer_values[15] <= 8'b01110001;   // F
        
        text[0] <= 8'b0;        
        text[1] <= 8'b0;        
        text[2] <= 8'b0;        
        text[3] <= 8'b0;        
        text[4] <= 8'b0;        
        text[5] <= 8'b0;        
        text[6] <= 8'b0;        
        text[7] <= 8'b0;
    end
    
    always @(posedge clk) begin
        if (counter == 0) begin
          clk_updated <= ~clk_updated;
          counter <= 12500;
        end
        else begin
          counter <= counter - 1;
        end
    end
    
    always @(posedge clk_updated) begin
        CX_Display <= value;
        AN_X_Display <= digit;
        
        text[0] <= integer_values[pos_0];        
        text[1] <= integer_values[pos_1];        
        text[2] <= integer_values[pos_2];        
        text[3] <= integer_values[pos_3];        
        text[4] <= integer_values[pos_4];        
        text[5] <= integer_values[pos_5];        
        text[6] <= integer_values[pos_6];        
        text[7] <= integer_values[pos_7];
        
//        text[0] <= 8'hff;        
//        text[1] <= 8'b01100011;        
//        text[2] <= 8'b11110011;        
//        text[3] <= 8'b01001001;        
//        text[4] <= 8'b00010001;        
//        text[5] <= 8'b11100011;        
//        text[6] <= 8'b01001001;        
//        text[7] <= 8'hff;
        
        if(clk_updated) begin
                digit <= (state==0) ? digit : digit - 2**(state-1);
                value <= text[state];
                if(state==8)begin
                    state <= 3'b000;
                    digit <= 8'b11111110;
                end
                else begin
                    state <=  state + 1;
                end
        end
    end
endmodule