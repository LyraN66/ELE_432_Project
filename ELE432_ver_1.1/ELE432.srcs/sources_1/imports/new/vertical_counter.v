module vertical_counter(
    input clk,
    input rst,
    input enable_V,
    output reg [15:0] v_counter
    );
    
    always @(posedge clk) begin
        if(rst)begin
            v_counter <= 16'b0;
        end
        else begin
            if (enable_V)begin
                if (v_counter < 524)begin
                    v_counter <= v_counter + 1;
                end
                else begin
                    v_counter <= 16'b0;
                end
            end
        end
    end
endmodule
