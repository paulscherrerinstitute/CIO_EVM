set ip_name axiGpioI2O2
create_ip -name axi_gpio -vendor xilinx.com -library ip -version 2.* -module_name $ip_name
set_property -dict [list \
  CONFIG.C_ALL_INPUTS {1} \
  CONFIG.C_ALL_OUTPUTS_2 {1} \
  CONFIG.C_GPIO2_WIDTH {2} \
  CONFIG.C_GPIO_WIDTH {2} \
  CONFIG.C_IS_DUAL {1} \
] [get_ips $ip_name]
