-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Thu May 16 20:11:11 2024
-- Host        : DESKTOP-N21QB96 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top cic_compiler_0 -prefix
--               cic_compiler_0_ cic_compiler_0_stub.vhdl
-- Design      : cic_compiler_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cic_compiler_0 is
  Port ( 
    aclk : in STD_LOGIC;
    s_axis_data_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_data_tvalid : in STD_LOGIC;
    s_axis_data_tready : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC
  );

end cic_compiler_0;

architecture stub of cic_compiler_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,s_axis_data_tdata[7:0],s_axis_data_tvalid,s_axis_data_tready,m_axis_data_tdata[15:0],m_axis_data_tvalid";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "cic_compiler_v4_0_17,Vivado 2023.2";
begin
end;
