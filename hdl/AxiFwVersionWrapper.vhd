-- Wrapper for PSI fw_version_id_axi

library ieee;
use     ieee.std_logic_1164.all;
use     work.psi_common_axi_pkg.all;

------------------------------------------------------------------------------
-- Entity
------------------------------------------------------------------------------  
entity AxiFwVersionWrapper is
  generic
  (
    C_ID_FACILITY            : string  := "FACILITY";
    C_ID_PROJECT             : string  := "PROJECT";
    C_REV_PINS               : boolean  := FALSE;

    -- AXI Parameters
    C_S00_AXI_ID_WIDTH       : integer := 1;                 -- Width of ID for for write address, write data, read address and read data
    C_S_AXI_ADDR_WIDTH       : integer := 9
  );
  port
  (
    -----------------------------------------------------------------------------
    -- Parameters, connecting to top level
    -----------------------------------------------------------------------------
    param_fw_git_version_i    : in  std_logic_vector(255 downto 0) := (others=>'0');
    param_fw_build_datetime_i : in  std_logic_vector(159 downto 0) := (others=>'0');
    --param_fw_build_date_i  : in  std_logic_vector(31 downto 0) := (others=>'0');
    --param_fw_build_time_i  : in  std_logic_vector(31 downto 0) := (others=>'0');

    -----------------------------------------------------------------------------
    -- External HW Rev Pins
    -----------------------------------------------------------------------------
    rev_pins_i    : in std_logic_vector(31 downto 0) := (others=>'0');

    -----------------------------------------------------------------------------
    -- Axi Slave Bus Interface
    -----------------------------------------------------------------------------
    -- System
    axi_aclk                    : in    std_logic;                                             -- Global Clock Signal
    axi_aresetn                 : in    std_logic;                                             -- Global Reset Signal. This signal is low active.

    axi_ms                      : in    rec_axi_ms;
    axi_sm                      : out   rec_axi_sm
  );
end entity AxiFwVersionWrapper;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture rtl of AxiFwVersionWrapper is 
begin

  fw_version_i : entity work.fw_version_id_axi
    generic map
    (
      C_ID_FACILITY                => C_ID_FACILITY,
      C_ID_PROJECT                 => C_ID_PROJECT,
      C_REV_PINS                   => C_REV_PINS,

      -- AXI Parameters
      C_S00_AXI_ID_WIDTH           => C_S00_AXI_ID_WIDTH,
      C_S_AXI_ADDR_WIDTH           => C_S_AXI_ADDR_WIDTH
    )
    port map
    (
      param_fw_git_version_i       => param_fw_git_version_i,
      param_fw_build_datetime_i    => param_fw_build_datetime_i,

      rev_pins_i                   => rev_pins_i,

      s00_axi_aclk                 => axi_aclk,
      s00_axi_aresetn              => axi_aresetn,

      s00_axi_awaddr               => axi_ms.aw.addr(C_S_AXI_ADDR_WIDTH - 1 downto 0),
      s00_axi_awid                 => axi_ms.aw.id,
      s00_axi_awlen                => axi_ms.aw.len,
      s00_axi_awsize               => axi_ms.aw.size,
      s00_axi_awburst              => axi_ms.aw.burst,
      s00_axi_awlock               => axi_ms.aw.lock,
      s00_axi_awcache              => axi_ms.aw.cache,
      s00_axi_awprot               => axi_ms.aw.prot,
      s00_axi_awvalid              => axi_ms.aw.valid,
      s00_axi_awready              => axi_sm.aw.ready,
      s00_axi_wdata                => axi_ms.dw.data,
      s00_axi_wstrb                => axi_ms.dw.strb,
      s00_axi_wlast                => axi_ms.dw.last,
      s00_axi_wvalid               => axi_ms.dw.valid,
      s00_axi_wready               => axi_sm.dw.ready,
      s00_axi_bresp                => axi_sm.b.resp,
      s00_axi_bvalid               => axi_sm.b.valid,
      s00_axi_bready               => axi_ms.b.ready,
      s00_axi_araddr               => axi_ms.ar.addr(C_S_AXI_ADDR_WIDTH - 1 downto 0),
      s00_axi_arid                 => axi_ms.ar.id,
      s00_axi_arlen                => axi_ms.ar.len,
      s00_axi_arsize               => axi_ms.ar.size,
      s00_axi_arburst              => axi_ms.ar.burst,
      s00_axi_arlock               => axi_ms.ar.lock,
      s00_axi_arcache              => axi_ms.ar.cache,
      s00_axi_arprot               => axi_ms.ar.prot,
      s00_axi_arvalid              => axi_ms.ar.valid,
      s00_axi_arready              => axi_sm.ar.ready,
      s00_axi_rdata                => axi_sm.dr.data,
      s00_axi_rresp                => axi_sm.dr.resp,
      s00_axi_rlast                => axi_sm.dr.last,
      s00_axi_rvalid               => axi_sm.dr.valid,
      s00_axi_rready               => axi_ms.dr.ready
    );



end rtl;

