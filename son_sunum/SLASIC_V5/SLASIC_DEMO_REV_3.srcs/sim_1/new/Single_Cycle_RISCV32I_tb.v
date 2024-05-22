`timescale 1ns / 1ps
module Single_Cycle_RISCV32I_tb();


	reg  clk_tb;
	reg  rst_i_tb;

	wire  scl_master_tb;
	wire  sda_master_tb;
	
	reg  scl_slave_tb;
	wire  sda_slave_tb;
	reg  dmc_start_switch_tb;
	wire esp_rst_tb;
	
	Single_Cycle_RISCV32I DUT(
	.  clk(clk_tb)       ,
	.  rst_i(rst_i_tb)     ,

	.  scl_master(scl_master_tb),
	.  sda_master(sda_master_tb),
	
	.  scl_slave(scl_slave_tb) ,
	.  sda_slave(sda_slave_tb),
	.  dmc_start_switch(dmc_start_switch_tb),
	.  esp_rst(esp_rst_tb)
    );
    
    reg sda_slave_tb_reg;
    integer i, j, k;
    reg [7:0] address_list[0:4] ;
    reg [7:0] data_value;
    
    reg [27:0] i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz,    8'h33, 1'bz,    1'b1};
    assign sda_slave_tb = sda_slave_tb_reg;
    
    always begin
        #5 clk_tb = ~clk_tb;
    end
    
    initial begin
        clk_tb = 1'b0;
        rst_i_tb = 1'b0;
        scl_slave_tb = 1'b0;
        sda_slave_tb_reg = 1'b0;
        dmc_start_switch_tb = 1'b0;
        #10;
        rst_i_tb = 1'b1;
        #10;
        rst_i_tb = 1'b0;
        #100;
        dmc_start_switch_tb = 1'b1;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h02, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
        
        for (i = 0 ; i<9; i = i+1) begin
        
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h40, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h40, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
        end
        
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'hFF, 1'bz,    1'b1};
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'hFF, 1'bz,    1'b1};
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'hFF, 1'bz,    1'b1};
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h7F, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        // start sent
        ///////////////////////////////////////////////////////////////////////////////////
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h07, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h0a, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h0a, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h09, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        // # of layers given
        /////////////////////////////////////////////
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h04, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h01, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        // #weights given
        //////////////////////////////////////////
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h1B, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        // #bias given
        //////////////////////////////////////////
        
        for (i = 0 ; i<260;i = i+1) begin
        
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h80, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h3f, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
        end
        
        for (i = 0 ; i<27; i = i+1) begin
        
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'h40, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
        end
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'hFF, 1'bz,    1'b1};
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'hFF, 1'bz,    1'b1};
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'hFF, 1'bz,    1'b1};
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        
        i2c_data = {7'h72, 1'b0, 1'bz, 8'h40,  1'bz, 8'hFF, 1'bz,    1'b1};     
        sda_slave_tb_reg = 1'b0;
        scl_slave_tb = 1'b1;
        #600;
        scl_slave_tb = 1'b0;
        #650;
        sda_slave_tb_reg = i2c_data[27];
        #650;
        for (j = 0; j < 27; j = j + 1) begin
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[26-j];
            #650;
        end
        scl_slave_tb = 1'b1;
        sda_slave_tb_reg = 1'b1;
        #10000;
        // stop sent
        ///////////////////////////////////////////////////////////////////////////////////
       // dmc_start_switch_tb = 1'b1;
        #100;
        
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h02, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
        
        for (i = 0 ; i<9; i = i+1) begin
        
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h40, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h40, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
        end
        
        
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h02, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
        
        for (i = 0 ; i<9; i = i+1) begin
        
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h00, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h80, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
            
            i2c_data = {7'h72, 1'b0, 1'bz, 8'h42,  1'bz, 8'h3f, 1'bz,    1'b1};     
            sda_slave_tb_reg = 1'b0;
            scl_slave_tb = 1'b1;
            #600;
            scl_slave_tb = 1'b0;
            #650;
            sda_slave_tb_reg = i2c_data[27];
            #650;
            for (j = 0; j < 27; j = j + 1) begin
                scl_slave_tb = 1'b1;
                #600;
                scl_slave_tb = 1'b0;
                #650;
                sda_slave_tb_reg = i2c_data[26-j];
                #650;
            end
            scl_slave_tb = 1'b1;
            sda_slave_tb_reg = 1'b1;
            #10000;
        end
        
        
        
        
        
    end 
endmodule
