module Debouncer(
    input clk,
    input rst,
    input mlp_valid,
    input [3:0] mlp_result,
    output reg [3:0] result_bouncer
    );
    
    reg [19:0] mlp_result_shift_reg; 
    
    always @(posedge clk)begin
        if (rst)begin
            mlp_result_shift_reg <= 20'hFFFFF;
            result_bouncer <= 4'b1111;
        end
        else begin
            if (mlp_valid)begin
                mlp_result_shift_reg <= {mlp_result_shift_reg[15:0],mlp_result};
                
                if (mlp_result_shift_reg == 20'h00000 || mlp_result_shift_reg == 20'h11111 || mlp_result_shift_reg == 20'h22222 || mlp_result_shift_reg == 20'h33333 || 
                    mlp_result_shift_reg == 20'h44444 || mlp_result_shift_reg == 20'h55555 || mlp_result_shift_reg == 20'h66666 || mlp_result_shift_reg == 20'h77777 || 
                    mlp_result_shift_reg == 20'h88888 || mlp_result_shift_reg == 20'h99999 || mlp_result_shift_reg == 20'hAAAAA || mlp_result_shift_reg == 20'hBBBBB || 
                    mlp_result_shift_reg == 20'hCCCCC || mlp_result_shift_reg == 20'hDDDDD || mlp_result_shift_reg == 20'hEEEEE ) begin
                    
                    result_bouncer <= mlp_result_shift_reg[3:0];
                end 
                else begin
                    result_bouncer <= 4'b1111;
                end
            end
        end
    end
endmodule
