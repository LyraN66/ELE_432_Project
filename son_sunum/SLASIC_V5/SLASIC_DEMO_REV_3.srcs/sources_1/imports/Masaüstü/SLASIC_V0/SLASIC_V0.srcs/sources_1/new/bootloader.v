module bootloader (
	input             clk        ,
	input             rst        ,
	input             i2c_valid  ,
	input      [7:0]  i2c_data_in,
	input      [7:0]  i2c_index,
	input             mlp_valid  , // dont know this
	output reg        done       ,
	output reg        start      ,
	output reg        load       , // this indicates to load data into memory
	output reg [31:0] mlp_data     // related data to be written into memory
);

	// FSM States
	parameter IDLE  = 0   ;
	parameter PULL  = 1   ;
	parameter PUSH  = 2   ;
	parameter DONE_S  = 3   ;
	
	reg [1:0] STATE;
	reg [31:0] temp_data;
	reg [2:0] byte_counter;
	reg i2c_valid_reg;

	always @(posedge clk) begin
		if (rst) begin
			start <= 0;
			load  <= 0;
            done <= 1'b0;
            mlp_data <= 32'b0;
			STATE <= IDLE;
			temp_data <= 32'b0; 
			byte_counter <= 3'b0;
			i2c_valid_reg <= 1'b0;
		end
		else begin
		
            if ((i2c_valid || i2c_valid_reg) && (i2c_index == 8'h40)) begin
                if (i2c_valid)begin
                    i2c_valid_reg <= 1'b1;
                end
                else if(!i2c_valid )begin
                    byte_counter <= byte_counter + 1;
                    i2c_valid_reg <= 1'b0;
                    case (byte_counter)
                        0 : temp_data[7:0]   <= i2c_data_in;
                        1 : temp_data[15:8]  <= i2c_data_in;
                        2 : temp_data[23:16] <= i2c_data_in;
                        3 : temp_data[31:24] <= i2c_data_in;
                    endcase
                end
            end
            
			case (STATE)
				IDLE : begin
				    done <= 1'b0;
				    load <= 1'b0;
					if (byte_counter == 3'd4) begin
						byte_counter <= 3'd0;
						if (temp_data == 32'h7FFFFFFF) begin
							start <= 1'b1;
							STATE <= PULL;
						end
					end
				end

				PULL : begin
					start <= 0;
					if (byte_counter == 3'd4) begin
						byte_counter <= 3'd0;
						if (temp_data == 32'hFFFFFFFF) begin
							STATE <= DONE_S;
						end
						else begin
							mlp_data <= temp_data;
							load     <= 1'b1;
							STATE    <= PUSH;
						end
					end
				end

				PUSH : begin
					load <= 1'b0;
				    STATE <= PULL;
//					if (mlp_valid) begin
//						STATE <= PULL;
//					end
				end

				DONE_S : begin
					done     <= 1'b1;
					mlp_data <= 32'b0;
				end
			endcase
		end
	end
endmodule
