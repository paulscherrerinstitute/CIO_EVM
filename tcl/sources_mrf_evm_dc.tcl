create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.* -module_name "fifo80x2048"

set_property -dict [list \
  CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} \
  CONFIG.Input_Data_Width {80} \
  CONFIG.Read_Clock_Frequency {125} \
  CONFIG.Write_Clock_Frequency {142.8} \
] [get_ips "fifo80x2048"]

create_ip -name ila -vendor xilinx.com -library ip -version 6.* -module_name ila_0

set_property CONFIG.C_PROBE0_WIDTH {256} [get_ips ila_0]

set files [list \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/DPRAM_2k_8_32_k7.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/ac_input.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/average.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/axi_to_opb_bridge.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/buf_bsram.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/evg_pkg.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/cpsi_cio_pkg.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/timestamp_pkg.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/config_RAM.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/databuf_dc_insert.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/databuf_rx.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/evr_pkg.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/vmeevm300_evrd_pkg.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/databuf_rx_dc.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/dbuf_priority.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/dbuf_priority_enc.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/default_settings_pkg.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/delay_adjust.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/delay_measure_wnd.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/event_analyser.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/event_fanout.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/event_map_ram_k7_e1.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/event_priority_enc.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/evm_cio.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/evm_sfp_RAM.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/fct_pkg.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/i2c_master.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/memory_buffer.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/memory_buffer_dc.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/micrel_load.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/mx_counter.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/opb_evg.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/opb_evr_l.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/oversampling_input.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/pulse_generator.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/rtm_i2c.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/seq_ramb.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/sfp_serial.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/spi.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/sync_domains.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/transceiver_channel_gthe4.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/transceiver_evm_gthe4.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/transceiver_up_gthe4.vhd"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/trigger.vhd"] \
]

add_files -norecurse -fileset [get_filesets sources_1] $files

set files [list \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/false_paths.xdc"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/false_paths_channel_gthe4.xdc"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/false_paths_dc_meas.xdc"] \
 [file normalize "${origin_dir}/../modules/mrf-evm-dc/vhdl/false_paths_sync_domain.xdc"] \
]

add_files -norecurse -fileset [get_filesets constrs_1] $files

set_property SCOPED_TO_REF transceiver_channel_gthe4  [get_files "*/false_paths_channel_gthe4.xdc"]
set_property SCOPED_TO_REF delay_measure              [get_files "*/false_paths_dc_meas.xdc"]
set_property SCOPED_TO_REF sync_domain                [get_files "*/false_paths_sync_domain.xdc"]
