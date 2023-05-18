
-- wrapper for the PS + smart interconnect (the latter one cannot be instantiated from TCL)
library ieee;
use     ieee.std_logic_1164.all;
use     work.psi_common_axi_pkg.all;

entity ZynqMpPSWrapper is
  port (
    axi_aclk                 : out std_logic;
    aux_rstb                 : in  std_logic   := '1';
    axi_iconn_aresetn        : out std_logic;
    axi_peripheral_aresetn   : out std_logic;
    axi_peripheral_reset     : out std_logic;
    dcm_locked               : in  std_logic   := '1';
    mb_debug_sys_rst         : in  std_logic   := '0';
    pl_ps_irq0               : in  std_logic_vector ( 7 downto 0 ) := (others => '0');
    pl_ps_irq1               : in  std_logic_vector ( 7 downto 0 ) := (others => '0');
    axi_ms_awaddr_hi         : out std_logic_vector(39 downto 32);
    axi_ms_araddr_hi         : out std_logic_vector(39 downto 32);
    axi_ms                   : out rec_axi_ms;
    axi_sm                   : in  rec_axi_sm
  );
end entity ZynqMpPSWrapper;

architecture rtl of ZynqMpPSWrapper is

  -- copied from template of associated block design
  component CPSI_CIO is
    port (
      aux_rstb_in : in STD_LOGIC;
      axi_aclk : out STD_LOGIC;
      axi_iconn_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
      axi_peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
      axi_peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
      dcm_locked : in STD_LOGIC;
      mb_debug_sys_rst_in : in STD_LOGIC;
      pl_ps_irq0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
      pl_ps_irq1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
      axi_m00_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      axi_m00_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
      axi_m00_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
      axi_m00_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
      axi_m00_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
      axi_m00_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
      axi_m00_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      axi_m00_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
      axi_m00_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
      axi_m00_awvalid : out STD_LOGIC;
      axi_m00_awready : in STD_LOGIC;
      axi_m00_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
      axi_m00_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
      axi_m00_wlast : out STD_LOGIC;
      axi_m00_wvalid : out STD_LOGIC;
      axi_m00_wready : in STD_LOGIC;
      axi_m00_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      axi_m00_bvalid : in STD_LOGIC;
      axi_m00_bready : out STD_LOGIC;
      axi_m00_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
      axi_m00_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
      axi_m00_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
      axi_m00_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
      axi_m00_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
      axi_m00_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
      axi_m00_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
      axi_m00_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
      axi_m00_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
      axi_m00_arvalid : out STD_LOGIC;
      axi_m00_arready : in STD_LOGIC;
      axi_m00_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
      axi_m00_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
      axi_m00_rlast : in STD_LOGIC;
      axi_m00_rvalid : in STD_LOGIC;
      axi_m00_rready : out STD_LOGIC
    );
  end component CPSI_CIO;

  signal axi_ms_aw_user : std_logic_vector(15 downto 0);
  signal axi_ms_ar_user : std_logic_vector(15 downto 0);

begin

  axi_ms_awaddr_hi <= (others => '0');
  axi_ms_araddr_hi <= (others => '0');
  axi_ms.aw.user   <= axi_ms_aw_user( axi_ms.aw.user'range );
  axi_ms.ar.user   <= axi_ms_ar_user( axi_ms.ar.user'range );

  U_CPSI_CIO : component CPSI_CIO
    port map (
      aux_rstb_in              => aux_rstb,
      axi_aclk                 => axi_aclk,
      axi_iconn_aresetn(0)     => axi_iconn_aresetn,
      axi_peripheral_aresetn(0)=> axi_peripheral_aresetn,
      axi_peripheral_reset(0)  => axi_peripheral_reset,
      dcm_locked               => dcm_locked,
      mb_debug_sys_rst_in      => mb_debug_sys_rst,
      pl_ps_irq0               => pl_ps_irq0,
      pl_ps_irq1               => pl_ps_irq1,
      axi_m00_awaddr           => axi_ms.aw.addr,
      axi_m00_awlen            => axi_ms.aw.len,
      axi_m00_awsize           => axi_ms.aw.size,
      axi_m00_awburst          => axi_ms.aw.burst,
      axi_m00_awlock(0)        => axi_ms.aw.lock,
      axi_m00_awcache          => axi_ms.aw.cache,
      axi_m00_awprot           => axi_ms.aw.prot,
      axi_m00_awqos            => axi_ms.aw.qos,
      axi_m00_awuser           => axi_ms_aw_user,
      axi_m00_awvalid          => axi_ms.aw.valid,
      axi_m00_awready          => axi_sm.aw.ready,
      axi_m00_wdata            => axi_ms.dw.data,
      axi_m00_wstrb            => axi_ms.dw.strb,
      axi_m00_wlast            => axi_ms.dw.last,
      axi_m00_wvalid           => axi_ms.dw.valid,
      axi_m00_wready           => axi_sm.dw.ready,
      axi_m00_bresp            => axi_sm.b.resp,
      axi_m00_bvalid           => axi_sm.b.valid,
      axi_m00_bready           => axi_ms.b.ready,
      axi_m00_araddr           => axi_ms.ar.addr,
      axi_m00_arlen            => axi_ms.ar.len,
      axi_m00_arsize           => axi_ms.ar.size,
      axi_m00_arburst          => axi_ms.ar.burst,
      axi_m00_arlock(0)        => axi_ms.ar.lock,
      axi_m00_arcache          => axi_ms.ar.cache,
      axi_m00_arprot           => axi_ms.ar.prot,
      axi_m00_arqos            => axi_ms.ar.qos,
      axi_m00_aruser           => axi_ms_ar_user,
      axi_m00_arvalid          => axi_ms.ar.valid,
      axi_m00_arready          => axi_sm.ar.ready,
      axi_m00_rdata            => axi_sm.dr.data,
      axi_m00_rresp            => axi_sm.dr.resp,
      axi_m00_rlast            => axi_sm.dr.last,
      axi_m00_rvalid           => axi_sm.dr.valid,
      axi_m00_rready           => axi_ms.dr.ready
    );

end architecture rtl;
