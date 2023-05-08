

############################################################################################################################
## FP LEMO
############################################################################################################################
set_property PACKAGE_PIN D12   [get_ports {FP_LEMO_EN_0}];
set_property PACKAGE_PIN D10   [get_ports {FP_LEMO_EN_1}];
set_property PACKAGE_PIN E12   [get_ports {FP_LEMO_IN_0}];
set_property PACKAGE_PIN E10   [get_ports {FP_LEMO_IN_1}];
set_property PACKAGE_PIN D11   [get_ports {FP_LEMO_OUT_0}];
set_property PACKAGE_PIN C11   [get_ports {FP_LEMO_OUT_1}];
set_property IOSTANDARD LVCMOS33 [get_ports {FP_LEMO_*}]


# set_property IOSTANDARD LVDS [get_ports RIO_*]
# set_property IOSTANDARD LVDS [get_ports L*_MSH_IO_*]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports L1_MSH_IO_D_P]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports L4_MSH_IO_D_P]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports L6_MSH_IO_D_P]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports L8_MSH_IO_D_P]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports RIO_03_P]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports RIO_09_P]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports RIO_15_P]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports RIO_21_P]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports RIO_43_P]
# set_property UNAVAILABLE_DURING_CALIBRATION true [get_ports RIO_49_P]
# 
# set_property IOSTANDARD LVDS [get_ports CLK_*_FPGA_DP_GC_*]
# set_property IOSTANDARD LVDS [get_ports S*_CLK_IO*]
# 
# set_property IOSTANDARD LVPECL [get_ports CLK_C_FPGA_HD_GC_*]
# 
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets buf_s5_clk/O]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets buf_s7_clk/O]
# 
# set_property PACKAGE_PIN AB5   [get_ports {CLK_A_FPGA_DP_GC_N}];
# set_property PACKAGE_PIN AB6   [get_ports {CLK_A_FPGA_DP_GC_P}];
set_property PACKAGE_PIN AA2   [get_ports {CLK_A_FPGA_DP_OUT_N}];
set_property PACKAGE_PIN AA3   [get_ports {CLK_A_FPGA_DP_OUT_P}];
set_property IOSTANDARD LVDS [get_ports CLK_A_FPGA_DP_OUT_*]

#set_property PACKAGE_PIN E7   [get_ports {CLK_A_GTH_MSH_OUT_N}];
#set_property PACKAGE_PIN E8   [get_ports {CLK_A_GTH_MSH_OUT_P}];
set_property PACKAGE_PIN L7   [get_ports {CLK_A_GTH_MSH_SFP1_N}];
set_property PACKAGE_PIN L8   [get_ports {CLK_A_GTH_MSH_SFP1_P}];
set_property PACKAGE_PIN J7   [get_ports {CLK_A_GTH_MSH_SFP1_OUT_N}];
set_property PACKAGE_PIN J8   [get_ports {CLK_A_GTH_MSH_SFP1_OUT_P}];
set_property PACKAGE_PIN F26   [get_ports {CLK_A_GTH_QSFP0_N}];
set_property PACKAGE_PIN F25   [get_ports {CLK_A_GTH_QSFP0_P}];
# set_property PACKAGE_PIN AD6   [get_ports {CLK_B_FPGA_DP_GC_N}];
# set_property PACKAGE_PIN AC6   [get_ports {CLK_B_FPGA_DP_GC_P}];
# set_property PACKAGE_PIN U1   [get_ports {CLK_B_FPGA_DP_OUT_N}];
# set_property PACKAGE_PIN T1   [get_ports {CLK_B_FPGA_DP_OUT_P}];
set_property PACKAGE_PIN G7   [get_ports {CLK_B_GTH_MSH_N}];
set_property PACKAGE_PIN G8   [get_ports {CLK_B_GTH_MSH_P}];
set_property PACKAGE_PIN D26   [get_ports {CLK_B_GTH_QSFP0_N}];
set_property PACKAGE_PIN D25   [get_ports {CLK_B_GTH_QSFP0_P}];
set_property PACKAGE_PIN R7   [get_ports {CLK_B_GTH_QSFP1_N}];
set_property PACKAGE_PIN R8   [get_ports {CLK_B_GTH_QSFP1_P}];
# set_property PACKAGE_PIN N7   [get_ports {CLK_B_GTH_QSFP1_OUT_N}];
# set_property PACKAGE_PIN N8   [get_ports {CLK_B_GTH_QSFP1_OUT_P}];
# set_property PACKAGE_PIN F10   [get_ports {CLK_C_FPGA_HD_GC_N}];
# set_property PACKAGE_PIN G10   [get_ports {CLK_C_FPGA_HD_GC_P}];
# set_property PACKAGE_PIN C12   [get_ports {CLKA_FDEC}];
# set_property PACKAGE_PIN B11   [get_ports {CLKA_FINC}];
# set_property PACKAGE_PIN J11   [get_ports {CLKA_LOL_N}];
# set_property PACKAGE_PIN H12   [get_ports {CLKB_FDEC}];
# set_property PACKAGE_PIN G11   [get_ports {CLKB_FINC}];
# set_property PACKAGE_PIN J10   [get_ports {CLKB_LOL_N}];
# set_property PACKAGE_PIN D15   [get_ports {EXT_CON_0}];
# set_property PACKAGE_PIN D14   [get_ports {EXT_CON_1}];
# set_property PACKAGE_PIN K15   [get_ports {EXT_CON_10}];
# set_property PACKAGE_PIN J15   [get_ports {EXT_CON_11}];
# set_property PACKAGE_PIN E14   [get_ports {EXT_CON_2}];
# set_property PACKAGE_PIN E13   [get_ports {EXT_CON_3}];
# set_property PACKAGE_PIN F15   [get_ports {EXT_CON_4}];
# set_property PACKAGE_PIN E15   [get_ports {EXT_CON_5}];
# set_property PACKAGE_PIN G13   [get_ports {EXT_CON_6}];
# set_property PACKAGE_PIN F13   [get_ports {EXT_CON_7}];
# set_property PACKAGE_PIN G15   [get_ports {EXT_CON_8}];
# set_property PACKAGE_PIN G14   [get_ports {EXT_CON_9}];
# set_property PACKAGE_PIN AH11   [get_ports {FTDI_D_RXD_ME_PL}];
# set_property PACKAGE_PIN AJ1   [get_ports {FTDI_D_TXD_M_ME_PL}];
# set_property PACKAGE_PIN A15   [get_ports {I2C_REAR_PL_SCL}];
# set_property PACKAGE_PIN B15   [get_ports {I2C_REAR_PL_SDA}];
# set_property PACKAGE_PIN AB1   [get_ports {L1_MSH_IO_C_N}];
# set_property PACKAGE_PIN AA1   [get_ports {L1_MSH_IO_C_P}];
# set_property PACKAGE_PIN AC3   [get_ports {L1_MSH_IO_D_N}];
# set_property PACKAGE_PIN AB3   [get_ports {L1_MSH_IO_D_P}];
# set_property PACKAGE_PIN AD1   [get_ports {L2_MSH_IO_C_N}];
# set_property PACKAGE_PIN AC1   [get_ports {L2_MSH_IO_C_P}];
# set_property PACKAGE_PIN AD2   [get_ports {L2_MSH_IO_D_N}];
# set_property PACKAGE_PIN AC2   [get_ports {L2_MSH_IO_D_P}];
# set_property PACKAGE_PIN AE2   [get_ports {L3_MSH_IO_C_N}];
# set_property PACKAGE_PIN AE3   [get_ports {L3_MSH_IO_C_P}];
# set_property PACKAGE_PIN AA5   [get_ports {L3_MSH_IO_D_N}];
# set_property PACKAGE_PIN AA6   [get_ports {L3_MSH_IO_D_P}];
# set_property PACKAGE_PIN AC4   [get_ports {L4_MSH_IO_C_N}];
# set_property PACKAGE_PIN AB4   [get_ports {L4_MSH_IO_C_P}];
# set_property PACKAGE_PIN AE5   [get_ports {L4_MSH_IO_D_N}];
# set_property PACKAGE_PIN AD5   [get_ports {L4_MSH_IO_D_P}];
# set_property PACKAGE_PIN AE4   [get_ports {L5_MSH_IO_C_N}];
# set_property PACKAGE_PIN AD4   [get_ports {L5_MSH_IO_C_P}];
# set_property PACKAGE_PIN AE10   [get_ports {L5_MSH_IO_D_N}];
# set_property PACKAGE_PIN AD10   [get_ports {L5_MSH_IO_D_P}];
# set_property PACKAGE_PIN AE9   [get_ports {L6_MSH_IO_C_N}];
# set_property PACKAGE_PIN AD9   [get_ports {L6_MSH_IO_C_P}];
# set_property PACKAGE_PIN AC9   [get_ports {L6_MSH_IO_D_N}];
# set_property PACKAGE_PIN AB9   [get_ports {L6_MSH_IO_D_P}];
# set_property PACKAGE_PIN AA7   [get_ports {L7_MSH_IO_C_N}];
# set_property PACKAGE_PIN AA8   [get_ports {L7_MSH_IO_C_P}];
# set_property PACKAGE_PIN AB10   [get_ports {L7_MSH_IO_D_N}];
# set_property PACKAGE_PIN AB11   [get_ports {L7_MSH_IO_D_P}];

############################################################################################################################
## 1x FP SFP1 and 7x P6 MGTs
############################################################################################################################

set_property PACKAGE_PIN K1   [get_ports {L1_GBT_MSH_SFP_RX_N}];
set_property PACKAGE_PIN K2   [get_ports {L1_GBT_MSH_SFP_RX_P}];
set_property PACKAGE_PIN J3   [get_ports {L1_GBT_MSH_SFP_TX_N}];
set_property PACKAGE_PIN J4   [get_ports {L1_GBT_MSH_SFP_TX_P}];
set_property PACKAGE_PIN H1   [get_ports {L2_MSH_GBT_RX_N}];
set_property PACKAGE_PIN H2   [get_ports {L2_MSH_GBT_RX_P}];
set_property PACKAGE_PIN H5   [get_ports {L2_MSH_GBT_TX_N}];
set_property PACKAGE_PIN H6   [get_ports {L2_MSH_GBT_TX_P}];
set_property PACKAGE_PIN G3   [get_ports {L3_MSH_GBT_RX_N}];
set_property PACKAGE_PIN G4   [get_ports {L3_MSH_GBT_RX_P}];
set_property PACKAGE_PIN F5   [get_ports {L3_MSH_GBT_TX_N}];
set_property PACKAGE_PIN F6   [get_ports {L3_MSH_GBT_TX_P}];
set_property PACKAGE_PIN F1   [get_ports {L4_MSH_GBT_RX_N}];
set_property PACKAGE_PIN F2   [get_ports {L4_MSH_GBT_RX_P}];
set_property PACKAGE_PIN E3   [get_ports {L4_MSH_GBT_TX_N}];
set_property PACKAGE_PIN E4   [get_ports {L4_MSH_GBT_TX_P}];
set_property PACKAGE_PIN A3   [get_ports {L5_MSH_GBT_RX_N}];
set_property PACKAGE_PIN A4   [get_ports {L5_MSH_GBT_RX_P}];
set_property PACKAGE_PIN A7   [get_ports {L5_MSH_GBT_TX_N}];
set_property PACKAGE_PIN A8   [get_ports {L5_MSH_GBT_TX_P}];
set_property PACKAGE_PIN B1   [get_ports {L6_MSH_GBT_RX_N}];
set_property PACKAGE_PIN B2   [get_ports {L6_MSH_GBT_RX_P}];
set_property PACKAGE_PIN B5   [get_ports {L6_MSH_GBT_TX_N}];
set_property PACKAGE_PIN B6   [get_ports {L6_MSH_GBT_TX_P}];
set_property PACKAGE_PIN C3   [get_ports {L7_MSH_GBT_RX_N}];
set_property PACKAGE_PIN C4   [get_ports {L7_MSH_GBT_RX_P}];
set_property PACKAGE_PIN C7   [get_ports {L7_MSH_GBT_TX_N}];
set_property PACKAGE_PIN C8   [get_ports {L7_MSH_GBT_TX_P}];
set_property PACKAGE_PIN D1   [get_ports {L8_MSH_GBT_RX_N}];
set_property PACKAGE_PIN D2   [get_ports {L8_MSH_GBT_RX_P}];
set_property PACKAGE_PIN D5   [get_ports {L8_MSH_GBT_TX_N}];
set_property PACKAGE_PIN D6   [get_ports {L8_MSH_GBT_TX_P}];

# set_property PACKAGE_PIN AF13   [get_ports {L8_MSH_IO_C_N}];
# set_property PACKAGE_PIN AE13   [get_ports {L8_MSH_IO_C_P}];
# set_property PACKAGE_PIN AC13   [get_ports {L8_MSH_IO_D_N}];
# set_property PACKAGE_PIN AB13   [get_ports {L8_MSH_IO_D_P}];
# set_property PACKAGE_PIN H11   [get_ports {ME_FPI_LED_SCKI}];
# set_property PACKAGE_PIN J12   [get_ports {ME_FPI_LED_SDTI}];
# set_property PACKAGE_PIN V3   [get_ports {ME_I2C1_PS_SCL}];
# set_property PACKAGE_PIN Y7   [get_ports {ME_I2C1_PS_SDA}];
# set_property PACKAGE_PIN K14   [get_ports {ME_IO_MUX_CON12_R8_1SE}];
# set_property PACKAGE_PIN J14   [get_ports {ME_IO_MUX_CON13_R8_0SE}];
# set_property PACKAGE_PIN H14   [get_ports {ME_IO_MUX_CON14_R6_1SE}];
# set_property PACKAGE_PIN H13   [get_ports {ME_IO_MUX_CON15_R7_0SE}];
# set_property PACKAGE_PIN C14   [get_ports {ME_IO_MUX_CON16_R6_1SE}];
# set_property PACKAGE_PIN C13   [get_ports {ME_IO_MUX_CON17_R6_0SE}];
# set_property PACKAGE_PIN B13   [get_ports {ME_IO_MUX_CON18_R5_1SE}];
# set_property PACKAGE_PIN A13   [get_ports {ME_IO_MUX_CON19_R5_0SE}];
# set_property PACKAGE_PIN B14   [get_ports {PSOC_ME_CLK_PL}];
# set_property PACKAGE_PIN F12   [get_ports {PSOC_ME_IO0}];
# set_property PACKAGE_PIN F11   [get_ports {PSOC_ME_IO1}];
# set_property PACKAGE_PIN B10   [get_ports {PSOC_ME_IO2}];
# set_property PACKAGE_PIN A10   [get_ports {PSOC_ME_IO3}];
# set_property PACKAGE_PIN A12   [get_ports {PSOC_ME_IO4}];
# set_property PACKAGE_PIN A11   [get_ports {PSOC_ME_IO5}];
# set_property PACKAGE_PIN K13   [get_ports {PSOC_ME_IO6}];
# set_property PACKAGE_PIN K12   [get_ports {PSOC_ME_IO7}];
# set_property PACKAGE_PIN AG4   [get_ports {PSOC_ME_PL_M_UART_TX}];
# set_property PACKAGE_PIN AG9   [get_ports {PSOC_ME_PL_UART_RX}];

############################################################################################################################
## QSFP 0 and QSFP1
############################################################################################################################

set_property PACKAGE_PIN H30   [get_ports {QSFP0_RX0_N}];
set_property PACKAGE_PIN H29   [get_ports {QSFP0_RX0_P}];
set_property PACKAGE_PIN F30   [get_ports {QSFP0_RX1_N}];
set_property PACKAGE_PIN F29   [get_ports {QSFP0_RX1_P}];
set_property PACKAGE_PIN D30   [get_ports {QSFP0_RX2_N}];
set_property PACKAGE_PIN D29   [get_ports {QSFP0_RX2_P}];
set_property PACKAGE_PIN B30   [get_ports {QSFP0_RX3_N}];
set_property PACKAGE_PIN B29   [get_ports {QSFP0_RX3_P}];
set_property PACKAGE_PIN G28   [get_ports {QSFP0_TX0_N}];
set_property PACKAGE_PIN G27   [get_ports {QSFP0_TX0_P}];
set_property PACKAGE_PIN E28   [get_ports {QSFP0_TX1_N}];
set_property PACKAGE_PIN E27   [get_ports {QSFP0_TX1_P}];
set_property PACKAGE_PIN C28   [get_ports {QSFP0_TX2_N}];
set_property PACKAGE_PIN C27   [get_ports {QSFP0_TX2_P}];
set_property PACKAGE_PIN A28   [get_ports {QSFP0_TX3_N}];
set_property PACKAGE_PIN A27   [get_ports {QSFP0_TX3_P}];
set_property PACKAGE_PIN R3   [get_ports {QSFP1_RX0_N}];
set_property PACKAGE_PIN R4   [get_ports {QSFP1_RX0_P}];
set_property PACKAGE_PIN P2   [get_ports {QSFP1_RX1_P}];
set_property PACKAGE_PIN M1   [get_ports {QSFP1_RX2_N}];
set_property PACKAGE_PIN M2   [get_ports {QSFP1_RX2_P}];
set_property PACKAGE_PIN L3   [get_ports {QSFP1_RX3_N}];
set_property PACKAGE_PIN L4   [get_ports {QSFP1_RX3_P}];
set_property PACKAGE_PIN P5   [get_ports {QSFP1_TX0_N}];
set_property PACKAGE_PIN P6   [get_ports {QSFP1_TX0_P}];
set_property PACKAGE_PIN N3   [get_ports {QSFP1_TX1_N}];
set_property PACKAGE_PIN N4   [get_ports {QSFP1_TX1_P}];
set_property PACKAGE_PIN M5   [get_ports {QSFP1_TX2_N}];
set_property PACKAGE_PIN M6   [get_ports {QSFP1_TX2_P}];
set_property PACKAGE_PIN K5   [get_ports {QSFP1_TX3_N}];
set_property PACKAGE_PIN K6   [get_ports {QSFP1_TX3_P}];



# set_property PACKAGE_PIN AG5   [get_ports {RIO_00_PCLK_N}];
# set_property PACKAGE_PIN AG6   [get_ports {RIO_00_PCLK_P}];
# set_property PACKAGE_PIN AJ6   [get_ports {RIO_01_SCLK_N}];
# set_property PACKAGE_PIN AH6   [get_ports {RIO_01_SCLK_P}];
# set_property PACKAGE_PIN AK6   [get_ports {RIO_02_N}];
# set_property PACKAGE_PIN AK7   [get_ports {RIO_02_P}];
# set_property PACKAGE_PIN AF5   [get_ports {RIO_03_N}];
# set_property PACKAGE_PIN AF6   [get_ports {RIO_03_P}];
# set_property PACKAGE_PIN AK5   [get_ports {RIO_04_N}];
# set_property PACKAGE_PIN AJ5   [get_ports {RIO_04_P}];
# set_property PACKAGE_PIN AJ4   [get_ports {RIO_05_N}];
# set_property PACKAGE_PIN AH4   [get_ports {RIO_05_P}];
# set_property PACKAGE_PIN AK3   [get_ports {RIO_06_N}];
# set_property PACKAGE_PIN AK4   [get_ports {RIO_06_P}];
# set_property PACKAGE_PIN AH2   [get_ports {RIO_07_N}];
# set_property PACKAGE_PIN AH3   [get_ports {RIO_07_P}];
# set_property PACKAGE_PIN AK2   [get_ports {RIO_08_N}];
# set_property PACKAGE_PIN AJ2   [get_ports {RIO_08_P}];
# set_property PACKAGE_PIN AH1   [get_ports {RIO_09_N}];
# set_property PACKAGE_PIN AG1   [get_ports {RIO_09_P}];
# set_property PACKAGE_PIN AG3   [get_ports {RIO_10_N}];
# set_property PACKAGE_PIN AF3   [get_ports {RIO_10_P}];
# set_property PACKAGE_PIN AF1   [get_ports {RIO_11_N}];
# set_property PACKAGE_PIN AF2   [get_ports {RIO_11_P}];
# set_property PACKAGE_PIN AF7   [get_ports {RIO_12_N}];
# set_property PACKAGE_PIN AF8   [get_ports {RIO_12_P}];
# set_property PACKAGE_PIN AG10   [get_ports {RIO_13_N}];
# set_property PACKAGE_PIN AF10   [get_ports {RIO_13_P}];
# set_property PACKAGE_PIN AJ9   [get_ports {RIO_14_N}];
# set_property PACKAGE_PIN AH9   [get_ports {RIO_14_P}];
# set_property PACKAGE_PIN AG11   [get_ports {RIO_15_N}];
# set_property PACKAGE_PIN AF11   [get_ports {RIO_15_P}];
# set_property PACKAGE_PIN AH13   [get_ports {RIO_16_N}];
# set_property PACKAGE_PIN AG13   [get_ports {RIO_16_P}];
# set_property PACKAGE_PIN AJ12   [get_ports {RIO_17_N}];
# set_property PACKAGE_PIN AH12   [get_ports {RIO_17_P}];
# set_property PACKAGE_PIN AK12   [get_ports {RIO_18_N}];
# set_property PACKAGE_PIN AK13   [get_ports {RIO_18_P}];
# set_property PACKAGE_PIN AK11   [get_ports {RIO_19_N}];
# set_property PACKAGE_PIN AJ11   [get_ports {RIO_19_P}];
# set_property PACKAGE_PIN AK10   [get_ports {RIO_20_N}];
# set_property PACKAGE_PIN AJ10   [get_ports {RIO_20_P}];
# set_property PACKAGE_PIN AK8   [get_ports {RIO_21_N}];
# set_property PACKAGE_PIN AK9   [get_ports {RIO_21_P}];
# set_property PACKAGE_PIN AJ7   [get_ports {RIO_22_SCLK_N}];
# set_property PACKAGE_PIN AH7   [get_ports {RIO_22_SCLK_P}];
# set_property PACKAGE_PIN AH8   [get_ports {RIO_23_PCLK_N}];
# set_property PACKAGE_PIN AG8   [get_ports {RIO_23_PCLK_P}];
# set_property PACKAGE_PIN V8   [get_ports {RIO_40_PCLK_N}];
# set_property PACKAGE_PIN U8   [get_ports {RIO_40_PCLK_P}];
# set_property PACKAGE_PIN Y8   [get_ports {RIO_41_SCLK_N}];
# set_property PACKAGE_PIN Y9   [get_ports {RIO_41_SCLK_P}];
# set_property PACKAGE_PIN V11   [get_ports {RIO_42_N}];
# set_property PACKAGE_PIN U11   [get_ports {RIO_42_P}];
# set_property PACKAGE_PIN W10   [get_ports {RIO_43_N}];
# set_property PACKAGE_PIN W11   [get_ports {RIO_43_P}];
# set_property PACKAGE_PIN V9   [get_ports {RIO_44_N}];
# set_property PACKAGE_PIN U9   [get_ports {RIO_44_P}];
# set_property PACKAGE_PIN U10   [get_ports {RIO_45_N}];
# set_property PACKAGE_PIN T11   [get_ports {RIO_45_P}];
# set_property PACKAGE_PIN T10   [get_ports {RIO_46_N}];
# set_property PACKAGE_PIN R10   [get_ports {RIO_46_P}];
# set_property PACKAGE_PIN P10   [get_ports {RIO_47_N}];
# set_property PACKAGE_PIN P11   [get_ports {RIO_47_P}];
# set_property PACKAGE_PIN M12   [get_ports {RIO_48_N}];
# set_property PACKAGE_PIN N12   [get_ports {RIO_48_P}];
# set_property PACKAGE_PIN M10   [get_ports {RIO_49_N}];
# set_property PACKAGE_PIN N10   [get_ports {RIO_49_P}];
# set_property PACKAGE_PIN L11   [get_ports {RIO_50_N}];
# set_property PACKAGE_PIN L12   [get_ports {RIO_50_P}];
# set_property PACKAGE_PIN K10   [get_ports {RIO_51_N}];
# set_property PACKAGE_PIN L10   [get_ports {RIO_51_P}];
# set_property PACKAGE_PIN Y5   [get_ports {RIO_52_N}];
# set_property PACKAGE_PIN W5   [get_ports {RIO_52_P}];
# set_property PACKAGE_PIN W4   [get_ports {RIO_53_N}];
# set_property PACKAGE_PIN V4   [get_ports {RIO_53_P}];
# set_property PACKAGE_PIN U4   [get_ports {RIO_54_N}];
# set_property PACKAGE_PIN U5   [get_ports {RIO_54_P}];
# set_property PACKAGE_PIN U6   [get_ports {RIO_55_PCLK_N}];
# set_property PACKAGE_PIN U7   [get_ports {RIO_55_PCLK_P}];
# set_property PACKAGE_PIN Y1   [get_ports {S5_CLK_IO_N}];
# set_property PACKAGE_PIN Y2   [get_ports {S5_CLK_IO_P}];
# set_property PACKAGE_PIN AC8   [get_ports {S6_CLK_IO_N}];
# set_property PACKAGE_PIN AB8   [get_ports {S6_CLK_IO_P}];
# set_property PACKAGE_PIN Y3   [get_ports {S7_CLK_IO_N}];
# set_property PACKAGE_PIN Y4   [get_ports {S7_CLK_IO_P}];
# set_property PACKAGE_PIN W6   [get_ports {S8_CLK_IO_N}];
# set_property PACKAGE_PIN W7   [get_ports {S8_CLK_IO_P}];
