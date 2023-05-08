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
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cpsi_cio_top is
 generic (
   G_FW_GIT_VERSION      : std_logic_vector(255 downto 0) := (others=>'1');
   G_FW_BUILD_DATE_TIME  : std_logic_vector(159 downto 0) := (others=>'1')
   );
 port (
    CLK_A_GTH_MSH_SFP1_N : in STD_LOGIC;
    CLK_A_GTH_MSH_SFP1_P : in STD_LOGIC;
    CLK_A_GTH_QSFP0_N : in STD_LOGIC;
    CLK_A_GTH_QSFP0_P : in STD_LOGIC;
    CLK_B_GTH_MSH_N : in STD_LOGIC;
    CLK_B_GTH_MSH_P : in STD_LOGIC;
    CLK_B_GTH_QSFP0_N : in STD_LOGIC;
    CLK_B_GTH_QSFP0_P : in STD_LOGIC;
    CLK_B_GTH_QSFP1_N : in STD_LOGIC;
    CLK_B_GTH_QSFP1_P : in STD_LOGIC;
    CLK_A_GTH_MSH_SFP1_OUT_N : out STD_LOGIC;
    CLK_A_GTH_MSH_SFP1_OUT_P : out STD_LOGIC;
    L1_GBT_MSH_SFP_RX_N : in  STD_LOGIC;
    L1_GBT_MSH_SFP_RX_P : in  STD_LOGIC;
    L1_GBT_MSH_SFP_TX_N : out  STD_LOGIC;
    L1_GBT_MSH_SFP_TX_P : out  STD_LOGIC;
    CLK_A_FPGA_DP_OUT_P : out STD_LOGIC;
    CLK_A_FPGA_DP_OUT_N : out STD_LOGIC;
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
    L8_MSH_GBT_TX_P     : out STD_LOGIC
  );end cpsi_cio_top;

architecture STRUCTURE of cpsi_cio_top is
  component cpsi_cio is
      port (
        param_fw_git_version_i_0    : in STD_LOGIC_VECTOR ( 255 downto 0 );
        param_fw_build_datetime_i_0 : in STD_LOGIC_VECTOR ( 159 downto 0 );
        CLK_IN_D_0_clk_p            : in STD_LOGIC_VECTOR ( 4 downto 0 );
        CLK_IN_D_0_clk_n            : in STD_LOGIC_VECTOR ( 4 downto 0 );
        CLK_A_FPGA_DP_OUT_P         : out STD_LOGIC;
        CLK_A_FPGA_DP_OUT_N         : out STD_LOGIC;
        MGT_UPLINK_RX_P : in STD_LOGIC;
        MGT_UPLINK_RX_N : in STD_LOGIC;
        MGT_UPLINK_TX_P : out STD_LOGIC;
        MGT_UPLINK_TX_N : out STD_LOGIC;
        MGT_UPLINK_RECCLK_P : out STD_LOGIC_VECTOR ( 0 to 0 );
        MGT_UPLINK_RECCLK_N : out STD_LOGIC_VECTOR ( 0 to 0 );
        TRIGGER_OUT        : out STD_LOGIC_VECTOR ( 1 downto 0 );
        fp_lemo_ena_n       : out STD_LOGIC_VECTOR ( 1 downto 0 );
        fp_lemo_in          : in STD_LOGIC_VECTOR ( 1 downto 0 );
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
        o_fanout_mgt_p6_432_tx_n : out STD_LOGIC_VECTOR ( 3 downto 0 )
      );
  end component cpsi_cio;
  signal CLK_IN_D_0_clk_n : std_logic_vector(4 downto 0);
  signal CLK_IN_D_0_clk_p : std_logic_vector(4 downto 0);

  signal slv_fanout_mgt_qsfp0_rx_p : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp0_rx_n : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp0_tx_p : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp0_tx_n : std_logic_vector(3 downto 0);

  signal slv_fanout_mgt_qsfp1_rx_p : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp1_rx_n : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp1_tx_p : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_qsfp1_tx_n : std_logic_vector(3 downto 0);

  signal slv_fanout_mgt_p6_8765_rx_p : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_8765_rx_n : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_8765_tx_p : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_8765_tx_n : std_logic_vector(3 downto 0);

  signal slv_fanout_mgt_p6_432_rx_p : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_432_rx_n : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_432_tx_p : std_logic_vector(3 downto 0);
  signal slv_fanout_mgt_p6_432_tx_n : std_logic_vector(3 downto 0);

begin
CLK_IN_D_0_clk_n(0) <= CLK_A_GTH_MSH_SFP1_N;
CLK_IN_D_0_clk_p(0) <= CLK_A_GTH_MSH_SFP1_P;
CLK_IN_D_0_clk_n(1) <= CLK_A_GTH_QSFP0_N;
CLK_IN_D_0_clk_p(1) <= CLK_A_GTH_QSFP0_P;
CLK_IN_D_0_clk_n(2) <= CLK_B_GTH_MSH_N;
CLK_IN_D_0_clk_p(2) <= CLK_B_GTH_MSH_P;
CLK_IN_D_0_clk_n(3) <= CLK_B_GTH_QSFP0_N;
CLK_IN_D_0_clk_p(3) <= CLK_B_GTH_QSFP0_P;
CLK_IN_D_0_clk_n(4) <= CLK_B_GTH_QSFP1_N;
CLK_IN_D_0_clk_p(4) <= CLK_B_GTH_QSFP1_P;
-- SFP0, MGT128, X0Y1
slv_fanout_mgt_qsfp0_rx_p(0) <= QSFP0_RX0_P;
slv_fanout_mgt_qsfp0_rx_p(1) <= QSFP0_RX1_P;
slv_fanout_mgt_qsfp0_rx_p(2) <= QSFP0_RX2_P;
slv_fanout_mgt_qsfp0_rx_p(3) <= QSFP0_RX3_P;
slv_fanout_mgt_qsfp0_rx_n(0) <= QSFP0_RX0_N;
slv_fanout_mgt_qsfp0_rx_n(1) <= QSFP0_RX1_N;
slv_fanout_mgt_qsfp0_rx_n(2) <= QSFP0_RX2_N;
slv_fanout_mgt_qsfp0_rx_n(3) <= QSFP0_RX3_N;
QSFP0_TX0_P <= slv_fanout_mgt_qsfp0_tx_p(0);
QSFP0_TX1_P <= slv_fanout_mgt_qsfp0_tx_p(1);
QSFP0_TX2_P <= slv_fanout_mgt_qsfp0_tx_p(2);
QSFP0_TX3_P <= slv_fanout_mgt_qsfp0_tx_p(3);
QSFP0_TX0_N <= slv_fanout_mgt_qsfp0_tx_n(0);
QSFP0_TX1_N <= slv_fanout_mgt_qsfp0_tx_n(1);
QSFP0_TX2_N <= slv_fanout_mgt_qsfp0_tx_n(2);
QSFP0_TX3_N <= slv_fanout_mgt_qsfp0_tx_n(3);
-- SFP1, MGT228 X1Y1
slv_fanout_mgt_qsfp1_rx_p(0) <= QSFP1_RX0_P;
slv_fanout_mgt_qsfp1_rx_p(1) <= QSFP1_RX1_P;
slv_fanout_mgt_qsfp1_rx_p(2) <= QSFP1_RX2_P;
slv_fanout_mgt_qsfp1_rx_p(3) <= QSFP1_RX3_P;
slv_fanout_mgt_qsfp1_rx_n(0) <= QSFP1_RX0_N;
slv_fanout_mgt_qsfp1_rx_n(1) <= QSFP1_RX1_N;
slv_fanout_mgt_qsfp1_rx_n(2) <= QSFP1_RX2_N;
slv_fanout_mgt_qsfp1_rx_n(3) <= QSFP1_RX3_N;
QSFP1_TX0_P <= slv_fanout_mgt_qsfp1_tx_p(0);
QSFP1_TX1_P <= slv_fanout_mgt_qsfp1_tx_p(1);
QSFP1_TX2_P <= slv_fanout_mgt_qsfp1_tx_p(2);
QSFP1_TX3_P <= slv_fanout_mgt_qsfp1_tx_p(3);
QSFP1_TX0_N <= slv_fanout_mgt_qsfp1_tx_n(0);
QSFP1_TX1_N <= slv_fanout_mgt_qsfp1_tx_n(1);
QSFP1_TX2_N <= slv_fanout_mgt_qsfp1_tx_n(2);
QSFP1_TX3_N <= slv_fanout_mgt_qsfp1_tx_n(3);
-- P6 port 8,7,6,5, MGT228 X1Y3
slv_fanout_mgt_p6_8765_rx_p(0) <= L8_MSH_GBT_RX_P;
slv_fanout_mgt_p6_8765_rx_p(1) <= L7_MSH_GBT_RX_P;
slv_fanout_mgt_p6_8765_rx_p(2) <= L6_MSH_GBT_RX_P;
slv_fanout_mgt_p6_8765_rx_p(3) <= L5_MSH_GBT_RX_P;
slv_fanout_mgt_p6_8765_rx_n(0) <= L8_MSH_GBT_RX_N;
slv_fanout_mgt_p6_8765_rx_n(1) <= L7_MSH_GBT_RX_N;
slv_fanout_mgt_p6_8765_rx_n(2) <= L6_MSH_GBT_RX_N;
slv_fanout_mgt_p6_8765_rx_n(3) <= L5_MSH_GBT_RX_N;
L8_MSH_GBT_TX_P <= slv_fanout_mgt_p6_8765_tx_p(0);
L7_MSH_GBT_TX_P <= slv_fanout_mgt_p6_8765_tx_p(1);
L6_MSH_GBT_TX_P <= slv_fanout_mgt_p6_8765_tx_p(2);
L5_MSH_GBT_TX_P <= slv_fanout_mgt_p6_8765_tx_p(3);
L8_MSH_GBT_TX_N <= slv_fanout_mgt_p6_8765_tx_n(0);
L7_MSH_GBT_TX_N <= slv_fanout_mgt_p6_8765_tx_n(1);
L6_MSH_GBT_TX_N <= slv_fanout_mgt_p6_8765_tx_n(2);
L5_MSH_GBT_TX_N <= slv_fanout_mgt_p6_8765_tx_n(3);

-- P6 port 4,3,2, MGT228 X1Y2
slv_fanout_mgt_p6_432_rx_p(0) <= L4_MSH_GBT_RX_P;
slv_fanout_mgt_p6_432_rx_p(1) <= L3_MSH_GBT_RX_P;
slv_fanout_mgt_p6_432_rx_p(2) <= L2_MSH_GBT_RX_P;
slv_fanout_mgt_p6_432_rx_p(3) <= '0';
slv_fanout_mgt_p6_432_rx_n(0) <= L4_MSH_GBT_RX_N;
slv_fanout_mgt_p6_432_rx_n(1) <= L3_MSH_GBT_RX_N;
slv_fanout_mgt_p6_432_rx_n(2) <= L2_MSH_GBT_RX_N;
slv_fanout_mgt_p6_432_rx_n(3) <= '0';
L4_MSH_GBT_TX_P <= slv_fanout_mgt_p6_432_tx_p(0);
L3_MSH_GBT_TX_P <= slv_fanout_mgt_p6_432_tx_p(1);
L2_MSH_GBT_TX_P <= slv_fanout_mgt_p6_432_tx_p(2);
L4_MSH_GBT_TX_N <= slv_fanout_mgt_p6_432_tx_n(0);
L3_MSH_GBT_TX_N <= slv_fanout_mgt_p6_432_tx_n(1);
L2_MSH_GBT_TX_N <= slv_fanout_mgt_p6_432_tx_n(2);

CPSI_CIO_i: component CPSI_CIO
     port map (
      CLK_IN_D_0_clk_n(4 downto 0) => CLK_IN_D_0_clk_n(4 downto 0),
      CLK_IN_D_0_clk_p(4 downto 0) => CLK_IN_D_0_clk_p(4 downto 0),
      CLK_A_FPGA_DP_OUT_P       => CLK_A_FPGA_DP_OUT_P,
      CLK_A_FPGA_DP_OUT_N       => CLK_A_FPGA_DP_OUT_N,
      MGT_UPLINK_RECCLK_N(0)    => CLK_A_GTH_MSH_SFP1_OUT_N,
      MGT_UPLINK_RECCLK_P(0)    => CLK_A_GTH_MSH_SFP1_OUT_P,
      MGT_UPLINK_RX_N           => L1_GBT_MSH_SFP_RX_N,
      MGT_UPLINK_RX_P           => L1_GBT_MSH_SFP_RX_P,
      MGT_UPLINK_TX_N           => L1_GBT_MSH_SFP_TX_N,
      MGT_UPLINK_TX_P           => L1_GBT_MSH_SFP_TX_P,
      fp_lemo_in(0)             => FP_LEMO_IN_0,
      fp_lemo_in(1)             => FP_LEMO_IN_1,
      fp_lemo_ena_n(0)          => FP_LEMO_EN_0,
      fp_lemo_ena_n(1)          => FP_LEMO_EN_1,
      TRIGGER_OUT(0)            => FP_LEMO_OUT_0,
      TRIGGER_OUT(1)            => FP_LEMO_OUT_1,
      i_fanout_mgt_qsfp0_rx_p    => slv_fanout_mgt_qsfp0_rx_p,
      i_fanout_mgt_qsfp0_rx_n    => slv_fanout_mgt_qsfp0_rx_n,
      o_fanout_mgt_qsfp0_tx_p    => slv_fanout_mgt_qsfp0_tx_p,
      o_fanout_mgt_qsfp0_tx_n    => slv_fanout_mgt_qsfp0_tx_n,

      i_fanout_mgt_qsfp1_rx_p    => slv_fanout_mgt_qsfp1_rx_p,
      i_fanout_mgt_qsfp1_rx_n    => slv_fanout_mgt_qsfp1_rx_n,
      o_fanout_mgt_qsfp1_tx_p    => slv_fanout_mgt_qsfp1_tx_p,
      o_fanout_mgt_qsfp1_tx_n    => slv_fanout_mgt_qsfp1_tx_n,

      i_fanout_mgt_p6_8765_rx_p  => slv_fanout_mgt_p6_8765_rx_p,
      i_fanout_mgt_p6_8765_rx_n  => slv_fanout_mgt_p6_8765_rx_n,
      o_fanout_mgt_p6_8765_tx_p  => slv_fanout_mgt_p6_8765_tx_p,
      o_fanout_mgt_p6_8765_tx_n  => slv_fanout_mgt_p6_8765_tx_n,

      i_fanout_mgt_p6_432_rx_p   => slv_fanout_mgt_p6_432_rx_p,
      i_fanout_mgt_p6_432_rx_n   => slv_fanout_mgt_p6_432_rx_n,
      o_fanout_mgt_p6_432_tx_p   => slv_fanout_mgt_p6_432_tx_p,
      o_fanout_mgt_p6_432_tx_n   => slv_fanout_mgt_p6_432_tx_n,

      param_fw_build_datetime_i_0(159 downto 0) => G_FW_BUILD_DATE_TIME,
      param_fw_git_version_i_0(255 downto 0) => G_FW_GIT_VERSION
    );

end STRUCTURE;
