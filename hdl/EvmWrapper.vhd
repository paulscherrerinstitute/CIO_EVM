-- wrap the EVM using psi_common rec_axi_ms/sm
library ieee;
use ieee.std_logic_1164.all;

use work.psi_common_axi_pkg.all;

entity EvmWrapper is
  port (
    CLK_A_GTH_MSH_SFP1     : in std_logic;
    CLK_B_GTH_QSFP1        : in std_logic;
    CLK_A_GTH_QSFP0        : in std_logic;
    CLK_B_GTH_QSFP0        : in std_logic;
    CLK_B_GTH_MSH          : in std_logic;
    CLK_A_GTH_MSH_SFP1_GT  : in std_logic;
    CLK_B_GTH_QSFP1_GT     : in std_logic;
    CLK_A_GTH_QSFP0_GT     : in std_logic;
    CLK_B_GTH_QSFP0_GT     : in std_logic;
    CLK_B_GTH_MSH_GT       : in std_logic;

    CLK_A_LOL_N            : in std_logic;
    CLK_B_LOL_N            : in std_logic;

    i_fanout_mgt_qsfp0_rx_p : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_fanout_mgt_qsfp0_rx_n : in STD_LOGIC_VECTOR ( 3 downto 0 );
    o_fanout_mgt_qsfp0_tx_p : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_fanout_mgt_qsfp0_tx_n : out STD_LOGIC_VECTOR ( 3 downto 0 );

    i_fanout_mgt_qsfp1_rx_p : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_fanout_mgt_qsfp1_rx_n : in STD_LOGIC_VECTOR ( 3 downto 0 );
    o_fanout_mgt_qsfp1_tx_p : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_fanout_mgt_qsfp1_tx_n : out STD_LOGIC_VECTOR ( 3 downto 0 );

    i_fanout_mgt_p6_8765_rx_p : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_fanout_mgt_p6_8765_rx_n : in STD_LOGIC_VECTOR ( 3 downto 0 );
    o_fanout_mgt_p6_8765_tx_p : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_fanout_mgt_p6_8765_tx_n : out STD_LOGIC_VECTOR ( 3 downto 0 );

    i_fanout_mgt_p6_432_rx_p : in  STD_LOGIC_VECTOR ( 3 downto 0 );
    i_fanout_mgt_p6_432_rx_n : in  STD_LOGIC_VECTOR ( 3 downto 0 );
    o_fanout_mgt_p6_432_tx_p : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_fanout_mgt_p6_432_tx_n : out STD_LOGIC_VECTOR ( 3 downto 0 );

    CLKSYN                   : out std_logic;

    LED_SDT                  : out std_logic;
    LED_SCK                  : out std_logic;

    FP_LEMO_IN_0             : in std_logic;
    FP_LEMO_IN_1             : in std_logic;
    TBIN                     : in std_logic_vector(0 to 7);

    axi_aclk                 : in  std_logic;
    axi_aresetn              : in  std_logic;
    axi_ms                   : in  rec_axi_ms;
    axi_sm                   : out rec_axi_sm
  );
end entity EvmWrapper;

architecture Mapping of EvmWrapper is

  signal axi_wdata_int            : std_logic_vector(63 downto 0);
  signal axi_wstrb_int            : std_logic_vector( 7 downto 0);
  signal axi_rdata_int            : std_logic_vector(63 downto 0);
begin

  -- data width is hardcoded to 64 (despite generic) even though
  -- internally only 32 bits are supported.
  axi_wstrb_int( 7 downto  4)     <= (others => '0');
  axi_wstrb_int( 3 downto  0)     <= axi_ms.dw.strb;
  axi_wdata_int(63 downto 32)     <= (others => '0');
  axi_wdata_int(31 downto  0)     <= axi_ms.dw.data;

  axi_sm.dr.data                  <= axi_rdata_int(31 downto 0);

  i_evm : entity work.evm_cio
    generic map (
      C_S00_AXI_ID_WIDTH          => C_S_AXI_ID_WIDTH,
      C_S00_AXI_ADDR_WIDTH        => C_S_AXI_ADDR_WIDTH,
      C_S00_AXI_ARUSER_WIDTH      => C_S_AXI_ARUSER_WIDTH,
      C_S00_AXI_RUSER_WIDTH       => C_S_AXI_RUSER_WIDTH,
      C_S00_AXI_AWUSER_WIDTH      => C_S_AXI_AWUSER_WIDTH,
      C_S00_AXI_WUSER_WIDTH       => C_S_AXI_WUSER_WIDTH,
      C_S00_AXI_BUSER_WIDTH       => C_S_AXI_BUSER_WIDTH
    )
    port map (
      CLK_A_GTH_MSH_SFP1          => CLK_A_GTH_MSH_SFP1,
      CLK_B_GTH_QSFP1             => CLK_B_GTH_QSFP1,
      CLK_A_GTH_QSFP0             => CLK_A_GTH_QSFP0,
      CLK_B_GTH_QSFP0             => CLK_B_GTH_QSFP0,
      CLK_B_GTH_MSH               => CLK_B_GTH_MSH,
      CLK_A_GTH_MSH_SFP1_GT       => CLK_A_GTH_MSH_SFP1_GT,
      CLK_B_GTH_QSFP1_GT          => CLK_B_GTH_QSFP1_GT,
      CLK_A_GTH_QSFP0_GT          => CLK_A_GTH_QSFP0_GT,
      CLK_B_GTH_QSFP0_GT          => CLK_B_GTH_QSFP0_GT,
      CLK_B_GTH_MSH_GT            => CLK_B_GTH_MSH_GT,

      CLK_A_LOL_N                 => CLK_A_LOL_N,
      CLK_B_LOL_N                 => CLK_B_LOL_N,

      i_fanout_mgt_qsfp0_rx_p     => i_fanout_mgt_qsfp0_rx_p,
      i_fanout_mgt_qsfp0_rx_n     => i_fanout_mgt_qsfp0_rx_n,
      o_fanout_mgt_qsfp0_tx_p     => o_fanout_mgt_qsfp0_tx_p,
      o_fanout_mgt_qsfp0_tx_n     => o_fanout_mgt_qsfp0_tx_n,

      i_fanout_mgt_qsfp1_rx_p     => i_fanout_mgt_qsfp1_rx_p,
      i_fanout_mgt_qsfp1_rx_n     => i_fanout_mgt_qsfp1_rx_n,
      o_fanout_mgt_qsfp1_tx_p     => o_fanout_mgt_qsfp1_tx_p,
      o_fanout_mgt_qsfp1_tx_n     => o_fanout_mgt_qsfp1_tx_n,

      i_fanout_mgt_p6_8765_rx_p   => i_fanout_mgt_p6_8765_rx_p,
      i_fanout_mgt_p6_8765_rx_n   => i_fanout_mgt_p6_8765_rx_n,
      o_fanout_mgt_p6_8765_tx_p   => o_fanout_mgt_p6_8765_tx_p,
      o_fanout_mgt_p6_8765_tx_n   => o_fanout_mgt_p6_8765_tx_n,

      i_fanout_mgt_p6_432_rx_p    => i_fanout_mgt_p6_432_rx_p,
      i_fanout_mgt_p6_432_rx_n    => i_fanout_mgt_p6_432_rx_n,
      o_fanout_mgt_p6_432_tx_p    => o_fanout_mgt_p6_432_tx_p,
      o_fanout_mgt_p6_432_tx_n    => o_fanout_mgt_p6_432_tx_n,

      CLKSYN                      => CLKSYN,

      LED_SDT                     => LED_SDT,
      LED_SCK                     => LED_SCK,

      FP_LEMO_IN_0                => FP_LEMO_IN_0,
      FP_LEMO_IN_1                => FP_LEMO_IN_1,

      TBIN                        => TBIN,

      s00_axi_aclk                => axi_aclk,
      s00_axi_aresetn             => axi_aresetn,
      s00_axi_awaddr              => axi_ms.aw.addr,
      s00_axi_awid                => axi_ms.aw.id,
      s00_axi_awlen               => axi_ms.aw.len,
      s00_axi_awsize              => axi_ms.aw.size,
      s00_axi_awburst             => axi_ms.aw.burst,
      s00_axi_awlock              => axi_ms.aw.lock,
      s00_axi_awcache             => axi_ms.aw.cache,
      s00_axi_awprot              => axi_ms.aw.prot,
      s00_axi_awvalid             => axi_ms.aw.valid,
      s00_axi_awready             => axi_sm.aw.ready,
      s00_axi_wdata               => axi_wdata_int,
      s00_axi_wstrb               => axi_wstrb_int,
      s00_axi_wlast               => axi_ms.dw.last,
      s00_axi_wvalid              => axi_ms.dw.valid,
      s00_axi_wready              => axi_sm.dw.ready,
      s00_axi_bresp               => axi_sm.b.resp,
      s00_axi_bvalid              => axi_sm.b.valid,
      s00_axi_bready              => axi_ms.b.ready,
      s00_axi_araddr              => axi_ms.ar.addr,
      s00_axi_arid                => axi_ms.ar.id,
      s00_axi_arlen               => axi_ms.ar.len,
      s00_axi_arsize              => axi_ms.ar.size,
      s00_axi_arburst             => axi_ms.ar.burst,
      s00_axi_arlock              => axi_ms.ar.lock,
      s00_axi_arcache             => axi_ms.ar.cache,
      s00_axi_arprot              => axi_ms.ar.prot,
      s00_axi_arvalid             => axi_ms.ar.valid,
      s00_axi_arready             => axi_sm.ar.ready,
      s00_axi_rdata               => axi_rdata_int,
      s00_axi_rresp               => axi_sm.dr.resp,
      s00_axi_rlast               => axi_sm.dr.last,
      s00_axi_rvalid              => axi_sm.dr.valid,
      s00_axi_rready              => axi_ms.dr.ready
    );
end architecture Mapping;
