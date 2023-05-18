

# Instantiate Zynq
set ps_ip_name zynq_ultra_ps_e_0
create_ip -name zynq_ultra_ps_e -vendor xilinx.com -library ip -version 3.* -module_name ${ps_ip_name}

# The presets were exported from the BSP's block design.
# We source the unmodified script here...
source ${origin_dir}/cpsi_cio_ps_presets.tcl

set_property -dict [apply_preset ${ps_ip_name}] [get_ips ${ps_ip_name}]
# the 'wizard' does not let you configure these
set_property CONFIG.PSU__NUM_F2P0__INTR__INPUTS 8 [get_ips ${ps_ip_name}]
set_property CONFIG.PSU__NUM_F2P1__INTR__INPUTS 8 [get_ips ${ps_ip_name}]


# Reset
create_ip -name proc_sys_reset -vendor xilinx.com -library ip -version 5.* -module_name proc_sys_reset_0
set_property -dict [list \
  CONFIG.C_AUX_RESET_HIGH {0} \
  CONFIG.C_EXT_RESET_HIGH {0} \
] [get_ips proc_sys_reset_0]

# Data Width converter from 128 -> 32

create_ip -name axi_dwidth_converter -vendor xilinx.com -library ip -version 2.* -module_name axi_dwidth_converter_0

set_property -dict [list \
  CONFIG.ADDR_WIDTH {40} \
  CONFIG.MI_DATA_WIDTH {32} \
  CONFIG.SI_DATA_WIDTH {128} \
  CONFIG.SI_ID_WIDTH {16} \
] [get_ips axi_dwidth_converter_0]
