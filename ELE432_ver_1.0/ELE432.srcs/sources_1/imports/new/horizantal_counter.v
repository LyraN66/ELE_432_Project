module horizantal_counter(
    input clk,
    input rst,
    output reg enable_V,
    output reg [15:0] h_counter
    );
    
    always @(posedge clk) begin
        if(rst)begin
            enable_V <= 1'b0;
            h_counter <= 16'b0;
        end
        else begin
            if (h_counter < 799)begin
                h_counter <= h_counter + 1;
                enable_V <= 1'b0;
            end
            else begin
                enable_V <= 1'b1;
                h_counter <= 16'b0;
            end
        end
    end
endmodule
