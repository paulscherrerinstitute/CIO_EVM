create_clock -period 3.500 -name {clk_a_gth_qsfp0}     -add [get_ports {CLK_A_GTH_QSFP0_P}]
create_clock -period 3.500 -name {clk_b_gth_qsfp0}     -add [get_ports {CLK_B_GTH_QSFP0_P}]
create_clock -period 3.500 -name {clk_b_gth_qsfp1}     -add [get_ports {CLK_B_GTH_QSFP1_P}]
create_clock -period 3.500 -name {clk_a_gth_msh_sfp1}  -add [get_ports {CLK_A_GTH_MSH_SFP1_P}]
create_clock -period 3.500 -name {clk_b_gth_msh}       -add [get_ports {CLK_B_GTH_MSH_P}]

create_clock -period 7.000 -name {clk_a_fpga_dp_gc}    -add [get_ports {CLK_A_FPGA_DP_GC_P}]
create_clock -period 7.000 -name {clk_b_fpga_dp_gc}    -add [get_ports {CLK_B_FPGA_DP_GC_P}]

#set_case_analysis 0 [get_pins -hier {*i_gth/TXRATE[0]}]
#set_case_analysis 1 [get_pins -hier {*i_gth/TXRATE[1]}]
#set_case_analysis 0 [get_pins -hier {*i_gth/TXRATE[2]}]
#
#set_case_analysis 0 [get_pins -hier {*i_gth/RXRATE[0]}]
#set_case_analysis 1 [get_pins -hier {*i_gth/RXRATE[1]}]
#set_case_analysis 0 [get_pins -hier {*i_gth/RXRATE[2]}]
#
#set_case_analysis 1 [get_pins -hier {*i_gth/TXOUTCLKSEL[0]}]
#set_case_analysis 1 [get_pins -hier {*i_gth/TXOUTCLKSEL[1]}]
#set_case_analysis 0 [get_pins -hier {*i_gth/TXOUTCLKSEL[2]}]

# BUFGMUX switching between master/fanout mode
create_generated_clock -name event_clk_B      -source [get_pins -hier -regex {.*/i_evm/i_bufg1/I0}] -divide_by 1 [get_pins -hier -regex {.*/i_evm/i_bufg1/O}]
create_generated_clock -name event_clk_A -master [get_clocks clk_a_fpga_dp_gc] -add -source [get_pins -hier -regex {.*/i_evm/i_bufg1/I1}] -divide_by 1 [get_pins -hier -regex {.*/i_evm/i_bufg1/O}]

set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks event_clk_B] -group [get_clocks -include_generated_clocks event_clk_A]

# two inputs into MMCM
# NOTE: since the MMCM is downstream of the BUFGMUX above it is important that the generated clocks on the mux
#       are defined *before* we constrain the MMCM input mux!
set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks -of_objects [get_pins -hier -regex {.*/i_evm/mmc_i/CLKOUT0}] -filter {SOURCE=~*CLKIN1}] -group [get_clocks -include_generated_clocks -of_objects [get_pins -hier -regex {.*/i_evm/mmc_i/CLKOUT0}] -filter {SOURCE=~*CLKIN2}]

#  Unfortunately, CDC between AXI and the event clocks (down- and upstream) is not resolved; still thousands of endpoints affected.

#set_clock_groups -async -group [get_clocks clk_pl_1] -group [get_clocks -of_objects [get_nets -hier -regex {.*/i_evm/(event_clk|up_txusrclk)}]]
