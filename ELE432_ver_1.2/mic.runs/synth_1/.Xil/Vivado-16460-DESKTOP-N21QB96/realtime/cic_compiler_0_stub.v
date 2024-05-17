// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cic_compiler_v4_0_17,Vivado 2023.2" *)
module cic_compiler_0(aclk, s_axis_data_tdata, s_axis_data_tvalid, 
  s_axis_data_tready, m_axis_data_tdata, m_axis_data_tvalid);
  input aclk /* synthesis syn_isclock = 1 */;
  input [7:0]s_axis_data_tdata;
  input s_axis_data_tvalid;
  output s_axis_data_tready;
  output [15:0]m_axis_data_tdata;
  output m_axis_data_tvalid;
endmodule
