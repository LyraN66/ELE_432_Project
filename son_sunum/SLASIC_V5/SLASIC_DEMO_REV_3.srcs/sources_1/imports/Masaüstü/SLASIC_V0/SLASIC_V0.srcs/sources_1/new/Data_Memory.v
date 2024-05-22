module Data_Memory_1#(parameter width = 32)(
    input clk,
    input rst_i,
    // core signals
    input [width-1:0] alu_result,   // Address
    input [width-1:0] wd_data,      // Write Data  
    input write_enable,             // Write Enable
//    output enable,
    output [width-1:0] rd,          // Read Data
    
    // dmc signals
    input [width-1:0] data_dmc,
    input [7:0] address_dmc,
    input write_dmc,
    
    input read_mlp,
    input [7:0] address_mlp,
    output [31:0] data_mlp,
    
    // Special Registers
    input  dmc_done_bit,
    input  [3:0] mlp_result_bits,
    
    input mlp_ready_bit,
    input mlp_busy_bit,
    output [15:0] data_sensor,
    
    output dmc_start_bit,
    output dmc_real_time_bit,
    input dmc_start_switch
    );
    
    reg [width-1:0] data_memory [0:13];
    
    assign data_sensor = data_memory[1][31:16];
    assign dmc_start_bit = data_memory[0][0];
    assign dmc_real_time_bit = data_memory[0][1];
      
    
    integer i;
    initial begin
        for (i = 0; i < 14; i = i + 1) begin
            data_memory[i] = 32'b0;
        end
    end
    wire [7:0] index_value = alu_result[7:0];
    
    assign rd = (!write_enable) ? (data_memory[index_value]) : (32'b0);
    assign data_mlp = (read_mlp) ? (data_memory[address_mlp]) : (32'b0);
    
    always @(posedge clk) begin
        if(rst_i)begin
            data_memory[0] <= 32'h00000002;
            data_memory[10] <= 32'h80000000;
            data_memory[11] <= 32'h00000002;
            data_memory[12] <= 32'h00000001;
            data_memory[13] <= 32'hFFFFFFFE;
        end
        else begin
            if (write_enable) begin 
                data_memory[index_value] <= wd_data;
            end
            
            if (write_dmc) begin
                data_memory[address_dmc] <= data_dmc;
            end
            
            data_memory[0][2] <= dmc_done_bit;
            data_memory[0][3] <= mlp_busy_bit;
            data_memory[0][4] <= mlp_ready_bit;
            data_memory[0][8:5] <= mlp_result_bits;
            data_memory[0][31] <= dmc_start_switch;
            
        end
    end
endmodule
