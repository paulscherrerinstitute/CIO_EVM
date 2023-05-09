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
use work.psi_common_axi_pkg.all;

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
  );
end entity cpsi_cio_top;

architecture STRUCTURE of cpsi_cio_top is

   signal axiClk       : std_logic;
   signal axiRst       : std_logic;
   signal axi_ms       : rec_axi_ms;
   signal axi_sm       : rec_axi_sm;
   signal irq          : std_logic_vector(15 downto 0);

begin

  irq <= (others => '0');

  PS_i: entity work.ZynqMpPSWrapper
    port map (
      axi_aclk             => axiClk,
      axi_peripheral_reset => axiRst,
      pl_ps_irq0           => irq( 7 downto 0),
      pl_ps_irq1           => irq(15 downto 8),
      axi_ms               => axi_ms,
      axi_sm               => axi_sm
    );

end architecture STRUCTURE;
