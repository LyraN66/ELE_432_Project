module Single_Cycle_RISCV32I #(parameter width = 32) (
	input  clk       ,
	input  rst_i     ,

	output scl_master,
	inout  sda_master,
	
	input [1:0] select_seven,
	input [11:0] switch_seven,
    output [7:0] AN_X_Display,  // AN_7 = AN_X[7]
    output [7:0] CX_Display,     // CA = CX[7]
	
	input  scl_slave,
	inout  sda_slave,
	input  dmc_start_switch,
    output mlp_ready_o,
    output [3:0] led,
	output esp_rst
);
    
    wire slow_clk;
	wire [ 3:0] mlp_result                  ;
    assign led[3:0] = mlp_result;
    
    wire [31:0] data_seven;
    
    
    wire [3:0] result_bouncer;
    Debouncer Debouncer_Module(
        . clk(slow_clk),
        . rst(rst),
        . mlp_valid(mlp_valid),
        . mlp_result(mlp_result),
        . result_bouncer(result_bouncer)
    );


	lcd_driver LCD_MODULE (
		.clk      (clk       ),
		.rst      (rst_i     ),
		.start_lcd(lcd_start ),
		.selective(result_bouncer),
		
		.scl      (scl_master),
		.sda      (sda_master)
	);

    Seven_Segment_Display_Final_Manual Seven_Segment(
        . clk(slow_clk),
        . pos_0(data_seven[3:0]),
        . pos_1(data_seven[7:4]),
        . pos_2(data_seven[11:8]),
        . pos_3(data_seven[15:12]),
        . pos_4(data_seven[19:16]),
        . pos_5(data_seven[23:20]),
        . pos_6(data_seven[27:24]),
        . pos_7(data_seven[31:28]),
        . AN_X_Display(AN_X_Display),  // AN_7 = AN_X[7]
        . CX_Display(CX_Display)     // CA = CX[7]
    );
    
    Divided_Clock Div_Clk(
        . clk(clk),
        . rst(rst),
        . div_clk(slow_clk)
    );
	wire           mlp_ready                   ;
    wire  [1:0]    state_out;
    assign mlp_ready_o = mlp_ready;
    
	wire [width-1:0] alu_result_mem_wb_wire        ;
	wire [width-1:0] rd_mem_wb_wire                ;
	wire [      4:0] rd_addr_mem_wb_wb_wire        ;
	wire [width-1:0] pc_plus_4_mem_wb_wire         ;
	wire [width-1:0] pc_target_mem_wb_wire         ;
	wire [width-1:0] immediate_extended_mem_wb_wire;
	// Control Unit
	wire       Reg_Write_mem_wb_wire;
	wire [2:0] ResultSrc_mem_wb_wire;

	wire [width-1:0] alu_result_ex_mem_wire        ;
	wire [width-1:0] rs2_ex_mem_wire               ;
	wire [      4:0] rd_addr_ex_mem_wire           ;
	wire [width-1:0] pc_plus_4_ex_mem_wire         ;
	wire [width-1:0] pc_target_ex_mem_wire         ;
	wire [width-1:0] immediate_extended_ex_mem_wire;
	// Control Unit
	wire       Reg_Write_ex_mem_wire;
	wire [2:0] ResultSrc_ex_mem_wire;
	wire       Mem_Write_ex_mem_wire;
	// ALU
	wire busy_alu_top ;
	wire valid_alu_top;
	
	wire [width-1:0] rs1_id_ex_wire               ;
	wire [width-1:0] rs2_id_ex_wire               ;
	wire [width-1:0] pc_id_ex_wire                ;
	wire [      4:0] rd_addr_id_ex_wire           ;
	wire [width-1:0] immediate_extended_id_ex_wire;
	wire [width-1:0] pc_plus_4_id_ex_wire         ;

	// Control Unit
	wire       Reg_Write_id_ex_wire  ;
	wire [2:0] ResultSrc_id_ex_wire  ;
	wire       Mem_Write_id_ex_wire  ;
	wire       Jump_id_ex_wire       ;
	wire       Branch_id_ex_wire     ;
	wire [4:0] Alu_Control_id_ex_wire;
	wire       AluSrc_id_ex_wire     ;
	wire [4:0] rs1_addr_ex_wire      ;
	wire [4:0] rs2_addr_ex_wire      ;
	wire       jalr_ctrl_top_wire    ;


	wire [20:0] immediate_top;
	wire [ 6:0] funct7_top   ;
	wire [ 4:0] rs2_addr_top ;
	wire [ 4:0] rs1_addr_top ;
	wire [ 4:0] rd_addr_top  ;
	wire lcd_start;


	wire        mlp_start                   ;
	wire        mlp_busy                    ;
	wire        mlp_valid                   ;
	wire [31:0] sensor_data_register_address;
	wire [31:0] mlp_data                    ;

	wire       i2c_slave_enable  ;
	wire       i2c_slave_write   ;
	wire       i2c_slave_read    ;
	wire [7:0] i2c_slave_index   ;
	wire [7:0] i2c_slave_data_out;
	wire [7:0] i2c_slave_data_in ;
	wire       i2c_slave_busy    ;
	wire       i2c_slave_valid   ;
	
	wire        bl_done     ;
	wire        bl_mlp_start;
	wire        bl_mlp_load ;
	wire [31:0] bl_mlp_data ;

	wire        dmc_start      ;
	wire        dmc_real_time  ;
	wire        dmc_done       ;
	wire [31:0] dm_data        ;
	wire [7:0] dm_address     ;
	wire        dm_read_enable ;
	wire        dm_write_enable;


	wire [width-1:0] rd_top;
    
    wire read_mlp_top;
    wire [7:0] address_mlp_top;
    wire [31:0] data_mlp_top;

	assign mlp_data  = (bl_done) ? dm_data : bl_mlp_data;

	bootloader BOOTLOADER (
		.clk        (slow_clk              ),
		.rst        (rst_i            ),
		.done       (bl_done          ),
		.i2c_valid  (i2c_slave_valid  ),
		.i2c_data_in(i2c_slave_data_out),
	    .i2c_index(i2c_slave_index),
		.start      (bl_mlp_start     ),
		.load       (bl_mlp_load      ),
		.mlp_valid  (mlp_valid        ),
		.mlp_data   (bl_mlp_data      )
	);
	
	wire [3:0] number_first_layer_wire; 
	decision_making_controller DECISION_MAKING_CONTROLLER (
		.clk            (slow_clk               ),
		.rst            (rst_i             ),
		
		//.i2c_busy       (i2c_slave_busy    ),
		.i2c_valid      (i2c_slave_valid   ),
		.i2c_index      (i2c_slave_index   ),
		.i2c_data_in    (i2c_slave_data_out),
		//.i2c_data_out   (i2c_slave_data_in ),
		
		.mlp_start      (mlp_start         ),
		.mlp_busy       (mlp_busy          ),
		.mlp_valid      (mlp_valid         ),
		.mlp_ready      (mlp_ready         ),
	    .number_first_layer(number_first_layer_wire),
		
		.lcd_start      (lcd_start         ),
		
		.dm_data        (dm_data           ),
		.dm_address     (dm_address        ),
		//.dm_read_enable (dm_read_enable    ),
		.dm_write_enable(dm_write_enable   ),
//	   . i2c_started_o(lcd_start_o),
		
		.start          (dmc_start_switch         ),
		.real_time      (dmc_real_time     ),
		.done           (dmc_done          ),
		.state_out      (state_out),
		.esp_rst        (esp_rst)
	);
	
	I2C_Slave #(.debounce(3)) I2C_SLAVE_MODULE (
		.clk       (slow_clk               ),
		.rst       (rst_i             ),
		
		// I2C Ports
		.scl       (scl_slave         ), // input
		.sda       (sda_slave         ), // inout
		.sda_enable(i2c_slave_enable  ), // output
		
		// RAM control signals
		.write     (i2c_slave_write   ), // output
		.read_1    (i2c_slave_read    ), // output
		.index_1   (i2c_slave_index   ), // output [7:0]
		.data_out  (i2c_slave_data_out), // output [7:0]
		.data_in   (i2c_slave_data_in ), // input [7:0]
		
		// Control signals
		.busy      (i2c_slave_busy    ), // output
		.valid     (i2c_slave_valid   )  // output
	);
	
	wire [7:0] last_data_wire;
	wire [7:0] first_data_wire;
	Neural_Network MLP_MODULE (
		.clk             (slow_clk                    ),
		.rst             (rst_i                       ),
		.start           (mlp_start                   ),
		.busy            (mlp_busy                    ),
		.valid           (mlp_valid                   ),
		.load_start      (bl_mlp_start                ),
		.load_valid      (bl_mlp_load                 ),
		.load_done       (bl_done                     ),
		.memory_ready    (mlp_ready                   ),
	    .number_first_layer(number_first_layer_wire),
	    .read(read_mlp_top)            ,
		.data_req_address(sensor_data_register_address),
		.data            (mlp_data                    ),
        // Seven debug
        . select_seven(select_seven),
        . switch_seven(switch_seven),
        . data_seven(data_seven),
        
	    .data_mem(data_mlp_top)        ,
		.decsion_result  (mlp_result                  )
	);
	
	wire [15:0] data_sensor_wire;
	Data_Memory_1 DATA_MEMORY (
		.clk              (slow_clk                   ),
		.rst_i            (rst_i                 ),
		.alu_result       (alu_result_ex_mem_wire), // @TODO: "sensor_data_register_address" if "mlp_busy"
		.wd_data          (rs2_ex_mem_wire       ),
		.write_enable     (Mem_Write_ex_mem_wire ),
		.rd               (rd_top                ),
		
		// Decision Making Controller Access Pins
		.data_dmc             (dm_data               ),
		.address_dmc          (dm_address            ),
		.write_dmc            (dm_write_enable       ),
        . read_mlp(read_mlp_top),
        . address_mlp(sensor_data_register_address[7:0]),
        . data_mlp(data_mlp_top),
        . data_sensor(data_sensor_wire),
		
		// Special Registers & Bits
		.dmc_done_bit     (dmc_done              ),   // handle this one
		.mlp_result_bits  (result_bouncer            ),   // handle this one
        . mlp_ready_bit(mlp_ready),
        . mlp_busy_bit(mlp_busy),
		.dmc_start_bit    (dmc_start             ),   // handle this one
		.dmc_real_time_bit(dmc_real_time         ),   // handle this one
		.dmc_start_switch(dmc_start_switch)
	);


	wire [2:0] ResultSrc_top  ;
	wire       Mem_Write_top  ;
	wire [4:0] Alu_Control_top;
	wire       AluSrc_top     ;
	wire [2:0] ImmSrc_top     ;
	wire       jalr_ctrl_top  ;
	wire       Reg_Write_top  ;
	wire [2:0] funct3_top     ;
//    wire PCSrc_top;
	wire [width-1:0] F_o_top       ;
	wire [      6:0] op_top        ;
	wire [width-1:0] output_mux_top;
	wire             ins_branch_top;
	wire             ins_jump_top  ;


	wire [1:0] Forward_A_wire;
	wire [1:0] Forward_B_wire;
	/////////////////

	wire Stall_pc_wire ;
	wire Stall_if_wire ;
	wire Stall_id_wire ;
	wire Stall_ex_wire ;
	wire Stall_mem_wire;
	wire Flush_id_wire ;
	wire Flush_if_wire ;
	Hazard_Unit_1 Hazard_Unit(
		//Forwarding Unit
		. i_rs1_addr_id_ex_out(rs1_addr_ex_wire),
		. i_rs2_addr_id_ex_out(rs2_addr_ex_wire),
		. i_rd_addr_ex_mem_out(rd_addr_ex_mem_wire),
		. i_i_rd_addr_mem_wb_out(rd_addr_mem_wb_wb_wire),
		. i_RegWrite_ex_mem_out(Reg_Write_ex_mem_wire),
		. RegWrite_mem_wb_out(Reg_Write_mem_wb_wire),

		. Forward_A(Forward_A_wire),
		. Forward_B(Forward_B_wire),
		/////////////////
		// lw stall
		. rs1_addr_if_id_out(rs1_addr_top),
		. rs2_addr_if_id_out(rs2_addr_top),
		. rd_addr_id_ex_out(rd_addr_id_ex_wire),
		. ResultSrc_id_ex_out(ResultSrc_id_ex_wire),
		. pc_Stall(Stall_pc_wire),
		. if_Stall(Stall_if_wire),
		. id_Flush(Flush_id_wire),
		/////////////////
		// branch
		. PCSrc_hzd(((F_o_top[0] & Branch_id_ex_wire)|Jump_id_ex_wire)),
		. Flush_if(Flush_if_wire),
		/////////////////
		. busy_alu(busy_alu_top),
		. valid_alu(valid_alu_top),
		. id_Stall(Stall_id_wire),
		. ex_Stall(Stall_ex_wire),
		. mem_Stall(Stall_mem_wire)
	);

	Control_Unit_1 Control_Unit (
		.op            (op_top         ),
		.funct3        (funct3_top     ),
		.funct7_5      (funct7_top     ), //ok
		.comparison_out(F_o_top[0]     ), //ok
		
		//        . PCSrc(PCSrc_top),//ok
		.ResultSrc     (ResultSrc_top  ), //ok
		.Mem_Write     (Mem_Write_top  ), //ok
		.Alu_Control   (Alu_Control_top), //ok
		.AluSrc        (AluSrc_top     ), //ok
		.ImmSrc        (ImmSrc_top     ), //ok
		.jalr_ctrl     (jalr_ctrl_top  ), //ok
		.Reg_Write     (Reg_Write_top  ), //ok
		.ins_branch    (ins_branch_top ), //ok
		.ins_jump      (ins_jump_top   )  //ok
	);

	wire [width-1:0] pc_top                ;
	wire [width-1:0] immediate_extended_top;
	wire [width-1:0] pc_target_top         ;
	wire [width-1:0] pc_plus_4_top         ;
	PC_Counter_1 PC_Counter (
		.clk  (slow_clk          ), //ok
		.rst_i(rst_i        ), //ok
		.stall(Stall_pc_wire),
		.Pc_Next((!((F_o_top[0] & Branch_id_ex_wire)|Jump_id_ex_wire)) ? (pc_plus_4_top) :
		       ((!jalr_ctrl_top_wire ) ? (pc_target_top) : (F_o_top))), //ok
		.pc   (pc_top       )  //ok
	);

	pc_plus_4_1 pc_plus_4 (
		.i_pc     (pc_top       ), //ok
		.pc_plus_4(pc_plus_4_top)  //ok
	);

	wire [width-1:0] instruction_top;
	Instruction_Memory_1 Instruction_Memory (
		.address    (pc_top         ), //ok
		.instruction(instruction_top)  //ok
	);

	wire [width-1:0] instruction_if_id_wire;
	wire [width-1:0] pc_if_id_wire         ;
	wire [width-1:0] pc_plus_4_if_id_wire  ;
	Fetch_Stage_1 Fetch_Stage (
		.clk                  (slow_clk                   ),
		.rst                  (rst_i                 ),
		.stall_if             (Stall_if_wire         ), // stall ba?la
		.flush_if             (Flush_if_wire         ), // flush ba?la
		.inst_if              (instruction_top       ), //ok
		.pc_if                (pc_top                ), //ok
		.pc_plus_4_if         (pc_plus_4_top         ), //ok
		
		.instruction_if_id    (instruction_if_id_wire), //ok
		.programc_if_id       (pc_if_id_wire         ), //ok
		.programc_plus_4_if_id(pc_plus_4_if_id_wire  )  //ok
	);
	
	Instruction_Decoder_1 Instruction_Decoder (
		.instruction(instruction_if_id_wire), // ok
		.immediate  (immediate_top         ), //ok
		.funct7     (funct7_top            ), //ok
		.rs2_addr   (rs2_addr_top          ), //ok
		.rs1_addr   (rs1_addr_top          ), //ok
		.funct3     (funct3_top            ), //ok
		.rd_addr    (rd_addr_top           ), //ok
		.op         (op_top                )  //ok
	);

	wire [width-1:0] rs1_data_output_top;
	wire [width-1:0] rs2_data_output_top;
	Register_File_1 Register_File (
		.clk             (slow_clk                   ), //ok
		.rst_i           (rst_i                 ), //ok
		.write_enable    (Reg_Write_mem_wb_wire ), //ok
		.rs1_addr        (rs1_addr_top          ), //ok
		.rs2_addr        (rs2_addr_top          ), //ok
		.rd_addr         (rd_addr_mem_wb_wb_wire), //ok
		.inst_branch     (ins_branch_top        ),
		.write_data_input(output_mux_top        ),
		.rs1_data_output (rs1_data_output_top   ), //ok
		.rs2_data_output (rs2_data_output_top   )  //ok
	);
	Decode_Stage_1 Decode_Stage (
		.clk                     (slow_clk                          ),
		.rst                     (rst_i                        ),
		.stall_id                (Stall_id_wire                ), //ok                                                       // stall ba?la
		.flush_id                (Flush_id_wire                ), // flush ba?la
		//
		.i_rs1_id                (rs1_data_output_top          ), //ok
		.i_rs2_id                (rs2_data_output_top          ), //ok
		.i_pc_id                 (pc_if_id_wire                ), //ok
		.i_rs1_addr_id           (rs1_addr_top                 ), //ok
		.i_rs2_addr_id           (rs2_addr_top                 ), //ok
		.i_rd_addr_id            (rd_addr_top                  ), //ok
		.i_immediate_extended_id (immediate_extended_top       ), //ok
		.i_pc_plus_4_id          (pc_plus_4_if_id_wire         ), //ok
		
		// Control Unit
		.i_Reg_Write_id          (Reg_Write_top                ), //ok
		.i_ResultSrc_id          (ResultSrc_top                ), //ok
		.i_Mem_Write_id          (Mem_Write_top                ), //ok
		.i_Jump_id               (ins_jump_top                 ), //ok
		.i_Branch_id             (ins_branch_top               ), //ok
		.i_Alu_Control_id        (Alu_Control_top              ), //ok
		.i_AluSrc_id             (AluSrc_top                   ), //ok
		.i_jalr_top_id           (jalr_ctrl_top                ),
		//
		.rs1_id_ex               (rs1_id_ex_wire               ), //ok
		.rs2_id_ex               (rs2_id_ex_wire               ), //ok
		.pc_id_ex                (pc_id_ex_wire                ), //ok
		.rs1_addr_ex             (rs1_addr_ex_wire             ), //ok
		.rs2_addr_ex             (rs2_addr_ex_wire             ), //ok
		.rd_addr_id_ex           (rd_addr_id_ex_wire           ), //ok
		.immediate_extended_id_ex(immediate_extended_id_ex_wire), //ok
		.pc_plus_4_id_ex         (pc_plus_4_id_ex_wire         ), //ok
		
		// Control Unit
		.Reg_Write_id_ex         (Reg_Write_id_ex_wire         ), //ok
		.ResultSrc_id_ex         (ResultSrc_id_ex_wire         ), //ok
		.Mem_Write_id_ex         (Mem_Write_id_ex_wire         ), //ok
		.Jump_id_ex              (Jump_id_ex_wire              ), //ok
		.Branch_id_ex            (Branch_id_ex_wire            ), //ok
		.Alu_Control_id_ex       (Alu_Control_id_ex_wire       ), //ok
		.AluSrc_id_ex            (AluSrc_id_ex_wire            ), //ok
		.jalr_top_id_ex          (jalr_ctrl_top_wire           )
	);

	pc_imm_adder_1 pc_imm_adder (
		.i_pc  (pc_id_ex_wire                ), //ok
		.imm   (immediate_extended_id_ex_wire), //ok
		.pc_imm(pc_target_top                )  //ok
	);
	ALU_1 ALU (
		.clk      (slow_clk                                                                                                                                                                            ),
		.rst      (rst_i                                                                                                                                                                          ),
		.A_i      ((Forward_A_wire==2'b10) ? (alu_result_ex_mem_wire) : ((Forward_A_wire==2'b01) ? (output_mux_top) : (rs1_id_ex_wire))                                                           ), //ok
		.B_i      ((!AluSrc_id_ex_wire) ? ((Forward_B_wire==2'b10) ? (alu_result_ex_mem_wire) : ((Forward_B_wire==2'b01) ? (output_mux_top) : (rs2_id_ex_wire))) : (immediate_extended_id_ex_wire)), //ok
		.op       (Alu_Control_id_ex_wire                                                                                                                                                         ), //ok
		.busy_alu (busy_alu_top                                                                                                                                                                   ), //ok
		.valid_alu(valid_alu_top                                                                                                                                                                  ), //ok
		.F_o      (F_o_top                                                                                                                                                                        )  //ok
	);

	Extend_1 Extend (
		.ins_immediate     (immediate_top         ), //ok
		.ImmSrc            (ImmSrc_top            ), //ok
		.immediate_extended(immediate_extended_top)  //ok
	);

	Execute_Stage_1 Execute_Stage (
		.clk                      (slow_clk                                                                                                                   ),
		.rst                      (rst_i                                                                                                                 ),
		.stall_ex                 (Stall_ex_wire                                                                                                         ), //ok // hazarddan ba?la
		.flush_ex                 (1'b0                                                                                                                  ), // hazarddan ba?la
		//
		.i_alu_result_ex          (F_o_top                                                                                                               ), //ok
		.i_rs2_ex                 (((Forward_B_wire==2'b10) ? (alu_result_ex_mem_wire) : ((Forward_B_wire==2'b01) ? (output_mux_top) : (rs2_id_ex_wire)))), //ok
		.i_rd_addr_ex             (rd_addr_id_ex_wire                                                                                                    ), //ok
		.i_pc_plus_4_ex           (pc_plus_4_id_ex_wire                                                                                                  ), //ok
		.i_pc_target_ex           (pc_target_top                                                                                                         ), //ok
		.i_immediate_extended_ex  (immediate_extended_id_ex_wire                                                                                         ), //ok
		// Control Unit
		.i_Reg_Write_ex           (Reg_Write_id_ex_wire                                                                                                  ), //ok
		.i_ResultSrc_ex           (ResultSrc_id_ex_wire                                                                                                  ), //ok
		.i_Mem_Write_ex           (Mem_Write_id_ex_wire                                                                                                  ), //ok
		//
		.alu_result_ex_mem        (alu_result_ex_mem_wire                                                                                                ), //ok
		.rs2_ex_mem               (rs2_ex_mem_wire                                                                                                       ), //ok
		.rd_addr_ex_mem           (rd_addr_ex_mem_wire                                                                                                   ), //ok
		.pc_plus_4_ex_mem         (pc_plus_4_ex_mem_wire                                                                                                 ), //ok
		.pc_target_ex_mem         (pc_target_ex_mem_wire                                                                                                 ), //ok
		.immediate_extended_ex_mem(immediate_extended_ex_mem_wire                                                                                        ), //ok
		// Control Unit
		.Reg_Write_ex_mem         (Reg_Write_ex_mem_wire                                                                                                 ), //ok
		.ResultSrc_ex_mem         (ResultSrc_ex_mem_wire                                                                                                 ), //ok
		.Mem_Write_ex_mem         (Mem_Write_ex_mem_wire                                                                                                 )  //ok
	);

	Memory_Access_Stage_1 Memory_Access_Stage (
		.clk                      (slow_clk                           ),
		.rst                      (rst_i                         ),
		.stall_mem                (Stall_mem_wire                ), //ok                                                              // hazarddan gelecek
		.flush_mem                (1'b0                          ), // hazarddan gelecek
		//
		.i_alu_result_mem         (alu_result_ex_mem_wire        ), //ok
		.i_rd_mem                 (rd_top                        ), //ok
		.i_rd_addr_mem            (rd_addr_ex_mem_wire           ), //ok
		.i_pc_plus_4_mem          (pc_plus_4_ex_mem_wire         ), //ok
		.i_pc_target_mem          (pc_target_ex_mem_wire         ), //ok
		.i_immediate_extended_mem (immediate_extended_ex_mem_wire), //ok
		// Control Unit
		.i_Reg_Write_mem          (Reg_Write_ex_mem_wire         ), //ok
		.i_ResultSrc_mem          (ResultSrc_ex_mem_wire         ), //ok
		//
		.alu_result_mem_wb        (alu_result_mem_wb_wire        ), //ok
		.rd_mem_wb                (rd_mem_wb_wire                ), //ok
		.rd_addr_mem_wb_wb        (rd_addr_mem_wb_wb_wire        ), //ok
		.pc_plus_4_mem_wb         (pc_plus_4_mem_wb_wire         ), //ok
		.pc_target_mem_wb         (pc_target_mem_wb_wire         ), //ok
		.immediate_extended_mem_wb(immediate_extended_mem_wb_wire), //ok
		// Control Unit
		.Reg_Write_mem_wb         (Reg_Write_mem_wb_wire         ),
		.ResultSrc_mem_wb         (ResultSrc_mem_wb_wire         )
	);

	Mux_2 Mux_2_1 (
		.ResultSrc      (ResultSrc_mem_wb_wire         ), //ok
		.alu_result_mux (alu_result_mem_wb_wire        ), //ok
		.data_memory_mux(rd_mem_wb_wire                ), //ok
		.i_pc_plus4_mux (pc_plus_4_mem_wb_wire         ), //ok
		.ext_imm_mux    (immediate_extended_mem_wb_wire), //ok
		.pc_target2_mux (pc_target_mem_wb_wire         ), //ok
		.output_mux     (output_mux_top                )  //ok
	);

endmodule
