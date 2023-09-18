use work.psi_common_axi_pkg.all;

package axi_opb_cfg_pkg is

  constant C_CFG_AXI_ID_WIDTH     : natural := C_S_AXI_ID_WIDTH;
  constant C_CFG_AXI_ADDR_WIDTH   : natural := C_S_AXI_ADDR_WIDTH;
  constant C_CFG_AXI_DATA_WIDTH   : natural := C_S_AXI_DATA_WIDTH;

  constant C_CFG_OPB_DWIDTH       : natural := 32;
  constant C_CFG_OPB_AWIDTH       : natural := 32;

end package axi_opb_cfg_pkg;
