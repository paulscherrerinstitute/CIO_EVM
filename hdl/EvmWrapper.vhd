-- wrap the EVM using psi_common rec_axi_ms/sm
library ieee;
use ieee.std_logic_1164.all;

use work.psi_common_axi_pkg.all;
use work.axi_opb_pkg.all;

entity EvmWrapper is
  generic (
    C_CLKSYN_DIFFCLK_DIV2  : boolean
  );
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

    CLK_A_FPGA_DP_GC       : in std_logic;
    CLK_B_FPGA_DP_GC       : in std_logic;

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
    CLKSYN_CLK_O             : out std_logic;
    RECCLK_O                 : out std_logic;

    LED_SDT                  : out std_logic;
    LED_SCK                  : out std_logic;

    FP_LEMO_IN_0             : in std_logic;
    FP_LEMO_IN_1             : in std_logic;
    TBIN                     : in std_logic_vector(0 to 7);

    axi_aclk                 : in  std_logic;
    axi_aresetn              : in  std_logic;
    axi_ms                   : in  rec_axi_ms;
    axi_sm                   : out rec_axi_sm;

    irq_evg                  : out std_logic;
    irq_evru                 : out std_logic;
    irq_evrd                 : out std_logic
  );
end entity EvmWrapper;

architecture Mapping of EvmWrapper is

  signal s00_axi_m2s        : rec_axi_m2s;
  signal s00_axi_s2m        : rec_axi_s2m;

begin

  i_evm : entity work.evm_cio
    generic map (
      C_DIFFCLK_DIV2              => C_CLKSYN_DIFFCLK_DIV2
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

      CLK_A_FPGA_DP_GC            => CLK_A_FPGA_DP_GC,
      CLK_B_FPGA_DP_GC            => CLK_B_FPGA_DP_GC,

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
      CLKSYN_CLK_O                => CLKSYN_CLK_O,
      RECCLK_O                    => RECCLK_O,

      LED_SDT                     => LED_SDT,
      LED_SCK                     => LED_SCK,

      FP_LEMO_IN_0                => FP_LEMO_IN_0,
      FP_LEMO_IN_1                => FP_LEMO_IN_1,

      TBIN                        => TBIN,

      s00_axi_aclk                => axi_aclk,
      s00_axi_aresetn             => axi_aresetn,

      s00_axi_m2s                 => s00_axi_m2s,
      s00_axi_s2m                 => s00_axi_s2m,

      IRQ_EVG                     => irq_evg,
      IRQ_EVRD                    => irq_evrd,
      IRQ_EVRU                    => irq_evru
    );

  s00_axi_m2s.arid <= axi_ms.ar.id;
  s00_axi_m2s.araddr <= axi_ms.ar.addr;
  s00_axi_m2s.arlen <= axi_ms.ar.len;
  s00_axi_m2s.arsize <= axi_ms.ar.size;
  s00_axi_m2s.arburst <= axi_ms.ar.burst;
  s00_axi_m2s.arlock <= axi_ms.ar.lock;
  s00_axi_m2s.arcache <= axi_ms.ar.cache;
  s00_axi_m2s.arprot <= axi_ms.ar.prot;
  s00_axi_m2s.arvalid <= axi_ms.ar.valid;
  s00_axi_m2s.rready <= axi_ms.dr.ready;
  s00_axi_m2s.awid <= axi_ms.aw.id;
  s00_axi_m2s.awaddr <= axi_ms.aw.addr;
  s00_axi_m2s.awlen <= axi_ms.aw.len;
  s00_axi_m2s.awsize <= axi_ms.aw.size;
  s00_axi_m2s.awburst <= axi_ms.aw.burst;
  s00_axi_m2s.awlock <= axi_ms.aw.lock;
  s00_axi_m2s.awcache <= axi_ms.aw.cache;
  s00_axi_m2s.awprot <= axi_ms.aw.prot;
  s00_axi_m2s.awvalid <= axi_ms.aw.valid;
  s00_axi_m2s.wdata <= axi_ms.dw.data;
  s00_axi_m2s.wstrb <= axi_ms.dw.strb;
  s00_axi_m2s.wlast <= axi_ms.dw.last;
  s00_axi_m2s.wvalid <= axi_ms.dw.valid;
  s00_axi_m2s.bready <= axi_ms.b.ready;

  axi_sm.ar.ready <= s00_axi_s2m.arready;
  axi_sm.dr.id <= s00_axi_s2m.rid;
  axi_sm.dr.data <= s00_axi_s2m.rdata;
  axi_sm.dr.resp <= s00_axi_s2m.rresp;
  axi_sm.dr.last <= s00_axi_s2m.rlast;
  axi_sm.dr.user <= (others => '0');
  axi_sm.dr.valid <= s00_axi_s2m.rvalid;

  axi_sm.aw.ready <= s00_axi_s2m.awready;
  axi_sm.dw.ready <= s00_axi_s2m.wready;

  axi_sm.b.id <= s00_axi_s2m.bid;
  axi_sm.b.resp <= s00_axi_s2m.bresp;
  axi_sm.b.user <= (others => '0');
  axi_sm.b.valid <= s00_axi_s2m.bvalid;


end architecture Mapping;
