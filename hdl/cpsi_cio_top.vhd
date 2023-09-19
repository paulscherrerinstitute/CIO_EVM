--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Wed Jul 28 15:30:53 2021
--Host        : PC13364 running 64-bit major release  (build 9200)
--Command     : generate_target cpsi_cio_top_top.bd
--Design      : cpsi_cio_top_top
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use     UNISIM.VCOMPONENTS.ALL;

use     work.psi_common_axi_pkg.all;

entity cpsi_cio_top is
 generic (
   G_FW_GIT_VERSION      : std_logic_vector(255 downto 0) := (others=>'1');
   G_FW_BUILD_DATE_TIME  : std_logic_vector(159 downto 0) := (others=>'1');
   G_ID_FACILITY         : string                         := "CPSI-S";
   G_ID_PROJECT          : string                         := "EVM"
   );
 port (
    CLK_A_GTH_MSH_SFP1_N : in STD_LOGIC;   -- Q229, refclk0, from CLKA OUT9
    CLK_A_GTH_MSH_SFP1_P : in STD_LOGIC;
    CLK_A_GTH_QSFP0_N : in STD_LOGIC;      -- Q128, refclk0, from CLKA OUT8
    CLK_A_GTH_QSFP0_P : in STD_LOGIC;
    CLK_B_GTH_MSH_N : in STD_LOGIC;        -- Q230, refclk0, from CLKB OUT7
    CLK_B_GTH_MSH_P : in STD_LOGIC;
    CLK_B_GTH_QSFP0_N : in STD_LOGIC;      -- Q128, refclk1, from CLKB OUT8
    CLK_B_GTH_QSFP0_P : in STD_LOGIC;
    CLK_B_GTH_QSFP1_N : in STD_LOGIC;      -- Q228, refclk0, from CLKB OUT9
    CLK_B_GTH_QSFP1_P : in STD_LOGIC;
    CLK_A_GTH_MSH_SFP1_OUT_N : out STD_LOGIC;
    CLK_A_GTH_MSH_SFP1_OUT_P : out STD_LOGIC;
    L1_GBT_MSH_SFP_RX_N : in  STD_LOGIC;
    L1_GBT_MSH_SFP_RX_P : in  STD_LOGIC;
    L1_GBT_MSH_SFP_TX_N : out  STD_LOGIC;
    L1_GBT_MSH_SFP_TX_P : out  STD_LOGIC;
    CLK_A_FPGA_DP_OUT_P : out STD_LOGIC;
    CLK_A_FPGA_DP_OUT_N : out STD_LOGIC;
    CLK_A_FPGA_DP_GC_P  : in  STD_LOGIC;
    CLK_A_FPGA_DP_GC_N  : in  STD_LOGIC;
    CLK_B_FPGA_DP_GC_P  : in  STD_LOGIC;
    CLK_B_FPGA_DP_GC_N  : in  STD_LOGIC;
    CLK_A_LOL_N         : in STD_LOGIC;
    CLK_B_LOL_N         : in STD_LOGIC;
    FP_LEMO_IN_0        : in  STD_LOGIC;
    FP_LEMO_IN_1        : in  STD_LOGIC;
    FP_LEMO_EN_0        : out STD_LOGIC;
    FP_LEMO_EN_1        : out STD_LOGIC;
    FP_LEMO_OUT_0       : out STD_LOGIC;
    FP_LEMO_OUT_1       : out STD_LOGIC;
    QSFP0_RX0_N         : in STD_LOGIC;
    QSFP0_RX0_P         : in STD_LOGIC;
    QSFP0_RX1_N         : in STD_LOGIC;
    QSFP0_RX1_P         : in STD_LOGIC;
    QSFP0_RX2_N         : in STD_LOGIC;
    QSFP0_RX2_P         : in STD_LOGIC;
    QSFP0_RX3_N         : in STD_LOGIC;
    QSFP0_RX3_P         : in STD_LOGIC;
    QSFP0_TX0_N         : out STD_LOGIC;
    QSFP0_TX0_P         : out STD_LOGIC;
    QSFP0_TX1_N         : out STD_LOGIC;
    QSFP0_TX1_P         : out STD_LOGIC;
    QSFP0_TX2_N         : out STD_LOGIC;
    QSFP0_TX2_P         : out STD_LOGIC;
    QSFP0_TX3_N         : out STD_LOGIC;
    QSFP0_TX3_P         : out STD_LOGIC;
    QSFP1_RX0_N         : in STD_LOGIC;
    QSFP1_RX0_P         : in STD_LOGIC;
    QSFP1_RX1_N         : in STD_LOGIC;
    QSFP1_RX1_P         : in STD_LOGIC;
    QSFP1_RX2_N         : in STD_LOGIC;
    QSFP1_RX2_P         : in STD_LOGIC;
    QSFP1_RX3_N         : in STD_LOGIC;
    QSFP1_RX3_P         : in STD_LOGIC;
    QSFP1_TX0_N         : out STD_LOGIC;
    QSFP1_TX0_P         : out STD_LOGIC;
    QSFP1_TX1_N         : out STD_LOGIC;
    QSFP1_TX1_P         : out STD_LOGIC;
    QSFP1_TX2_N         : out STD_LOGIC;
    QSFP1_TX2_P         : out STD_LOGIC;
    QSFP1_TX3_N         : out STD_LOGIC;
    QSFP1_TX3_P         : out STD_LOGIC;
    L2_MSH_GBT_RX_N     : in STD_LOGIC;
    L2_MSH_GBT_RX_P     : in STD_LOGIC;
    L2_MSH_GBT_TX_N     : out STD_LOGIC;
    L2_MSH_GBT_TX_P     : out STD_LOGIC;
    L3_MSH_GBT_RX_N     : in STD_LOGIC;
    L3_MSH_GBT_RX_P     : in STD_LOGIC;
    L3_MSH_GBT_TX_N     : out STD_LOGIC;
    L3_MSH_GBT_TX_P     : out STD_LOGIC;
    L4_MSH_GBT_RX_N     : in STD_LOGIC;
    L4_MSH_GBT_RX_P     : in STD_LOGIC;
    L4_MSH_GBT_TX_N     : out STD_LOGIC;
    L4_MSH_GBT_TX_P     : out STD_LOGIC;
    L5_MSH_GBT_RX_N     : in STD_LOGIC;
    L5_MSH_GBT_RX_P     : in STD_LOGIC;
    L5_MSH_GBT_TX_N     : out STD_LOGIC;
    L5_MSH_GBT_TX_P     : out STD_LOGIC;
    L6_MSH_GBT_RX_N     : in STD_LOGIC;
    L6_MSH_GBT_RX_P     : in STD_LOGIC;
    L6_MSH_GBT_TX_N     : out STD_LOGIC;
    L6_MSH_GBT_TX_P     : out STD_LOGIC;
    L7_MSH_GBT_RX_N     : in STD_LOGIC;
    L7_MSH_GBT_RX_P     : in STD_LOGIC;
    L7_MSH_GBT_TX_N     : out STD_LOGIC;
    L7_MSH_GBT_TX_P     : out STD_LOGIC;
    L8_MSH_GBT_RX_N     : in STD_LOGIC;
    L8_MSH_GBT_RX_P     : in STD_LOGIC;
    L8_MSH_GBT_TX_N     : out STD_LOGIC;
    L8_MSH_GBT_TX_P     : out STD_LOGIC;
    ME_FPI_LED_SDTI     : out std_logic;
    ME_FPI_LED_SCKI     : out std_logic;
    RIO_04_P            : in std_logic;
    RIO_05_P            : in std_logic;
    RIO_06_P            : in std_logic;
    RIO_07_P            : in std_logic;
    RIO_08_P            : in std_logic;
    RIO_09_P            : in std_logic;
    RIO_10_P            : in std_logic;
    RIO_11_P            : in std_logic;
    RIO_12_P            : out std_logic;
    RIO_12_N            : out std_logic;
    RIO_13_P            : out std_logic;
    RIO_13_N            : out std_logic;
    RIO_14_P            : out std_logic;
    RIO_14_N            : out std_logic;
    RIO_15_P            : out std_logic;
    RIO_15_N            : out std_logic
  );

  attribute IO_BUFFER_TYPE : string;

  attribute IO_BUFFER_TYPE of CLK_A_GTH_MSH_SFP1_OUT_N      : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_A_GTH_MSH_SFP1_OUT_P      : signal is "NONE";
end entity cpsi_cio_top;

architecture STRUCTURE of cpsi_cio_top is

  -- defined by the TCL code that instantiates the AXI crossbar IP
  constant N_MST_C                             : natural := 7;
  constant FW_ID_IDX_C                         : natural := 0;
  constant CLKMS_IDX_C                         : natural := 1;
  constant FLEMO_IDX_C                         : natural := 2;
  constant T_DLY_IDX_C                         : natural := 3;
  constant EVM_IDX_C                           : natural := 4;
  constant EVRD_IDX_C                          : natural := 5;
  constant EVRU_IDX_C                          : natural := 6;

  constant N_CLK_MEAS_C                        : natural := 9;
  constant N_TRIGS_C                           : natural := 2;

  -- whether the EVM should divide the recovered clock by 2 in
  -- 'downsampled' fanout mode. We say no because we want the Si5395_A
  -- to always lock to the master at full rate. We then use the Si5395_A
  -- to generate the downsampled fanout clocks (MGT refclocks and
  -- parallel TX clock).
  constant C_CLKSYN_DIFFCLK_DIV2               : boolean := false;

  signal axiClk                                : std_logic;
  signal axiRst                                : std_logic;
  signal axiRstb                               : std_logic;
  signal axi_ms                                : rec_axi_ms;
  signal axi_sm                                : rec_axi_sm;
  signal irq                                   : std_logic_vector(15 downto 0);

  signal maxi_ms                               : typ_arr_axi_ms(N_MST_C - 1 downto 0);
  signal maxi_sm                               : typ_arr_axi_sm(N_MST_C - 1 downto 0)                := (others => C_AXI_SM_DEF);

  signal clocks                                : std_logic_vector(N_CLK_MEAS_C - 1 downto 0)         := (others => '0');
  signal trigInp                               : std_logic_vector(N_TRIGS_C    - 1 downto 0)         := (others => '0');
  signal trigOut                               : std_logic_vector(N_TRIGS_C    - 1 downto 0)         := (others => '0');

  signal delayClk                              : std_logic := '0';

  signal axi_ms_araddr_hi                      : std_logic_vector(39 downto 32);
  signal axi_ms_awaddr_hi                      : std_logic_vector(39 downto 32);

  signal CLK_A_GTH_MSH_SFP1                    : std_logic;
  signal CLK_A_GTH_QSFP0                       : std_logic;
  signal CLK_B_GTH_MSH                         : std_logic;
  signal CLK_B_GTH_QSFP0                       : std_logic;
  signal CLK_B_GTH_QSFP1                       : std_logic;

  signal irq_evru                              : std_logic := '0';
  signal irq_evrd                              : std_logic := '0';
  signal irq_evg                               : std_logic := '0';

  signal CLKSYN_CLK                            : std_logic;
  signal RX_REC_CLK                            : std_logic;
begin

  irq <= ( 0 => irq_evg, 1 => irq_evrd, 2 => irq_evru, others => '0');

  i_ps_wrp: entity work.ZynqMpPSWrapper
    port map (
      axi_aclk                          => axiClk,
      axi_peripheral_reset              => axiRst,
      axi_peripheral_aresetn            => axiRstb,
      pl_ps_irq0                        => irq( 7 downto 0),
      pl_ps_irq1                        => irq(15 downto 8),
      axi_ms_araddr_hi                  => axi_ms_araddr_hi,
      axi_ms_awaddr_hi                  => axi_ms_awaddr_hi,
      axi_ms                            => axi_ms,
      axi_sm                            => axi_sm
    );

  i_axi_xbar_wrp : entity work.AxiXbarWrapper
    port map (
      axi_aclk                          => axiClk,
      axi_aresetn                       => axiRstb,
      saxi_araddr_hi                    => axi_ms_araddr_hi,
      saxi_awaddr_hi                    => axi_ms_awaddr_hi,
      saxi_ms                           => axi_ms,
      saxi_sm                           => axi_sm,
      maxi_ms                           => maxi_ms,
      maxi_sm                           => maxi_sm
    );

  i_fw_id_wrp : entity work.AxiFwVersionWrapper
    generic map (
      C_ID_FACILITY                     => G_ID_FACILITY,
      C_ID_PROJECT                      => G_ID_PROJECT,
      C_REV_PINS                        => False
    )
    port map (
      param_fw_git_version_i            => G_FW_GIT_VERSION,
      param_fw_build_datetime_i         => G_FW_BUILD_DATE_TIME,

      rev_pins_i                        => open,

      axi_aclk                          => axiClk,
      axi_aresetn                       => axiRstb,
      axi_ms                            => maxi_ms(FW_ID_IDX_C),
      axi_sm                            => maxi_sm(FW_ID_IDX_C)
    );

  -- assign the same way it was done in the original BD
  clocks(0 downto 0)                    <= (others => '0');
  clocks(1)                             <= RX_REC_CLK;
  clocks(2)                             <= CLKSYN_CLK;
  clocks(3)                             <= CLK_A_GTH_MSH_SFP1;
  clocks(4)                             <= CLK_A_GTH_QSFP0;
  clocks(5)                             <= CLK_B_GTH_MSH;
  clocks(6)                             <= CLK_B_GTH_QSFP0;
  clocks(7)                             <= CLK_B_GTH_QSFP1;
  clocks(8)                             <= '0';

  i_clk_meas_wrp : entity work.ClkMeasureWrapper
    generic map (
      NumOfClocks_g                     => clocks'length,
      AxiClkFreq_g                      => 125_000_000,
      MaxClkFreq_g                      => 500_000_000
    )
    port map
    (
      Clocks                            => clocks,

      axi_aclk                          => axiClk,
      axi_aresetn                       => axiRstb,
      axi_ms                            => maxi_ms(CLKMS_IDX_C),
      axi_sm                            => maxi_sm(CLKMS_IDX_C)
    );

  i_tim320_wrp : entity work.Tim320TriggerWrapper
    generic map (
      C_S00_AXI_ADDR_WIDTH              => 14,
      C_NUM_TRIGGERS                    => trigInp'length
    )
    port map (
      i_delay_clk                       => delayClk,
      TRIGGER_IN                        => trigInp,
      TRIGGER_OUT                       => trigOut,

      axi_aclk                          => axiClk,
      axi_aresetn                       => axiRstb,
      axi_ms                            => maxi_ms(T_DLY_IDX_C),
      axi_sm                            => maxi_sm(T_DLY_IDX_C)
    );

  b_evm : block is

  signal CLK_A_GTH_MSH_SFP1_GT                 : std_logic;
  signal CLK_A_GTH_QSFP0_GT                    : std_logic;
  signal CLK_B_GTH_MSH_GT                      : std_logic;
  signal CLK_B_GTH_QSFP0_GT                    : std_logic;
  signal CLK_B_GTH_QSFP1_GT                    : std_logic;

  signal CLK_A_GTH_MSH_SFP1_ODIV2              : std_logic;
  signal CLK_A_GTH_QSFP0_ODIV2                 : std_logic;
  signal CLK_B_GTH_QSFP0_ODIV2                 : std_logic;
  signal CLK_B_GTH_QSFP1_ODIV2                 : std_logic;
  signal CLK_B_GTH_MSH_ODIV2                   : std_logic;

  signal CLK_A_FPGA_DP_GC_NB                   : std_logic;
  signal CLK_A_FPGA_DP_GC                      : std_logic;
  signal CLK_B_FPGA_DP_GC_NB                   : std_logic;
  signal CLK_B_FPGA_DP_GC                      : std_logic;

  signal slv_fanout_mgt_qsfp0_rx_p             : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp0_rx_n             : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp0_tx_p             : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp0_tx_n             : std_logic_vector(3 downto 0);

  signal slv_fanout_mgt_qsfp1_rx_p             : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp1_rx_n             : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp1_tx_p             : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp1_tx_n             : std_logic_vector(3 downto 0);

  signal slv_fanout_mgt_p6_8765_rx_p           : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_8765_rx_n           : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_8765_tx_p           : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_8765_tx_n           : std_logic_vector(3 downto 0);

  signal slv_fanout_mgt_p6_4321_rx_p           : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_4321_rx_n           : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_4321_tx_p           : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_4321_tx_n           : std_logic_vector(3 downto 0);

  signal CLKSYN                                : std_logic;

  begin

  i_ibufds_0   : component IBUFDS_GTE4
    generic map (
      REFCLK_HROW_CK_SEL                => "00"
    )
    port map (
      I                                 => CLK_A_GTH_MSH_SFP1_P,
      IB                                => CLK_A_GTH_MSH_SFP1_N,
      CEB                               => '0',
      O                                 => CLK_A_GTH_MSH_SFP1_GT,
      ODIV2                             => CLK_A_GTH_MSH_SFP1_ODIV2
    );

  i_ibufds_1   : component IBUFDS_GTE4
    generic map (
      REFCLK_HROW_CK_SEL                => "00"
    )
    port map (
      I                                 => CLK_A_GTH_QSFP0_P,
      IB                                => CLK_A_GTH_QSFP0_N,
      CEB                               => '0',
      O                                 => CLK_A_GTH_QSFP0_GT,
      ODIV2                             => CLK_A_GTH_QSFP0_ODIV2
    );

  i_ibufds_2   : component IBUFDS_GTE4
    generic map (
      REFCLK_HROW_CK_SEL                => "00"
    )
    port map (
      I                                 => CLK_B_GTH_QSFP0_P,
      IB                                => CLK_B_GTH_QSFP0_N,
      CEB                               => '0',
      O                                 => CLK_B_GTH_QSFP0_GT,
      ODIV2                             => CLK_B_GTH_QSFP0_ODIV2
    );

  i_ibufds_3   : component IBUFDS_GTE4
    generic map (
      REFCLK_HROW_CK_SEL                => "00"
    )
    port map (
      I                                 => CLK_B_GTH_QSFP1_P,
      IB                                => CLK_B_GTH_QSFP1_N,
      CEB                               => '0',
      O                                 => CLK_B_GTH_QSFP1_GT,
      ODIV2                             => CLK_B_GTH_QSFP1_ODIV2
    );

  i_ibufds_4   : component IBUFDS_GTE4
    generic map (
      REFCLK_HROW_CK_SEL                => "00"
    )
    port map (
      I                                 => CLK_B_GTH_MSH_P,
      IB                                => CLK_B_GTH_MSH_N,
      CEB                               => '0',
      O                                 => CLK_B_GTH_MSH_GT,
      ODIV2                             => CLK_B_GTH_MSH_ODIV2
    );

  i_ibufds_5   : component IBUFDS
    port map (
      I                                 => CLK_A_FPGA_DP_GC_P,
      IB                                => CLK_A_FPGA_DP_GC_N,
      O                                 => CLK_A_FPGA_DP_GC_NB
    );

  i_ibufds_6   : component IBUFDS
    port map (
      I                                 => CLK_B_FPGA_DP_GC_P,
      IB                                => CLK_B_FPGA_DP_GC_N,
      O                                 => CLK_B_FPGA_DP_GC_NB
    );


  i_bufg_0     : component BUFG_GT
    port map (
      I                                 => CLK_A_GTH_MSH_SFP1_ODIV2,
      O                                 => CLK_A_GTH_MSH_SFP1,
      CE                                => '1',
      CEMASK                            => '0',
      CLR                               => '0',
      CLRMASK                           => '0',
      DIV                               => "000"
    );

  i_bufg_1     : component BUFG_GT
    port map (
      I                                 => CLK_A_GTH_QSFP0_ODIV2,
      O                                 => CLK_A_GTH_QSFP0,
      CE                                => '1',
      CEMASK                            => '0',
      CLR                               => '0',
      CLRMASK                           => '0',
      DIV                               => "000"
    );

  i_bufg_2     : component BUFG_GT
    port map (
      I                                 => CLK_B_GTH_QSFP0_ODIV2,
      O                                 => CLK_B_GTH_QSFP0,
      CE                                => '1',
      CEMASK                            => '0',
      CLR                               => '0',
      CLRMASK                           => '0',
      DIV                               => "000"
    );

  i_bufg_3     : component BUFG_GT
    port map (
      I                                 => CLK_B_GTH_QSFP1_ODIV2,
      O                                 => CLK_B_GTH_QSFP1,
      CE                                => '1',
      CEMASK                            => '0',
      CLR                               => '0',
      CLRMASK                           => '0',
      DIV                               => "000"
    );

  i_bufg_4     : component BUFG_GT
    port map (
      I                                 => CLK_B_GTH_MSH_ODIV2,
      O                                 => CLK_B_GTH_MSH,
      CE                                => '1',
      CEMASK                            => '0',
      CLR                               => '0',
      CLRMASK                           => '0',
      DIV                               => "000"
    );

  i_bufg_5     : component BUFG
    port map (
      I                                 => CLK_A_FPGA_DP_GC_NB,
      O                                 => CLK_A_FPGA_DP_GC
    );

  i_bufg_6     : component BUFG
    port map (
      I                                 => CLK_B_FPGA_DP_GC_NB,
      O                                 => CLK_B_FPGA_DP_GC
    );

  i_obufds_syn : component OBUFDS
    port map (
      I                                 => CLKSYN,
      O                                 => CLK_A_FPGA_DP_OUT_P,
      OB                                => CLK_A_FPGA_DP_OUT_N
    );

  -- qsfp0, mgt128, x0y1
  slv_fanout_mgt_qsfp0_rx_p(0)          <= QSFP0_RX0_P;
  slv_fanout_mgt_qsfp0_rx_n(0)          <= QSFP0_RX0_N;
  slv_fanout_mgt_qsfp0_rx_p(1)          <= QSFP0_RX1_P;
  slv_fanout_mgt_qsfp0_rx_n(1)          <= QSFP0_RX1_N;
  slv_fanout_mgt_qsfp0_rx_p(2)          <= QSFP0_RX2_P;
  slv_fanout_mgt_qsfp0_rx_n(2)          <= QSFP0_RX2_N;
  slv_fanout_mgt_qsfp0_rx_p(3)          <= QSFP0_RX3_P;
  slv_fanout_mgt_qsfp0_rx_n(3)          <= QSFP0_RX3_N;

  -- qsfp1, mgt228, x1y1
  slv_fanout_mgt_qsfp1_rx_p(0)          <= QSFP1_RX0_P;
  slv_fanout_mgt_qsfp1_rx_n(0)          <= QSFP1_RX0_N;
  slv_fanout_mgt_qsfp1_rx_p(1)          <= QSFP1_RX1_P;
  slv_fanout_mgt_qsfp1_rx_n(1)          <= QSFP1_RX1_N;
  slv_fanout_mgt_qsfp1_rx_p(2)          <= QSFP1_RX2_P;
  slv_fanout_mgt_qsfp1_rx_n(2)          <= QSFP1_RX2_N;
  slv_fanout_mgt_qsfp1_rx_p(3)          <= QSFP1_RX3_P;
  slv_fanout_mgt_qsfp1_rx_n(3)          <= QSFP1_RX3_N;

  -- p6, port 8,7,6,5, mgt228 x1y3
  -- note the inverse mapping (0..3 -> 8..5)
  slv_fanout_mgt_p6_8765_rx_p(0)        <= L8_MSH_GBT_RX_P;
  slv_fanout_mgt_p6_8765_rx_n(0)        <= L8_MSH_GBT_RX_N;
  slv_fanout_mgt_p6_8765_rx_p(1)        <= L7_MSH_GBT_RX_P;
  slv_fanout_mgt_p6_8765_rx_n(1)        <= L7_MSH_GBT_RX_N;
  slv_fanout_mgt_p6_8765_rx_p(2)        <= L6_MSH_GBT_RX_P;
  slv_fanout_mgt_p6_8765_rx_n(2)        <= L6_MSH_GBT_RX_N;
  slv_fanout_mgt_p6_8765_rx_p(3)        <= L5_MSH_GBT_RX_P;
  slv_fanout_mgt_p6_8765_rx_n(3)        <= L5_MSH_GBT_RX_N;

  -- p6, port 4,3,2, SFP; mgt228 x1y2
  -- note the inverse mapping (0..3 -> 4..1)
  slv_fanout_mgt_p6_4321_rx_p(0)        <= L1_GBT_MSH_SFP_RX_P;
  slv_fanout_mgt_p6_4321_rx_n(0)        <= L1_GBT_MSH_SFP_RX_N;
  slv_fanout_mgt_p6_4321_rx_p(1)        <= L2_MSH_GBT_RX_P;
  slv_fanout_mgt_p6_4321_rx_n(1)        <= L2_MSH_GBT_RX_N;
  slv_fanout_mgt_p6_4321_rx_p(2)        <= L3_MSH_GBT_RX_P;
  slv_fanout_mgt_p6_4321_rx_n(2)        <= L3_MSH_GBT_RX_N;
  slv_fanout_mgt_p6_4321_rx_p(3)        <= L4_MSH_GBT_RX_P;
  slv_fanout_mgt_p6_4321_rx_n(3)        <= L4_MSH_GBT_RX_N;

  -- qsfp0, mgt128, x0y1
  QSFP0_TX0_P                           <=   slv_fanout_mgt_qsfp0_tx_p(0);
  QSFP0_TX0_N                           <=   slv_fanout_mgt_qsfp0_tx_n(0);
  QSFP0_TX1_P                           <=   slv_fanout_mgt_qsfp0_tx_p(1);
  QSFP0_TX1_N                           <=   slv_fanout_mgt_qsfp0_tx_n(1);
  QSFP0_TX2_P                           <=   slv_fanout_mgt_qsfp0_tx_p(2);
  QSFP0_TX2_N                           <=   slv_fanout_mgt_qsfp0_tx_n(2);
  QSFP0_TX3_P                           <=   slv_fanout_mgt_qsfp0_tx_p(3);
  QSFP0_TX3_N                           <=   slv_fanout_mgt_qsfp0_tx_n(3);

  -- qsfp1, mgt228, x1y1
  QSFP1_TX0_P                           <=   slv_fanout_mgt_qsfp1_tx_p(0);
  QSFP1_TX0_N                           <=   slv_fanout_mgt_qsfp1_tx_n(0);
  QSFP1_TX1_P                           <=   slv_fanout_mgt_qsfp1_tx_p(1);
  QSFP1_TX1_N                           <=   slv_fanout_mgt_qsfp1_tx_n(1);
  QSFP1_TX2_P                           <=   slv_fanout_mgt_qsfp1_tx_p(2);
  QSFP1_TX2_N                           <=   slv_fanout_mgt_qsfp1_tx_n(2);
  QSFP1_TX3_P                           <=   slv_fanout_mgt_qsfp1_tx_p(3);
  QSFP1_TX3_N                           <=   slv_fanout_mgt_qsfp1_tx_n(3);

  -- p6, port 8,7,6,5, mgt228 x1y3
  -- note the inverse mapping (0..3 -> 8..5)
  L8_MSH_GBT_TX_P                       <=   slv_fanout_mgt_p6_8765_tx_p(0);
  L8_MSH_GBT_TX_N                       <=   slv_fanout_mgt_p6_8765_tx_n(0);
  L7_MSH_GBT_TX_P                       <=   slv_fanout_mgt_p6_8765_tx_p(1);
  L7_MSH_GBT_TX_N                       <=   slv_fanout_mgt_p6_8765_tx_n(1);
  L6_MSH_GBT_TX_P                       <=   slv_fanout_mgt_p6_8765_tx_p(2);
  L6_MSH_GBT_TX_N                       <=   slv_fanout_mgt_p6_8765_tx_n(2);
  L5_MSH_GBT_TX_P                       <=   slv_fanout_mgt_p6_8765_tx_p(3);
  L5_MSH_GBT_TX_N                       <=   slv_fanout_mgt_p6_8765_tx_n(3);

  -- p6, port 4,3,2, SFP; mgt228 x1y2
  -- note the inverse mapping (0..3 -> 4..1)
  L1_GBT_MSH_SFP_TX_P                   <=   slv_fanout_mgt_p6_4321_tx_p(0);
  L1_GBT_MSH_SFP_TX_N                   <=   slv_fanout_mgt_p6_4321_tx_n(0);
  L2_MSH_GBT_TX_P                       <=   slv_fanout_mgt_p6_4321_tx_p(1);
  L2_MSH_GBT_TX_N                       <=   slv_fanout_mgt_p6_4321_tx_n(1);
  L3_MSH_GBT_TX_P                       <=   slv_fanout_mgt_p6_4321_tx_p(2);
  L3_MSH_GBT_TX_N                       <=   slv_fanout_mgt_p6_4321_tx_n(2);
  L4_MSH_GBT_TX_P                       <=   slv_fanout_mgt_p6_4321_tx_p(3);
  L4_MSH_GBT_TX_N                       <=   slv_fanout_mgt_p6_4321_tx_n(3);

  i_evm_wrp : entity work.EvmWrapper
    generic map (
      C_CLKSYN_DIFFCLK_DIV2     => C_CLKSYN_DIFFCLK_DIV2
    )
    port map  (
      CLK_A_GTH_MSH_SFP1        => CLK_A_GTH_MSH_SFP1,
      CLK_B_GTH_QSFP1           => CLK_B_GTH_QSFP1,
      CLK_A_GTH_QSFP0           => CLK_A_GTH_QSFP0,
      CLK_B_GTH_QSFP0           => CLK_B_GTH_QSFP0,
      CLK_B_GTH_MSH             => CLK_B_GTH_MSH,
      CLK_A_GTH_MSH_SFP1_GT     => CLK_A_GTH_MSH_SFP1_GT,
      CLK_B_GTH_QSFP1_GT        => CLK_B_GTH_QSFP1_GT,
      CLK_A_GTH_QSFP0_GT        => CLK_A_GTH_QSFP0_GT,
      CLK_B_GTH_QSFP0_GT        => CLK_B_GTH_QSFP0_GT,
      CLK_B_GTH_MSH_GT          => CLK_B_GTH_MSH_GT,

      CLK_A_FPGA_DP_GC          => CLK_A_FPGA_DP_GC,
      CLK_B_FPGA_DP_GC          => CLK_B_FPGA_DP_GC,

      CLK_A_LOL_N               => CLK_A_LOL_N,
      CLK_B_LOL_N               => CLK_B_LOL_N,


      i_fanout_mgt_qsfp0_rx_p   => slv_fanout_mgt_qsfp0_rx_p,
      i_fanout_mgt_qsfp0_rx_n   => slv_fanout_mgt_qsfp0_rx_n,
      o_fanout_mgt_qsfp0_tx_p   => slv_fanout_mgt_qsfp0_tx_p,
      o_fanout_mgt_qsfp0_tx_n   => slv_fanout_mgt_qsfp0_tx_n,

      i_fanout_mgt_qsfp1_rx_p   => slv_fanout_mgt_qsfp1_rx_p,
      i_fanout_mgt_qsfp1_rx_n   => slv_fanout_mgt_qsfp1_rx_n,
      o_fanout_mgt_qsfp1_tx_p   => slv_fanout_mgt_qsfp1_tx_p,
      o_fanout_mgt_qsfp1_tx_n   => slv_fanout_mgt_qsfp1_tx_n,

      i_fanout_mgt_p6_8765_rx_p => slv_fanout_mgt_p6_8765_rx_p,
      i_fanout_mgt_p6_8765_rx_n => slv_fanout_mgt_p6_8765_rx_n,
      o_fanout_mgt_p6_8765_tx_p => slv_fanout_mgt_p6_8765_tx_p,
      o_fanout_mgt_p6_8765_tx_n => slv_fanout_mgt_p6_8765_tx_n,

      i_fanout_mgt_p6_432_rx_p  => slv_fanout_mgt_p6_4321_rx_p,
      i_fanout_mgt_p6_432_rx_n  => slv_fanout_mgt_p6_4321_rx_n,
      o_fanout_mgt_p6_432_tx_p  => slv_fanout_mgt_p6_4321_tx_p,
      o_fanout_mgt_p6_432_tx_n  => slv_fanout_mgt_p6_4321_tx_n,

      CLKSYN                    => CLKSYN,
      CLKSYN_CLK_O              => CLKSYN_CLK,
      RECCLK_O                  => RX_REC_CLK,

      LED_SDT                   => ME_FPI_LED_SDTI,
      LED_SCK                   => ME_FPI_LED_SCKI,

      FP_LEMO_IN_0              => FP_LEMO_IN_0,
      FP_LEMO_IN_1              => FP_LEMO_IN_1,
      TBIN(0)                   => RIO_04_P,
      TBIN(1)                   => RIO_05_P,
      TBIN(2)                   => RIO_06_P,
      TBIN(3)                   => RIO_07_P,
      TBIN(4)                   => RIO_08_P,
      TBIN(5)                   => RIO_09_P,
      TBIN(6)                   => RIO_10_P,
      TBIN(7)                   => RIO_11_P,

      axi_aclk                 => axiClk,
      axi_aresetn              => axiRstb,
      axi_ms                   => maxi_ms( EVRU_IDX_C downto EVM_IDX_C ),
      axi_sm                   => maxi_sm( EVRU_IDX_C downto EVM_IDX_C ),

      irq_evg                  => irq_evg,
      irq_evrd                 => irq_evrd,
      irq_evru                 => irq_evru
    );

--  i_axi_ila : entity work.AxiIla
--    port map (
--      clk                      => axiClk,
--      axim                     => maxi_ms( EVM_IDX_C ),
--      axis                     => maxi_sm( EVM_IDX_C )
--    );

  FP_LEMO_EN_0         <= '1';
  FP_LEMO_EN_1         <= '1';
  FP_LEMO_OUT_0        <= '0';
  FP_LEMO_OUT_1        <= '0';

  RIO_12_P             <= '0'; -- L_DIR_0 Low B->A; input
  RIO_12_N             <= '0'; -- L_DIR_1 Low B->A; input
  RIO_13_P             <= '0'; -- L_DIR_2 Low B->A; input
  RIO_13_N             <= '0'; -- L_DIR_3 Low B->A; input
  RIO_14_P             <= '0'; -- L_DIR_4 Low B->A; input
  RIO_14_N             <= '0'; -- L_DIR_5 Low B->A; input
  RIO_15_P             <= '0'; -- L_DIR_6 Low B->A; input
  RIO_15_N             <= '0'; -- L_DIR_7 Low B->A; input

  end block b_evm;

  maxi_sm(FLEMO_IDX_C) <= C_AXI_SM_DEF;

end architecture STRUCTURE;
