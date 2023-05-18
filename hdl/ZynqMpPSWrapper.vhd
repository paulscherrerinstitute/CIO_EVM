
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
    -- a hack to convey the high address lines
    -- to the crossbar
    axi_ms_araddr_hi         : out std_logic_vector( 39 downto 32);
    axi_ms_awaddr_hi         : out std_logic_vector( 39 downto 32);
    axi_ms                   : out rec_axi_ms;
    axi_sm                   : in  rec_axi_sm
  );
end entity ZynqMpPSWrapper;

architecture rtl of ZynqMpPSWrapper is

  component proc_sys_reset_0
    port (
      slowest_sync_clk : in std_logic;
      ext_reset_in : in std_logic;
      aux_reset_in : in std_logic;
      mb_debug_sys_rst : in std_logic;
      dcm_locked : in std_logic;
      mb_reset : out std_logic;
      bus_struct_reset : out std_logic_vector(0 downto 0);
      peripheral_reset : out std_logic_vector(0 downto 0);
      interconnect_aresetn : out std_logic_vector(0 downto 0);
      peripheral_aresetn : out std_logic_vector(0 downto 0) 
    );
  end component;
  
  component zynq_ultra_ps_e_0
    port (
      maxihpm0_fpd_aclk : in std_logic;
      maxigp0_awid : out std_logic_vector(15 downto 0);
      maxigp0_awaddr : out std_logic_vector(39 downto 0);
      maxigp0_awlen : out std_logic_vector(7 downto 0);
      maxigp0_awsize : out std_logic_vector(2 downto 0);
      maxigp0_awburst : out std_logic_vector(1 downto 0);
      maxigp0_awlock : out std_logic;
      maxigp0_awcache : out std_logic_vector(3 downto 0);
      maxigp0_awprot : out std_logic_vector(2 downto 0);
      maxigp0_awvalid : out std_logic;
      maxigp0_awuser : out std_logic_vector(15 downto 0);
      maxigp0_awready : in std_logic;
      maxigp0_wdata : out std_logic_vector(127 downto 0);
      maxigp0_wstrb : out std_logic_vector(15 downto 0);
      maxigp0_wlast : out std_logic;
      maxigp0_wvalid : out std_logic;
      maxigp0_wready : in std_logic;
      maxigp0_bid : in std_logic_vector(15 downto 0);
      maxigp0_bresp : in std_logic_vector(1 downto 0);
      maxigp0_bvalid : in std_logic;
      maxigp0_bready : out std_logic;
      maxigp0_arid : out std_logic_vector(15 downto 0);
      maxigp0_araddr : out std_logic_vector(39 downto 0);
      maxigp0_arlen : out std_logic_vector(7 downto 0);
      maxigp0_arsize : out std_logic_vector(2 downto 0);
      maxigp0_arburst : out std_logic_vector(1 downto 0);
      maxigp0_arlock : out std_logic;
      maxigp0_arcache : out std_logic_vector(3 downto 0);
      maxigp0_arprot : out std_logic_vector(2 downto 0);
      maxigp0_arvalid : out std_logic;
      maxigp0_aruser : out std_logic_vector(15 downto 0);
      maxigp0_arready : in std_logic;
      maxigp0_rid : in std_logic_vector(15 downto 0);
      maxigp0_rdata : in std_logic_vector(127 downto 0);
      maxigp0_rresp : in std_logic_vector(1 downto 0);
      maxigp0_rlast : in std_logic;
      maxigp0_rvalid : in std_logic;
      maxigp0_rready : out std_logic;
      maxigp0_awqos : out std_logic_vector(3 downto 0);
      maxigp0_arqos : out std_logic_vector(3 downto 0);
      maxihpm1_fpd_aclk : in std_logic;
      maxigp1_awid : out std_logic_vector(15 downto 0);
      maxigp1_awaddr : out std_logic_vector(39 downto 0);
      maxigp1_awlen : out std_logic_vector(7 downto 0);
      maxigp1_awsize : out std_logic_vector(2 downto 0);
      maxigp1_awburst : out std_logic_vector(1 downto 0);
      maxigp1_awlock : out std_logic;
      maxigp1_awcache : out std_logic_vector(3 downto 0);
      maxigp1_awprot : out std_logic_vector(2 downto 0);
      maxigp1_awvalid : out std_logic;
      maxigp1_awuser : out std_logic_vector(15 downto 0);
      maxigp1_awready : in std_logic;
      maxigp1_wdata : out std_logic_vector(127 downto 0);
      maxigp1_wstrb : out std_logic_vector(15 downto 0);
      maxigp1_wlast : out std_logic;
      maxigp1_wvalid : out std_logic;
      maxigp1_wready : in std_logic;
      maxigp1_bid : in std_logic_vector(15 downto 0);
      maxigp1_bresp : in std_logic_vector(1 downto 0);
      maxigp1_bvalid : in std_logic;
      maxigp1_bready : out std_logic;
      maxigp1_arid : out std_logic_vector(15 downto 0);
      maxigp1_araddr : out std_logic_vector(39 downto 0);
      maxigp1_arlen : out std_logic_vector(7 downto 0);
      maxigp1_arsize : out std_logic_vector(2 downto 0);
      maxigp1_arburst : out std_logic_vector(1 downto 0);
      maxigp1_arlock : out std_logic;
      maxigp1_arcache : out std_logic_vector(3 downto 0);
      maxigp1_arprot : out std_logic_vector(2 downto 0);
      maxigp1_arvalid : out std_logic;
      maxigp1_aruser : out std_logic_vector(15 downto 0);
      maxigp1_arready : in std_logic;
      maxigp1_rid : in std_logic_vector(15 downto 0);
      maxigp1_rdata : in std_logic_vector(127 downto 0);
      maxigp1_rresp : in std_logic_vector(1 downto 0);
      maxigp1_rlast : in std_logic;
      maxigp1_rvalid : in std_logic;
      maxigp1_rready : out std_logic;
      maxigp1_awqos : out std_logic_vector(3 downto 0);
      maxigp1_arqos : out std_logic_vector(3 downto 0);
      maxihpm0_lpd_aclk : in std_logic;
      maxigp2_awid : out std_logic_vector(15 downto 0);
      maxigp2_awaddr : out std_logic_vector(39 downto 0);
      maxigp2_awlen : out std_logic_vector(7 downto 0);
      maxigp2_awsize : out std_logic_vector(2 downto 0);
      maxigp2_awburst : out std_logic_vector(1 downto 0);
      maxigp2_awlock : out std_logic;
      maxigp2_awcache : out std_logic_vector(3 downto 0);
      maxigp2_awprot : out std_logic_vector(2 downto 0);
      maxigp2_awvalid : out std_logic;
      maxigp2_awuser : out std_logic_vector(15 downto 0);
      maxigp2_awready : in std_logic;
      maxigp2_wdata : out std_logic_vector(31 downto 0);
      maxigp2_wstrb : out std_logic_vector(3 downto 0);
      maxigp2_wlast : out std_logic;
      maxigp2_wvalid : out std_logic;
      maxigp2_wready : in std_logic;
      maxigp2_bid : in std_logic_vector(15 downto 0);
      maxigp2_bresp : in std_logic_vector(1 downto 0);
      maxigp2_bvalid : in std_logic;
      maxigp2_bready : out std_logic;
      maxigp2_arid : out std_logic_vector(15 downto 0);
      maxigp2_araddr : out std_logic_vector(39 downto 0);
      maxigp2_arlen : out std_logic_vector(7 downto 0);
      maxigp2_arsize : out std_logic_vector(2 downto 0);
      maxigp2_arburst : out std_logic_vector(1 downto 0);
      maxigp2_arlock : out std_logic;
      maxigp2_arcache : out std_logic_vector(3 downto 0);
      maxigp2_arprot : out std_logic_vector(2 downto 0);
      maxigp2_arvalid : out std_logic;
      maxigp2_aruser : out std_logic_vector(15 downto 0);
      maxigp2_arready : in std_logic;
      maxigp2_rid : in std_logic_vector(15 downto 0);
      maxigp2_rdata : in std_logic_vector(31 downto 0);
      maxigp2_rresp : in std_logic_vector(1 downto 0);
      maxigp2_rlast : in std_logic;
      maxigp2_rvalid : in std_logic;
      maxigp2_rready : out std_logic;
      maxigp2_awqos : out std_logic_vector(3 downto 0);
      maxigp2_arqos : out std_logic_vector(3 downto 0);
      saxihp0_fpd_aclk : in std_logic;
      saxigp2_aruser : in std_logic;
      saxigp2_awuser : in std_logic;
      saxigp2_awid : in std_logic_vector(5 downto 0);
      saxigp2_awaddr : in std_logic_vector(48 downto 0);
      saxigp2_awlen : in std_logic_vector(7 downto 0);
      saxigp2_awsize : in std_logic_vector(2 downto 0);
      saxigp2_awburst : in std_logic_vector(1 downto 0);
      saxigp2_awlock : in std_logic;
      saxigp2_awcache : in std_logic_vector(3 downto 0);
      saxigp2_awprot : in std_logic_vector(2 downto 0);
      saxigp2_awvalid : in std_logic;
      saxigp2_awready : out std_logic;
      saxigp2_wdata : in std_logic_vector(127 downto 0);
      saxigp2_wstrb : in std_logic_vector(15 downto 0);
      saxigp2_wlast : in std_logic;
      saxigp2_wvalid : in std_logic;
      saxigp2_wready : out std_logic;
      saxigp2_bid : out std_logic_vector(5 downto 0);
      saxigp2_bresp : out std_logic_vector(1 downto 0);
      saxigp2_bvalid : out std_logic;
      saxigp2_bready : in std_logic;
      saxigp2_arid : in std_logic_vector(5 downto 0);
      saxigp2_araddr : in std_logic_vector(48 downto 0);
      saxigp2_arlen : in std_logic_vector(7 downto 0);
      saxigp2_arsize : in std_logic_vector(2 downto 0);
      saxigp2_arburst : in std_logic_vector(1 downto 0);
      saxigp2_arlock : in std_logic;
      saxigp2_arcache : in std_logic_vector(3 downto 0);
      saxigp2_arprot : in std_logic_vector(2 downto 0);
      saxigp2_arvalid : in std_logic;
      saxigp2_arready : out std_logic;
      saxigp2_rid : out std_logic_vector(5 downto 0);
      saxigp2_rdata : out std_logic_vector(127 downto 0);
      saxigp2_rresp : out std_logic_vector(1 downto 0);
      saxigp2_rlast : out std_logic;
      saxigp2_rvalid : out std_logic;
      saxigp2_rready : in std_logic;
      saxigp2_awqos : in std_logic_vector(3 downto 0);
      saxigp2_arqos : in std_logic_vector(3 downto 0);
      pl_ps_irq0 : in std_logic_vector(7 downto 0);
      pl_ps_irq1 : in std_logic_vector(7 downto 0);
      pl_resetn0 : out std_logic;
      pl_clk0 : out std_logic;
      pl_clk1 : out std_logic;
      pl_clk2 : out std_logic;
      pl_clk3 : out std_logic 
    );
  end component;
  
  component axi_dwidth_converter_0
    port (
      s_axi_aclk : in std_logic;
      s_axi_aresetn : in std_logic;
      s_axi_awid : in std_logic_vector(15 downto 0);
      s_axi_awaddr : in std_logic_vector(39 downto 0);
      s_axi_awlen : in std_logic_vector(7 downto 0);
      s_axi_awsize : in std_logic_vector(2 downto 0);
      s_axi_awburst : in std_logic_vector(1 downto 0);
      s_axi_awlock : in std_logic_vector(0 downto 0);
      s_axi_awcache : in std_logic_vector(3 downto 0);
      s_axi_awprot : in std_logic_vector(2 downto 0);
      s_axi_awregion : in std_logic_vector(3 downto 0);
      s_axi_awqos : in std_logic_vector(3 downto 0);
      s_axi_awvalid : in std_logic;
      s_axi_awready : out std_logic;
      s_axi_wdata : in std_logic_vector(127 downto 0);
      s_axi_wstrb : in std_logic_vector(15 downto 0);
      s_axi_wlast : in std_logic;
      s_axi_wvalid : in std_logic;
      s_axi_wready : out std_logic;
      s_axi_bid : out std_logic_vector(15 downto 0);
      s_axi_bresp : out std_logic_vector(1 downto 0);
      s_axi_bvalid : out std_logic;
      s_axi_bready : in std_logic;
      s_axi_arid : in std_logic_vector(15 downto 0);
      s_axi_araddr : in std_logic_vector(39 downto 0);
      s_axi_arlen : in std_logic_vector(7 downto 0);
      s_axi_arsize : in std_logic_vector(2 downto 0);
      s_axi_arburst : in std_logic_vector(1 downto 0);
      s_axi_arlock : in std_logic_vector(0 downto 0);
      s_axi_arcache : in std_logic_vector(3 downto 0);
      s_axi_arprot : in std_logic_vector(2 downto 0);
      s_axi_arregion : in std_logic_vector(3 downto 0);
      s_axi_arqos : in std_logic_vector(3 downto 0);
      s_axi_arvalid : in std_logic;
      s_axi_arready : out std_logic;
      s_axi_rid : out std_logic_vector(15 downto 0);
      s_axi_rdata : out std_logic_vector(127 downto 0);
      s_axi_rresp : out std_logic_vector(1 downto 0);
      s_axi_rlast : out std_logic;
      s_axi_rvalid : out std_logic;
      s_axi_rready : in std_logic;
      m_axi_awaddr : out std_logic_vector(39 downto 0);
      m_axi_awlen : out std_logic_vector(7 downto 0);
      m_axi_awsize : out std_logic_vector(2 downto 0);
      m_axi_awburst : out std_logic_vector(1 downto 0);
      m_axi_awlock : out std_logic_vector(0 downto 0);
      m_axi_awcache : out std_logic_vector(3 downto 0);
      m_axi_awprot : out std_logic_vector(2 downto 0);
      m_axi_awregion : out std_logic_vector(3 downto 0);
      m_axi_awqos : out std_logic_vector(3 downto 0);
      m_axi_awvalid : out std_logic;
      m_axi_awready : in std_logic;
      m_axi_wdata : out std_logic_vector(31 downto 0);
      m_axi_wstrb : out std_logic_vector(3 downto 0);
      m_axi_wlast : out std_logic;
      m_axi_wvalid : out std_logic;
      m_axi_wready : in std_logic;
      m_axi_bresp : in std_logic_vector(1 downto 0);
      m_axi_bvalid : in std_logic;
      m_axi_bready : out std_logic;
      m_axi_araddr : out std_logic_vector(39 downto 0);
      m_axi_arlen : out std_logic_vector(7 downto 0);
      m_axi_arsize : out std_logic_vector(2 downto 0);
      m_axi_arburst : out std_logic_vector(1 downto 0);
      m_axi_arlock : out std_logic_vector(0 downto 0);
      m_axi_arcache : out std_logic_vector(3 downto 0);
      m_axi_arprot : out std_logic_vector(2 downto 0);
      m_axi_arregion : out std_logic_vector(3 downto 0);
      m_axi_arqos : out std_logic_vector(3 downto 0);
      m_axi_arvalid : out std_logic;
      m_axi_arready : in std_logic;
      m_axi_rdata : in std_logic_vector(31 downto 0);
      m_axi_rresp : in std_logic_vector(1 downto 0);
      m_axi_rlast : in std_logic;
      m_axi_rvalid : in std_logic;
      m_axi_rready : out std_logic 
    );
  end component;
  
  signal axi_aclk_i                           : std_logic;
  signal pl_clk_i                             : std_logic_vector( 3 downto 0);
  signal ext_reset_i                          : std_logic := '1';
  signal bus_struct_reset_i                   : std_logic;
  signal peripheral_reset_i                   : std_logic;
  signal interconnect_aresetn_i               : std_logic;
  signal peripheral_aresetn_i                 : std_logic;

  signal maxigp0_awid                         : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp0_awaddr                       : std_logic_vector(39 downto 0) := (others => '0');
  signal maxigp0_awlen                        : std_logic_vector(7 downto 0) := (others => '0');
  signal maxigp0_awsize                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp0_awburst                      : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp0_awlock                       : std_logic := '0';
  signal maxigp0_awcache                      : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp0_awprot                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp0_awvalid                      : std_logic := '0';
  signal maxigp0_awuser                       : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp0_awready                      : std_logic := '0';
  signal maxigp0_wdata                        : std_logic_vector(127 downto 0) := (others => '0');
  signal maxigp0_wstrb                        : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp0_wlast                        : std_logic := '0';
  signal maxigp0_wvalid                       : std_logic := '0';
  signal maxigp0_wready                       : std_logic := '0';
  signal maxigp0_bid                          : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp0_bresp                        : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp0_bvalid                       : std_logic := '0';
  signal maxigp0_bready                       : std_logic := '0';
  signal maxigp0_arid                         : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp0_araddr                       : std_logic_vector(39 downto 0) := (others => '0');
  signal maxigp0_arlen                        : std_logic_vector(7 downto 0) := (others => '0');
  signal maxigp0_arsize                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp0_arburst                      : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp0_arlock                       : std_logic := '0';
  signal maxigp0_arcache                      : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp0_arprot                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp0_arvalid                      : std_logic := '0';
  signal maxigp0_aruser                       : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp0_arready                      : std_logic := '0';
  signal maxigp0_rid                          : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp0_rdata                        : std_logic_vector(127 downto 0) := (others => '0');
  signal maxigp0_rresp                        : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp0_rlast                        : std_logic := '0';
  signal maxigp0_rvalid                       : std_logic := '0';
  signal maxigp0_rready                       : std_logic := '0';
  signal maxigp0_awqos                        : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp0_arqos                        : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp1_awid                         : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp1_awaddr                       : std_logic_vector(39 downto 0) := (others => '0');
  signal maxigp1_awlen                        : std_logic_vector(7 downto 0) := (others => '0');
  signal maxigp1_awsize                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp1_awburst                      : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp1_awlock                       : std_logic := '0';
  signal maxigp1_awcache                      : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp1_awprot                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp1_awvalid                      : std_logic := '0';
  signal maxigp1_awuser                       : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp1_awready                      : std_logic := '0';
  signal maxigp1_wdata                        : std_logic_vector(127 downto 0) := (others => '0');
  signal maxigp1_wstrb                        : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp1_wlast                        : std_logic := '0';
  signal maxigp1_wvalid                       : std_logic := '0';
  signal maxigp1_wready                       : std_logic := '0';
  signal maxigp1_bid                          : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp1_bresp                        : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp1_bvalid                       : std_logic := '0';
  signal maxigp1_bready                       : std_logic := '0';
  signal maxigp1_arid                         : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp1_araddr                       : std_logic_vector(39 downto 0) := (others => '0');
  signal maxigp1_arlen                        : std_logic_vector(7 downto 0) := (others => '0');
  signal maxigp1_arsize                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp1_arburst                      : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp1_arlock                       : std_logic := '0';
  signal maxigp1_arcache                      : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp1_arprot                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp1_arvalid                      : std_logic := '0';
  signal maxigp1_aruser                       : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp1_arready                      : std_logic := '0';
  signal maxigp1_rid                          : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp1_rdata                        : std_logic_vector(127 downto 0) := (others => '0');
  signal maxigp1_rresp                        : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp1_rlast                        : std_logic := '0';
  signal maxigp1_rvalid                       : std_logic := '0';
  signal maxigp1_rready                       : std_logic := '0';
  signal maxigp1_awqos                        : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp1_arqos                        : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp2_awid                         : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp2_awaddr                       : std_logic_vector(39 downto 0) := (others => '0');
  signal maxigp2_awlen                        : std_logic_vector(7 downto 0) := (others => '0');
  signal maxigp2_awsize                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp2_awburst                      : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp2_awlock                       : std_logic := '0';
  signal maxigp2_awcache                      : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp2_awprot                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp2_awvalid                      : std_logic := '0';
  signal maxigp2_awuser                       : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp2_awready                      : std_logic := '0';
  signal maxigp2_wdata                        : std_logic_vector(31 downto 0) := (others => '0');
  signal maxigp2_wstrb                        : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp2_wlast                        : std_logic := '0';
  signal maxigp2_wvalid                       : std_logic := '0';
  signal maxigp2_wready                       : std_logic := '0';
  signal maxigp2_bid                          : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp2_bresp                        : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp2_bvalid                       : std_logic := '0';
  signal maxigp2_bready                       : std_logic := '0';
  signal maxigp2_arid                         : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp2_araddr                       : std_logic_vector(39 downto 0) := (others => '0');
  signal maxigp2_arlen                        : std_logic_vector(7 downto 0) := (others => '0');
  signal maxigp2_arsize                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp2_arburst                      : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp2_arlock                       : std_logic := '0';
  signal maxigp2_arcache                      : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp2_arprot                       : std_logic_vector(2 downto 0) := (others => '0');
  signal maxigp2_arvalid                      : std_logic := '0';
  signal maxigp2_aruser                       : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp2_arready                      : std_logic := '0';
  signal maxigp2_rid                          : std_logic_vector(15 downto 0) := (others => '0');
  signal maxigp2_rdata                        : std_logic_vector(31 downto 0) := (others => '0');
  signal maxigp2_rresp                        : std_logic_vector(1 downto 0) := (others => '0');
  signal maxigp2_rlast                        : std_logic := '0';
  signal maxigp2_rvalid                       : std_logic := '0';
  signal maxigp2_rready                       : std_logic := '0';
  signal maxigp2_awqos                        : std_logic_vector(3 downto 0) := (others => '0');
  signal maxigp2_arqos                        : std_logic_vector(3 downto 0) := (others => '0');
  signal saxihp0_fpd_aclk                     : std_logic := '0';
  signal saxigp2_aruser                       : std_logic := '0';
  signal saxigp2_awuser                       : std_logic := '0';
  signal saxigp2_awid                         : std_logic_vector(5 downto 0) := (others => '0');
  signal saxigp2_awaddr                       : std_logic_vector(48 downto 0) := (others => '0');
  signal saxigp2_awlen                        : std_logic_vector(7 downto 0) := (others => '0');
  signal saxigp2_awsize                       : std_logic_vector(2 downto 0) := (others => '0');
  signal saxigp2_awburst                      : std_logic_vector(1 downto 0) := (others => '0');
  signal saxigp2_awlock                       : std_logic := '0';
  signal saxigp2_awcache                      : std_logic_vector(3 downto 0) := (others => '0');
  signal saxigp2_awprot                       : std_logic_vector(2 downto 0) := (others => '0');
  signal saxigp2_awvalid                      : std_logic := '0';
  signal saxigp2_awready                      : std_logic := '0';
  signal saxigp2_wdata                        : std_logic_vector(127 downto 0) := (others => '0');
  signal saxigp2_wstrb                        : std_logic_vector(15 downto 0) := (others => '0');
  signal saxigp2_wlast                        : std_logic := '0';
  signal saxigp2_wvalid                       : std_logic := '0';
  signal saxigp2_wready                       : std_logic := '0';
  signal saxigp2_bid                          : std_logic_vector(5 downto 0) := (others => '0');
  signal saxigp2_bresp                        : std_logic_vector(1 downto 0) := (others => '0');
  signal saxigp2_bvalid                       : std_logic := '0';
  signal saxigp2_bready                       : std_logic := '0';
  signal saxigp2_arid                         : std_logic_vector(5 downto 0) := (others => '0');
  signal saxigp2_araddr                       : std_logic_vector(48 downto 0) := (others => '0');
  signal saxigp2_arlen                        : std_logic_vector(7 downto 0) := (others => '0');
  signal saxigp2_arsize                       : std_logic_vector(2 downto 0) := (others => '0');
  signal saxigp2_arburst                      : std_logic_vector(1 downto 0) := (others => '0');
  signal saxigp2_arlock                       : std_logic := '0';
  signal saxigp2_arcache                      : std_logic_vector(3 downto 0) := (others => '0');
  signal saxigp2_arprot                       : std_logic_vector(2 downto 0) := (others => '0');
  signal saxigp2_arvalid                      : std_logic := '0';
  signal saxigp2_arready                      : std_logic := '0';
  signal saxigp2_rid                          : std_logic_vector(5 downto 0) := (others => '0');
  signal saxigp2_rdata                        : std_logic_vector(127 downto 0) := (others => '0');
  signal saxigp2_rresp                        : std_logic_vector(1 downto 0) := (others => '0');
  signal saxigp2_rlast                        : std_logic := '0';
  signal saxigp2_rvalid                       : std_logic := '0';
  signal saxigp2_rready                       : std_logic := '0';
  signal saxigp2_awqos                        : std_logic_vector(3 downto 0) := (others => '0');
  signal saxigp2_arqos                        : std_logic_vector(3 downto 0) := (others => '0');

  signal m_axi_awaddr                         : std_logic_vector(39 downto 0) := (others => '0');
  signal m_axi_awlen                          : std_logic_vector(7 downto 0) := (others => '0');
  signal m_axi_awsize                         : std_logic_vector(2 downto 0) := (others => '0');
  signal m_axi_awburst                        : std_logic_vector(1 downto 0) := (others => '0');
  signal m_axi_awlock                         : std_logic_vector(0 downto 0) := (others => '0');
  signal m_axi_awcache                        : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axi_awprot                         : std_logic_vector(2 downto 0) := (others => '0');
  signal m_axi_awregion                       : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axi_awqos                          : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axi_awvalid                        : std_logic := '0';
  signal m_axi_awready                        : std_logic := '0';
  signal m_axi_wdata                          : std_logic_vector(31 downto 0) := (others => '0');
  signal m_axi_wstrb                          : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axi_wlast                          : std_logic := '0';
  signal m_axi_wvalid                         : std_logic := '0';
  signal m_axi_wready                         : std_logic := '0';
  signal m_axi_bresp                          : std_logic_vector(1 downto 0) := (others => '0');
  signal m_axi_bvalid                         : std_logic := '0';
  signal m_axi_bready                         : std_logic := '0';
  signal m_axi_araddr                         : std_logic_vector(39 downto 0) := (others => '0');
  signal m_axi_arlen                          : std_logic_vector(7 downto 0) := (others => '0');
  signal m_axi_arsize                         : std_logic_vector(2 downto 0) := (others => '0');
  signal m_axi_arburst                        : std_logic_vector(1 downto 0) := (others => '0');
  signal m_axi_arlock                         : std_logic_vector(0 downto 0) := (others => '0');
  signal m_axi_arcache                        : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axi_arprot                         : std_logic_vector(2 downto 0) := (others => '0');
  signal m_axi_arregion                       : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axi_arqos                          : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axi_arvalid                        : std_logic := '0';
  signal m_axi_arready                        : std_logic := '0';
  signal m_axi_rdata                          : std_logic_vector(31 downto 0) := (others => '0');
  signal m_axi_rresp                          : std_logic_vector(1 downto 0) := (others => '0');
  signal m_axi_rlast                          : std_logic := '0';
  signal m_axi_rvalid                         : std_logic := '0';
  signal m_axi_rready                         : std_logic;
begin

  i_zynqmp   : component zynq_ultra_ps_e_0
    port map (
      maxihpm0_fpd_aclk        => axi_aclk_i,
      maxigp0_awid             => maxigp0_awid,
      maxigp0_awaddr           => maxigp0_awaddr,
      maxigp0_awlen            => maxigp0_awlen,
      maxigp0_awsize           => maxigp0_awsize,
      maxigp0_awburst          => maxigp0_awburst,
      maxigp0_awlock           => maxigp0_awlock,
      maxigp0_awcache          => maxigp0_awcache,
      maxigp0_awprot           => maxigp0_awprot,
      maxigp0_awvalid          => maxigp0_awvalid,
      maxigp0_awuser           => maxigp0_awuser,
      maxigp0_awready          => maxigp0_awready,
      maxigp0_wdata            => maxigp0_wdata,
      maxigp0_wstrb            => maxigp0_wstrb,
      maxigp0_wlast            => maxigp0_wlast,
      maxigp0_wvalid           => maxigp0_wvalid,
      maxigp0_wready           => maxigp0_wready,
      maxigp0_bid              => maxigp0_bid,
      maxigp0_bresp            => maxigp0_bresp,
      maxigp0_bvalid           => maxigp0_bvalid,
      maxigp0_bready           => maxigp0_bready,
      maxigp0_arid             => maxigp0_arid,
      maxigp0_araddr           => maxigp0_araddr,
      maxigp0_arlen            => maxigp0_arlen,
      maxigp0_arsize           => maxigp0_arsize,
      maxigp0_arburst          => maxigp0_arburst,
      maxigp0_arlock           => maxigp0_arlock,
      maxigp0_arcache          => maxigp0_arcache,
      maxigp0_arprot           => maxigp0_arprot,
      maxigp0_arvalid          => maxigp0_arvalid,
      maxigp0_aruser           => maxigp0_aruser,
      maxigp0_arready          => maxigp0_arready,
      maxigp0_rid              => maxigp0_rid,
      maxigp0_rdata            => maxigp0_rdata,
      maxigp0_rresp            => maxigp0_rresp,
      maxigp0_rlast            => maxigp0_rlast,
      maxigp0_rvalid           => maxigp0_rvalid,
      maxigp0_rready           => maxigp0_rready,
      maxigp0_awqos            => maxigp0_awqos,
      maxigp0_arqos            => maxigp0_arqos,
      maxihpm1_fpd_aclk        => axi_aclk_i,
      maxigp1_awid             => maxigp1_awid,
      maxigp1_awaddr           => maxigp1_awaddr,
      maxigp1_awlen            => maxigp1_awlen,
      maxigp1_awsize           => maxigp1_awsize,
      maxigp1_awburst          => maxigp1_awburst,
      maxigp1_awlock           => maxigp1_awlock,
      maxigp1_awcache          => maxigp1_awcache,
      maxigp1_awprot           => maxigp1_awprot,
      maxigp1_awvalid          => maxigp1_awvalid,
      maxigp1_awuser           => maxigp1_awuser,
      maxigp1_awready          => maxigp1_awready,
      maxigp1_wdata            => maxigp1_wdata,
      maxigp1_wstrb            => maxigp1_wstrb,
      maxigp1_wlast            => maxigp1_wlast,
      maxigp1_wvalid           => maxigp1_wvalid,
      maxigp1_wready           => maxigp1_wready,
      maxigp1_bid              => maxigp1_bid,
      maxigp1_bresp            => maxigp1_bresp,
      maxigp1_bvalid           => maxigp1_bvalid,
      maxigp1_bready           => maxigp1_bready,
      maxigp1_arid             => maxigp1_arid,
      maxigp1_araddr           => maxigp1_araddr,
      maxigp1_arlen            => maxigp1_arlen,
      maxigp1_arsize           => maxigp1_arsize,
      maxigp1_arburst          => maxigp1_arburst,
      maxigp1_arlock           => maxigp1_arlock,
      maxigp1_arcache          => maxigp1_arcache,
      maxigp1_arprot           => maxigp1_arprot,
      maxigp1_arvalid          => maxigp1_arvalid,
      maxigp1_aruser           => maxigp1_aruser,
      maxigp1_arready          => maxigp1_arready,
      maxigp1_rid              => maxigp1_rid,
      maxigp1_rdata            => maxigp1_rdata,
      maxigp1_rresp            => maxigp1_rresp,
      maxigp1_rlast            => maxigp1_rlast,
      maxigp1_rvalid           => maxigp1_rvalid,
      maxigp1_rready           => maxigp1_rready,
      maxigp1_awqos            => maxigp1_awqos,
      maxigp1_arqos            => maxigp1_arqos,
      maxihpm0_lpd_aclk        => axi_aclk_i,
      maxigp2_awid             => maxigp2_awid,
      maxigp2_awaddr           => maxigp2_awaddr,
      maxigp2_awlen            => maxigp2_awlen,
      maxigp2_awsize           => maxigp2_awsize,
      maxigp2_awburst          => maxigp2_awburst,
      maxigp2_awlock           => maxigp2_awlock,
      maxigp2_awcache          => maxigp2_awcache,
      maxigp2_awprot           => maxigp2_awprot,
      maxigp2_awvalid          => maxigp2_awvalid,
      maxigp2_awuser           => maxigp2_awuser,
      maxigp2_awready          => maxigp2_awready,
      maxigp2_wdata            => maxigp2_wdata,
      maxigp2_wstrb            => maxigp2_wstrb,
      maxigp2_wlast            => maxigp2_wlast,
      maxigp2_wvalid           => maxigp2_wvalid,
      maxigp2_wready           => maxigp2_wready,
      maxigp2_bid              => maxigp2_bid,
      maxigp2_bresp            => maxigp2_bresp,
      maxigp2_bvalid           => maxigp2_bvalid,
      maxigp2_bready           => maxigp2_bready,
      maxigp2_arid             => maxigp2_arid,
      maxigp2_araddr           => maxigp2_araddr,
      maxigp2_arlen            => maxigp2_arlen,
      maxigp2_arsize           => maxigp2_arsize,
      maxigp2_arburst          => maxigp2_arburst,
      maxigp2_arlock           => maxigp2_arlock,
      maxigp2_arcache          => maxigp2_arcache,
      maxigp2_arprot           => maxigp2_arprot,
      maxigp2_arvalid          => maxigp2_arvalid,
      maxigp2_aruser           => maxigp2_aruser,
      maxigp2_arready          => maxigp2_arready,
      maxigp2_rid              => maxigp2_rid,
      maxigp2_rdata            => maxigp2_rdata,
      maxigp2_rresp            => maxigp2_rresp,
      maxigp2_rlast            => maxigp2_rlast,
      maxigp2_rvalid           => maxigp2_rvalid,
      maxigp2_rready           => maxigp2_rready,
      maxigp2_awqos            => maxigp2_awqos,
      maxigp2_arqos            => maxigp2_arqos,
      saxihp0_fpd_aclk         => saxihp0_fpd_aclk,
      saxigp2_aruser           => saxigp2_aruser,
      saxigp2_awuser           => saxigp2_awuser,
      saxigp2_awid             => saxigp2_awid,
      saxigp2_awaddr           => saxigp2_awaddr,
      saxigp2_awlen            => saxigp2_awlen,
      saxigp2_awsize           => saxigp2_awsize,
      saxigp2_awburst          => saxigp2_awburst,
      saxigp2_awlock           => saxigp2_awlock,
      saxigp2_awcache          => saxigp2_awcache,
      saxigp2_awprot           => saxigp2_awprot,
      saxigp2_awvalid          => saxigp2_awvalid,
      saxigp2_awready          => saxigp2_awready,
      saxigp2_wdata            => saxigp2_wdata,
      saxigp2_wstrb            => saxigp2_wstrb,
      saxigp2_wlast            => saxigp2_wlast,
      saxigp2_wvalid           => saxigp2_wvalid,
      saxigp2_wready           => saxigp2_wready,
      saxigp2_bid              => saxigp2_bid,
      saxigp2_bresp            => saxigp2_bresp,
      saxigp2_bvalid           => saxigp2_bvalid,
      saxigp2_bready           => saxigp2_bready,
      saxigp2_arid             => saxigp2_arid,
      saxigp2_araddr           => saxigp2_araddr,
      saxigp2_arlen            => saxigp2_arlen,
      saxigp2_arsize           => saxigp2_arsize,
      saxigp2_arburst          => saxigp2_arburst,
      saxigp2_arlock           => saxigp2_arlock,
      saxigp2_arcache          => saxigp2_arcache,
      saxigp2_arprot           => saxigp2_arprot,
      saxigp2_arvalid          => saxigp2_arvalid,
      saxigp2_arready          => saxigp2_arready,
      saxigp2_rid              => saxigp2_rid,
      saxigp2_rdata            => saxigp2_rdata,
      saxigp2_rresp            => saxigp2_rresp,
      saxigp2_rlast            => saxigp2_rlast,
      saxigp2_rvalid           => saxigp2_rvalid,
      saxigp2_rready           => saxigp2_rready,
      saxigp2_awqos            => saxigp2_awqos,
      saxigp2_arqos            => saxigp2_arqos,
      pl_ps_irq0               => pl_ps_irq0,
      pl_ps_irq1               => pl_ps_irq1,
      pl_resetn0               => ext_reset_i,
      pl_clk0                  => pl_clk_i(0),
      pl_clk1                  => pl_clk_i(1),
      pl_clk2                  => pl_clk_i(2),
      pl_clk3                  => pl_clk_i(3)
    );

  i_ps_reset : component proc_sys_reset_0
    port map (
      slowest_sync_clk         => axi_aclk_i,
      ext_reset_in             => ext_reset_i,
      aux_reset_in             => aux_rstb,
      mb_debug_sys_rst         => mb_debug_sys_rst,
      dcm_locked               => dcm_locked,
      mb_reset                 => open,
      bus_struct_reset(0)      => bus_struct_reset_i,
      peripheral_reset(0)      => peripheral_reset_i,
      interconnect_aresetn(0)  => interconnect_aresetn_i,
      peripheral_aresetn(0)    => peripheral_aresetn_i
    );

  i_dw_128to32 : component axi_dwidth_converter_0
    port map (
      s_axi_aclk               => axi_aclk_i,
      s_axi_aresetn            => interconnect_aresetn_i,
      s_axi_awid               => maxigp0_awid,
      s_axi_awaddr             => maxigp0_awaddr,
      s_axi_awlen              => maxigp0_awlen,
      s_axi_awsize             => maxigp0_awsize,
      s_axi_awburst            => maxigp0_awburst,
      s_axi_awlock(0)          => maxigp0_awlock,
      s_axi_awcache            => maxigp0_awcache,
      s_axi_awprot             => maxigp0_awprot,
      s_axi_awregion           => "0000",
      s_axi_awqos              => maxigp0_awqos,
      s_axi_awvalid            => maxigp0_awvalid,
      s_axi_awready            => maxigp0_awready,
      s_axi_wdata              => maxigp0_wdata,
      s_axi_wstrb              => maxigp0_wstrb,
      s_axi_wlast              => maxigp0_wlast,
      s_axi_wvalid             => maxigp0_wvalid,
      s_axi_wready             => maxigp0_wready,
      s_axi_bid                => maxigp0_bid,
      s_axi_bresp              => maxigp0_bresp,
      s_axi_bvalid             => maxigp0_bvalid,
      s_axi_bready             => maxigp0_bready,
      s_axi_arid               => maxigp0_arid,
      s_axi_araddr             => maxigp0_araddr,
      s_axi_arlen              => maxigp0_arlen,
      s_axi_arsize             => maxigp0_arsize,
      s_axi_arburst            => maxigp0_arburst,
      s_axi_arlock(0)          => maxigp0_arlock,
      s_axi_arcache            => maxigp0_arcache,
      s_axi_arprot             => maxigp0_arprot,
      s_axi_arregion           => "0000",
      s_axi_arqos              => maxigp0_arqos,
      s_axi_arvalid            => maxigp0_arvalid,
      s_axi_arready            => maxigp0_arready,
      s_axi_rid                => maxigp0_rid,
      s_axi_rdata              => maxigp0_rdata,
      s_axi_rresp              => maxigp0_rresp,
      s_axi_rlast              => maxigp0_rlast,
      s_axi_rvalid             => maxigp0_rvalid,
      s_axi_rready             => maxigp0_rready,
      m_axi_awaddr             => m_axi_awaddr,
      m_axi_awlen              => m_axi_awlen,
      m_axi_awsize             => m_axi_awsize,
      m_axi_awburst            => m_axi_awburst,
      m_axi_awlock             => m_axi_awlock,
      m_axi_awcache            => m_axi_awcache,
      m_axi_awprot             => m_axi_awprot,
      m_axi_awregion           => m_axi_awregion,
      m_axi_awqos              => m_axi_awqos,
      m_axi_awvalid            => m_axi_awvalid,
      m_axi_awready            => m_axi_awready,
      m_axi_wdata              => m_axi_wdata,
      m_axi_wstrb              => m_axi_wstrb,
      m_axi_wlast              => m_axi_wlast,
      m_axi_wvalid             => m_axi_wvalid,
      m_axi_wready             => m_axi_wready,
      m_axi_bresp              => m_axi_bresp,
      m_axi_bvalid             => m_axi_bvalid,
      m_axi_bready             => m_axi_bready,
      m_axi_araddr             => m_axi_araddr,
      m_axi_arlen              => m_axi_arlen,
      m_axi_arsize             => m_axi_arsize,
      m_axi_arburst            => m_axi_arburst,
      m_axi_arlock             => m_axi_arlock,
      m_axi_arcache            => m_axi_arcache,
      m_axi_arprot             => m_axi_arprot,
      m_axi_arregion           => m_axi_arregion,
      m_axi_arqos              => m_axi_arqos,
      m_axi_arvalid            => m_axi_arvalid,
      m_axi_arready            => m_axi_arready,
      m_axi_rdata              => m_axi_rdata,
      m_axi_rresp              => m_axi_rresp,
      m_axi_rlast              => m_axi_rlast,
      m_axi_rvalid             => m_axi_rvalid,
      m_axi_rready             => m_axi_rready
    );

  axi_aclk_i                   <= pl_clk_i(1);
  axi_aclk                     <= axi_aclk_i;
  axi_iconn_aresetn            <= interconnect_aresetn_i;
  axi_peripheral_aresetn       <= peripheral_aresetn_i;
  axi_peripheral_reset         <= peripheral_reset_i;

  axi_ms_awaddr_hi             <= m_axi_awaddr(39 downto 32);
  axi_ms.aw.addr               <= m_axi_awaddr(31 downto 0);
  axi_ms.aw.id                 <= (others => '0');
  axi_ms.aw.len                <= m_axi_awlen;
  axi_ms.aw.size               <= m_axi_awsize;
  axi_ms.aw.burst              <= m_axi_awburst;
  axi_ms.aw.lock               <= m_axi_awlock(0);
  axi_ms.aw.cache              <= m_axi_awcache;
  axi_ms.aw.prot               <= m_axi_awprot;
  axi_ms.aw.qos                <= m_axi_awqos;
  axi_ms.aw.user               <= (others => '0');
  axi_ms.aw.valid              <= m_axi_awvalid;
  m_axi_awready                <= axi_sm.aw.ready;
  axi_ms.dw.data               <= m_axi_wdata;
  axi_ms.dw.strb               <= m_axi_wstrb;
  axi_ms.dw.last               <= m_axi_wlast;
  axi_ms.dw.valid              <= m_axi_wvalid;
  m_axi_wready                 <= axi_sm.dw.ready;
  m_axi_bresp                  <= axi_sm.b.resp;
  m_axi_bvalid                 <= axi_sm.b.valid;
  axi_ms.b.ready               <= m_axi_bready;
  axi_ms_awaddr_hi             <= m_axi_awaddr(39 downto 32);
  axi_ms.ar.addr               <= m_axi_araddr(31 downto 0);
  axi_ms.ar.id                 <= (others => '0');
  axi_ms.ar.len                <= m_axi_arlen;
  axi_ms.ar.size               <= m_axi_arsize;
  axi_ms.ar.burst              <= m_axi_arburst;
  axi_ms.ar.lock               <= m_axi_arlock(0);
  axi_ms.ar.cache              <= m_axi_arcache;
  axi_ms.ar.prot               <= m_axi_arprot;
  axi_ms.ar.qos                <= m_axi_arqos;
  axi_ms.ar.user               <= (others => '0');
  axi_ms.ar.valid              <= m_axi_arvalid;
  m_axi_arready                <= axi_sm.ar.ready;
  m_axi_rdata                  <= axi_sm.dr.data;
  m_axi_rresp                  <= axi_sm.dr.resp;
  m_axi_rlast                  <= axi_sm.dr.last;
  m_axi_rvalid                 <= axi_sm.dr.valid;
  axi_ms.dr.ready              <= m_axi_rready;

end architecture rtl;
