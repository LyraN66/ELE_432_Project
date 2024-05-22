module decision_making_controller (
	input             clk            ,
	input             rst            ,
	// I2C Module Connections
	//input             i2c_busy       ,
	input             i2c_valid      ,
	input      [ 7:0] i2c_index      ,
	input      [ 7:0] i2c_data_in    ,
	//output reg [ 7:0] i2c_data_out   ,
	// MLP Module Connections
	output reg        mlp_start      ,
	input             mlp_busy       ,
	input             mlp_valid      ,
	input             mlp_ready      ,
	input [3:0] number_first_layer,
	// LCD Module Connections
	output reg        lcd_start      ,
	// Data Memory Connections
	output     [31:0] dm_data        , // inout      [31:0] dm_data        ,
	output reg [7:0] dm_address     ,
	//output reg        dm_read_enable ,
	output reg        dm_write_enable,
	// Control Signals
	input             start          ,
	input             real_time      ,
	output reg        done           ,
	
	// esp reset
	output  [1:0] state_out ,
    output reg      esp_rst
);
	parameter I2C_CTRL_VAL = 8'h02;

	parameter SENSOR_DATA_0_REGISTER_ADDRESS_OFFSET = 8'h01;
	parameter SENSOR_DATA_1_REGISTER_ADDRESS_OFFSET = 8'h02;
	parameter SENSOR_DATA_2_REGISTER_ADDRESS_OFFSET = 8'h03;
	parameter SENSOR_DATA_3_REGISTER_ADDRESS_OFFSET = 8'h04;
	parameter SENSOR_DATA_4_REGISTER_ADDRESS_OFFSET = 8'h05;
	parameter SENSOR_DATA_5_REGISTER_ADDRESS_OFFSET = 8'h06;
	parameter SENSOR_DATA_6_REGISTER_ADDRESS_OFFSET = 8'h07;
	parameter SENSOR_DATA_7_REGISTER_ADDRESS_OFFSET = 8'h08;
	parameter SENSOR_DATA_8_REGISTER_ADDRESS_OFFSET = 8'h09;

	reg [1:0] STATE       ;
	assign state_out = STATE ;
	parameter IDLE  = 2'd0;
	parameter GET   = 2'd1;
	parameter RUN   = 2'd2;
	parameter SET   = 2'd3;

	reg        i2c_started      ;
	reg [ 3:0] i2c_data_counter ;
	reg [ 2:0] i2c_word_counter ;
	reg [31:0] i2c_sensor_data  ;
    reg        valid_flag,valid2_flag       ;
    reg i2c_valid_reg;
	assign dm_data = i2c_sensor_data;

	always @(posedge clk) begin
		if (rst) begin
			STATE            <= IDLE;
            valid_flag       <= 0   ;
            valid2_flag      <= 0   ;
			i2c_valid_reg <= 1'b0;
			done <= 0;
			//dm_read_enable <= 0;
			dm_write_enable <= 0;

			i2c_started      <= 0;
			i2c_data_counter <= 4'd0;
			i2c_word_counter <= 3'd0;
			i2c_sensor_data  <= 32'h00000000;
			//i2c_data_out <= 8'b0;
			mlp_start <= 1'b0;
			lcd_start <= 1'b0;
			dm_address <= 8'b0;
			esp_rst <= 1'b0;
		end
		else begin
		    esp_rst <= 1'b1;
			case (STATE)
				IDLE : begin
					done <= 0;
					//dm_read_enable <= 0;
					dm_write_enable <= 0;
					i2c_started <= 1'b0;
					if (start && mlp_ready) begin
						if (real_time) begin  // collect data i guess
							STATE <= GET;
						end
						else begin            // then start mlp
							mlp_start <= 1;
							STATE     <= RUN;
						end
					end
				end

				GET : begin
					   
						if ((i2c_valid || i2c_valid_reg) && !i2c_started) begin
                            if (i2c_valid)begin
                                i2c_valid_reg <= 1'b1;
                            end
                            else if(!i2c_valid && !i2c_started)begin
                                i2c_valid_reg <= 1'b0;
                                if ((i2c_data_in  == I2C_CTRL_VAL) && (i2c_index == 8'h42)) begin  // like a conditional start signal
                                    i2c_started <= 1;
                                end
                            end
						end
						
						if (i2c_started) begin
							if (i2c_valid || i2c_valid_reg) begin
                                if (i2c_valid)begin
                                    i2c_valid_reg <= 1'b1;
                                end
                                else if(!i2c_valid)begin
                                    i2c_word_counter <= i2c_word_counter + 1;// might be problem
                                    i2c_valid_reg <= 1'b0;
                                    case (i2c_word_counter)
                                        3'd3 : begin
                                            i2c_sensor_data[31:24] <= i2c_data_in;
                                        end
                                        3'd2 : begin
                                            i2c_sensor_data[23:16] <= i2c_data_in;
                                        end
                                        3'd1 : begin
                                            i2c_sensor_data[15:8] <= i2c_data_in;
                                        end
                                        3'd0 : begin
                                            i2c_sensor_data[7:0] <= i2c_data_in;
                                        end
                                        default : begin
                                            i2c_sensor_data <= i2c_sensor_data;  //i2c_sensor_data <= 32'h00000000;
                                        end
                                    endcase
                                end
							end
							if (i2c_word_counter == 3'd4) begin
								i2c_word_counter <= 3'd0;
								i2c_data_counter <= i2c_data_counter + 1;

								dm_write_enable <= 1;

								case (i2c_data_counter)
									4'd0 : begin
										dm_address <= {SENSOR_DATA_0_REGISTER_ADDRESS_OFFSET};
									end
									4'd1 : begin
										dm_address <= {SENSOR_DATA_1_REGISTER_ADDRESS_OFFSET};
									end
									4'd2 : begin
										dm_address <= {SENSOR_DATA_2_REGISTER_ADDRESS_OFFSET};
									end
									4'd3 : begin
										dm_address <= {SENSOR_DATA_3_REGISTER_ADDRESS_OFFSET};
									end
									4'd4 : begin
										dm_address <= {SENSOR_DATA_4_REGISTER_ADDRESS_OFFSET};
									end
									4'd5 : begin
										dm_address <= {SENSOR_DATA_5_REGISTER_ADDRESS_OFFSET};
									end
									4'd6 : begin
										dm_address <= {SENSOR_DATA_6_REGISTER_ADDRESS_OFFSET};
									end
									4'd7 : begin
										dm_address <= {SENSOR_DATA_7_REGISTER_ADDRESS_OFFSET};
									end
									4'd8 : begin
										dm_address <= {SENSOR_DATA_8_REGISTER_ADDRESS_OFFSET};
									end
									default : begin
										dm_address <= dm_address;   // dm_address <= 32'h00000000;
									end
								endcase
							end
							else begin
								dm_write_enable <= 0;
							end
							if (i2c_data_counter == number_first_layer+1) begin
								i2c_word_counter <= 3'd0;
								i2c_data_counter <= 4'd0;
						        mlp_start <= 1;
								STATE            <= RUN;
							end
						end
					//end
				end

				RUN : begin
					if (mlp_busy) begin
						mlp_start <= 0;
					end
					if (mlp_valid) begin
						lcd_start <= 1;
						STATE     <= SET;
					end
				end

				SET : begin
					lcd_start <= 0;
					i2c_started <= 1'b0;
					if (start && real_time) begin
						STATE <= GET;
					end
					else begin
						done <= 1;
						STATE <= IDLE;
					end
				end
			endcase
		end
	end

endmodule
