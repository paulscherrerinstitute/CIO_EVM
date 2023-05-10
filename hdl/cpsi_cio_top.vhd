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
--library UNISIM;
--use UNISIM.VCOMPONENTS.ALL;
use work.psi_common_axi_pkg.all;

entity cpsi_cio_top is
 generic (
   G_FW_GIT_VERSION      : std_logic_vector(255 downto 0) := (others=>'1');
   G_FW_BUILD_DATE_TIME  : std_logic_vector(159 downto 0) := (others=>'1');
   G_ID_FACILITY         : string                         := "CPSI-S";
   G_ID_PROJECT          : string                         := "EVM"
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

  attribute IO_BUFFER_TYPE of CLK_A_GTH_MSH_SFP1_N          : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_A_GTH_MSH_SFP1_P          : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_A_GTH_QSFP0_N             : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_A_GTH_QSFP0_P             : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_B_GTH_MSH_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_B_GTH_MSH_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_B_GTH_QSFP0_N             : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_B_GTH_QSFP0_P             : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_B_GTH_QSFP1_N             : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_B_GTH_QSFP1_P             : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_A_GTH_MSH_SFP1_OUT_N      : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_A_GTH_MSH_SFP1_OUT_P      : signal is "NONE";
  attribute IO_BUFFER_TYPE of L1_GBT_MSH_SFP_RX_N           : signal is "NONE";
  attribute IO_BUFFER_TYPE of L1_GBT_MSH_SFP_RX_P           : signal is "NONE";
  attribute IO_BUFFER_TYPE of L1_GBT_MSH_SFP_TX_N           : signal is "NONE";
  attribute IO_BUFFER_TYPE of L1_GBT_MSH_SFP_TX_P           : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_A_FPGA_DP_OUT_P           : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_A_FPGA_DP_OUT_N           : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_A_LOL_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of CLK_B_LOL_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of FP_LEMO_IN_0                  : signal is "NONE";
  attribute IO_BUFFER_TYPE of FP_LEMO_IN_1                  : signal is "NONE";
  attribute IO_BUFFER_TYPE of FP_LEMO_EN_0                  : signal is "NONE";
  attribute IO_BUFFER_TYPE of FP_LEMO_EN_1                  : signal is "NONE";
  attribute IO_BUFFER_TYPE of FP_LEMO_OUT_0                 : signal is "NONE";
  attribute IO_BUFFER_TYPE of FP_LEMO_OUT_1                 : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_RX0_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_RX0_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_RX1_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_RX1_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_RX2_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_RX2_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_RX3_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_RX3_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_TX0_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_TX0_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_TX1_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_TX1_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_TX2_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_TX2_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_TX3_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP0_TX3_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_RX0_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_RX0_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_RX1_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_RX1_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_RX2_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_RX2_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_RX3_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_RX3_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_TX0_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_TX0_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_TX1_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_TX1_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_TX2_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_TX2_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_TX3_N                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of QSFP1_TX3_P                   : signal is "NONE";
  attribute IO_BUFFER_TYPE of L2_MSH_GBT_RX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L2_MSH_GBT_RX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L2_MSH_GBT_TX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L2_MSH_GBT_TX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L3_MSH_GBT_RX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L3_MSH_GBT_RX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L3_MSH_GBT_TX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L3_MSH_GBT_TX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L4_MSH_GBT_RX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L4_MSH_GBT_RX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L4_MSH_GBT_TX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L4_MSH_GBT_TX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L5_MSH_GBT_RX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L5_MSH_GBT_RX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L5_MSH_GBT_TX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L5_MSH_GBT_TX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L6_MSH_GBT_RX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L6_MSH_GBT_RX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L6_MSH_GBT_TX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L6_MSH_GBT_TX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L7_MSH_GBT_RX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L7_MSH_GBT_RX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L7_MSH_GBT_TX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L7_MSH_GBT_TX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L8_MSH_GBT_RX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L8_MSH_GBT_RX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L8_MSH_GBT_TX_N               : signal is "NONE";
  attribute IO_BUFFER_TYPE of L8_MSH_GBT_TX_P               : signal is "NONE";
  attribute IO_BUFFER_TYPE of ME_FPI_LED_SDTI               : signal is "NONE";
  attribute IO_BUFFER_TYPE of ME_FPI_LED_SCKI               : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_04_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_05_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_06_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_07_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_08_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_09_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_10_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_11_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_12_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_12_N                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_13_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_13_N                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_14_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_14_N                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_15_P                      : signal is "NONE";
  attribute IO_BUFFER_TYPE of RIO_15_N                      : signal is "NONE";
end entity cpsi_cio_top;

architecture STRUCTURE of cpsi_cio_top is

  -- defined by the TCL code that instantiates the AXI crossbar IP
  constant N_MST_C                             : natural := 5;
  constant FW_ID_IDX_C                         : natural := 0;
  constant CLKMS_IDX_C                         : natural := 1;
  constant FLEMO_IDX_C                         : natural := 2;
  constant T_DLY_IDX_C                         : natural := 3;
  constant EVM_IDX_C                           : natural := 4;

  signal axiClk                                : std_logic;
  signal axiRst                                : std_logic;
  signal axiRstb                               : std_logic;
  signal axi_ms                                : rec_axi_ms;
  signal axi_sm                                : rec_axi_sm;
  signal irq                                   : std_logic_vector(15 downto 0);

  signal maxi_ms                               : typ_arr_axi_ms(N_MST_C - 1 downto 0);
  signal maxi_sm                               : typ_arr_axi_sm(N_MST_C - 1 downto 0) := (others => C_AXI_SM_DEF);
begin

  irq <= (others => '0');

  PS_i: entity work.ZynqMpPSWrapper
    port map (
      axi_aclk                          => axiClk,
      axi_peripheral_reset              => axiRst,
      axi_peripheral_aresetn            => axiRstb,
      pl_ps_irq0                        => irq( 7 downto 0),
      pl_ps_irq1                        => irq(15 downto 8),
      axi_ms                            => axi_ms,
      axi_sm                            => axi_sm
    );

  XBar_i : entity work.AxiXbarWrapper
    port map (
      aclk                              => axiClk,
      aresetn                           => axiRstb,
      saxi_ms                           => axi_ms,
      saxi_sm                           => axi_sm,
      maxi_ms                           => maxi_ms,
      maxi_sm                           => maxi_sm
    );

  FwId_i : entity work.AxiFwVersionWrapper
    generic map (
      C_ID_FACILITY                     => G_ID_FACILITY,
      C_ID_PROJECT                      => G_ID_PROJECT,
      C_REV_PINS                        => False
    )
    port map (
      param_fw_git_version_i            => G_FW_GIT_VERSION,
      param_fw_build_datetime_i         => G_FW_BUILD_DATE_TIME,

      rev_pins_i                        => open,

      aclk                              => axiClk,
      aresetn                           => axiRstb,
      axi_ms                            => maxi_ms(FW_ID_IDX_C),
      axi_sm                            => maxi_sm(FW_ID_IDX_C)
    );

end architecture STRUCTURE;
