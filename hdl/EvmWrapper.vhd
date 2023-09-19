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
    axi_ms                   : in  typ_arr_axi_ms(2 downto 0);
    axi_sm                   : out typ_arr_axi_sm(2 downto 0);

    irq_evg                  : out std_logic;
    irq_evru                 : out std_logic;
    irq_evrd                 : out std_logic
  );
end entity EvmWrapper;

architecture Mapping of EvmWrapper is

  type   arr_axi_m2s is array(natural range <>) of rec_axi_m2s;
  type   arr_axi_s2m is array(natural range <>) of rec_axi_s2m;

  signal s00_axi_m2s        : arr_axi_m2s(axi_ms'range);
  signal s00_axi_s2m        : arr_axi_s2m(axi_sm'range);

  signal axi_ms_evm         : typ_arr_axi_ms(axi_ms'range);
  signal axi_sm_evm         : typ_arr_axi_sm(axi_sm'range);
  signal axi_aclk_evm       : std_logic_vector(axi_ms'range);
  signal axi_arstn_evm      : std_logic_vector(axi_ms'range) := (others => '1');

  signal event_clk          : std_logic;
  signal event_rstn         : std_logic := '1';

begin

  axi_aclk_evm  <= ( others => event_clk  );
  axi_arstn_evm <= ( others => event_rstn );

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
      event_clk_o                 => event_clk,

      LED_SDT                     => LED_SDT,
      LED_SCK                     => LED_SCK,

      FP_LEMO_IN_0                => FP_LEMO_IN_0,
      FP_LEMO_IN_1                => FP_LEMO_IN_1,

      TBIN                        => TBIN,

      evg_axi_aclk                => event_clk,
      evg_axi_aresetn             => event_rstn,

      evg_axi_m2s                 => s00_axi_m2s(0),
      evg_axi_s2m                 => s00_axi_s2m(0),
      evrd_axi_m2s                => s00_axi_m2s(1),
      evrd_axi_s2m                => s00_axi_s2m(1),

      IRQ_EVG                     => irq_evg,
      IRQ_EVRD                    => irq_evrd,
      IRQ_EVRU                    => irq_evru
    );

  G_CLOCK_CONV : for i in axi_ms'range generate

    i_clk_cvt_evg : entity work.Axi4ClkConverter
      port map (
        s_axi_aclk                  => axi_aclk,
        s_axi_aresetn               => axi_aresetn,
        s_axi_ms                    => axi_ms(i),
        s_axi_sm                    => axi_sm(i),

        m_axi_aclk                  => axi_aclk_evm(i),
        m_axi_aresetn               => axi_arstn_evm(i),
        m_axi_ms                    => axi_ms_evm(i),
        m_axi_sm                    => axi_sm_evm(i)
      );

    s00_axi_m2s(i).arid <= axi_ms_evm(i).ar.id;
    s00_axi_m2s(i).araddr <= axi_ms_evm(i).ar.addr;
    s00_axi_m2s(i).arlen <= axi_ms_evm(i).ar.len;
    s00_axi_m2s(i).arsize <= axi_ms_evm(i).ar.size;
    s00_axi_m2s(i).arburst <= axi_ms_evm(i).ar.burst;
    s00_axi_m2s(i).arlock <= axi_ms_evm(i).ar.lock;
    s00_axi_m2s(i).arcache <= axi_ms_evm(i).ar.cache;
    s00_axi_m2s(i).arprot <= axi_ms_evm(i).ar.prot;
    s00_axi_m2s(i).arvalid <= axi_ms_evm(i).ar.valid;
    s00_axi_m2s(i).rready <= axi_ms_evm(i).dr.ready;
    s00_axi_m2s(i).awid <= axi_ms_evm(i).aw.id;
    s00_axi_m2s(i).awaddr <= axi_ms_evm(i).aw.addr;
    s00_axi_m2s(i).awlen <= axi_ms_evm(i).aw.len;
    s00_axi_m2s(i).awsize <= axi_ms_evm(i).aw.size;
    s00_axi_m2s(i).awburst <= axi_ms_evm(i).aw.burst;
    s00_axi_m2s(i).awlock <= axi_ms_evm(i).aw.lock;
    s00_axi_m2s(i).awcache <= axi_ms_evm(i).aw.cache;
    s00_axi_m2s(i).awprot <= axi_ms_evm(i).aw.prot;
    s00_axi_m2s(i).awvalid <= axi_ms_evm(i).aw.valid;
    s00_axi_m2s(i).wdata <= axi_ms_evm(i).dw.data;
    s00_axi_m2s(i).wstrb <= axi_ms_evm(i).dw.strb;
    s00_axi_m2s(i).wlast <= axi_ms_evm(i).dw.last;
    s00_axi_m2s(i).wvalid <= axi_ms_evm(i).dw.valid;
    s00_axi_m2s(i).bready <= axi_ms_evm(i).b.ready;

    axi_sm_evm(i).ar.ready <= s00_axi_s2m(i).arready;
    axi_sm_evm(i).dr.id <= s00_axi_s2m(i).rid;
    axi_sm_evm(i).dr.data <= s00_axi_s2m(i).rdata;
    axi_sm_evm(i).dr.resp <= s00_axi_s2m(i).rresp;
    axi_sm_evm(i).dr.last <= s00_axi_s2m(i).rlast;
    axi_sm_evm(i).dr.user <= (others => '0');
    axi_sm_evm(i).dr.valid <= s00_axi_s2m(i).rvalid;

    axi_sm_evm(i).aw.ready <= s00_axi_s2m(i).awready;
    axi_sm_evm(i).dw.ready <= s00_axi_s2m(i).wready;

    axi_sm_evm(i).b.id <= s00_axi_s2m(i).bid;
    axi_sm_evm(i).b.resp <= s00_axi_s2m(i).bresp;
    axi_sm_evm(i).b.user <= (others => '0');
    axi_sm_evm(i).b.valid <= s00_axi_s2m(i).bvalid;

  end generate G_CLOCK_CONV;


end architecture Mapping;
