-- Wrapper for tim320_trigger - interface using rec_axi_ms/rec_axi_sm
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.psi_common_axi_pkg.all;

entity Tim320TriggerWrapper is
   generic
   (
      C_S00_AXI_ADDR_WIDTH        : integer := 14;
      C_NUM_TRIGGERS              : integer := 2
   );
   port (
    i_delay_clk               : in  std_logic;
    TRIGGER_IN                : in  std_logic_vector(C_NUM_TRIGGERS-1 downto  0);
    TRIGGER_OUT               : out std_logic_vector(C_NUM_TRIGGERS-1 downto  0);

    axi_aclk                  : in  std_logic;
    axi_aresetn               : in  std_logic;
    axi_ms                    : in  rec_axi_ms;
    axi_sm                    : out rec_axi_sm
   );
end entity Tim320TriggerWrapper;

architecture Mapping of Tim320TriggerWrapper is
begin

  Tim320Trigger_i : entity work.tim320_trigger
    generic map (
      C_S00_AXI_ADDR_WIDTH        => C_S00_AXI_ADDR_WIDTH,
      C_NUM_TRIGGERS              => C_NUM_TRIGGERS
    )
    port map (
      i_delay_clk                 => i_delay_clk,
      TRIGGER_IN                  => TRIGGER_IN,
      TRIGGER_OUT                 => TRIGGER_OUT,

      s00_axi_aclk                => axi_aclk,
      s00_axi_aresetn             => axi_aresetn,

      s00_axi_awaddr              => axi_ms.aw.addr(C_S00_AXI_ADDR_WIDTH - 1 downto 0),
      s00_axi_awid                => axi_ms.aw.id,
      s00_axi_awlen               => axi_ms.aw.len,
      s00_axi_awsize              => axi_ms.aw.size,
      s00_axi_awburst             => axi_ms.aw.burst,
      s00_axi_awlock              => axi_ms.aw.lock,
      s00_axi_awcache             => axi_ms.aw.cache,
      s00_axi_awprot              => axi_ms.aw.prot,
      s00_axi_awvalid             => axi_ms.aw.valid,
      s00_axi_awready             => axi_sm.aw.ready,
      s00_axi_wdata               => axi_ms.dw.data,
      s00_axi_wstrb               => axi_ms.dw.strb,
      s00_axi_wlast               => axi_ms.dw.last,
      s00_axi_wvalid              => axi_ms.dw.valid,
      s00_axi_wready              => axi_sm.dw.ready,
      s00_axi_bresp               => axi_sm.b.resp,
      s00_axi_bvalid              => axi_sm.b.valid,
      s00_axi_bready              => axi_ms.b.ready,
      s00_axi_araddr              => axi_ms.ar.addr(C_S00_AXI_ADDR_WIDTH - 1 downto 0),
      s00_axi_arid                => axi_ms.ar.id,
      s00_axi_arlen               => axi_ms.ar.len,
      s00_axi_arsize              => axi_ms.ar.size,
      s00_axi_arburst             => axi_ms.ar.burst,
      s00_axi_arlock              => axi_ms.ar.lock,
      s00_axi_arcache             => axi_ms.ar.cache,
      s00_axi_arprot              => axi_ms.ar.prot,
      s00_axi_arvalid             => axi_ms.ar.valid,
      s00_axi_arready             => axi_sm.ar.ready,
      s00_axi_rdata               => axi_sm.dr.data,
      s00_axi_rresp               => axi_sm.dr.resp,
      s00_axi_rlast               => axi_sm.dr.last,
      s00_axi_rvalid              => axi_sm.dr.valid,
      s00_axi_rready              => axi_ms.dr.ready
    );

end architecture Mapping;
