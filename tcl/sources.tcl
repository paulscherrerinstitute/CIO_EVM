
set files [list \
  [file normalize "$origin_dir/../hdl/cpsi_cio_top.vhd"] \
  [file normalize "$origin_dir/../hdl/AxiFwVersionWrapper.vhd"] \
  [file normalize "$origin_dir/../hdl/AxiXBarWrapper.vhd"] \
  [file normalize "$origin_dir/../hdl/ZynqMpPSWrapper.vhd"] \
  [file normalize "$origin_dir/../modules/fw_version_id/hdl/fw_version_id_axi.vhd"] \
  [file normalize "$origin_dir/../modules/psi_common/hdl/psi_common_axi_pkg.vhd"] \
  [file normalize "$origin_dir/../modules/psi_common/hdl/psi_common_array_pkg.vhd"] \
  [file normalize "$origin_dir/../modules/psi_common/hdl/psi_common_math_pkg.vhd"] \
  [file normalize "$origin_dir/../modules/psi_common/hdl/psi_common_logic_pkg.vhd"] \
  [file normalize "$origin_dir/../modules/psi_common/hdl/psi_common_pl_stage.vhd"] \
  [file normalize "$origin_dir/../modules/psi_common/hdl/psi_common_sp_ram_be.vhd"] \
  [file normalize "$origin_dir/../modules/psi_common/hdl/psi_common_axi_slave_ipif.vhd"] \
]

add_files -norecurse -fileset [get_filesets sources_1] $files

