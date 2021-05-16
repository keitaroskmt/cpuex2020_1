#
# KCU105 RevD XDC
#
#Other net   PACKAGE_PIN Y11      - SYSMON_DXN                Bank   0 - DXN
#Other net   PACKAGE_PIN U12      - SYSMON_VCC                Bank   0 - VCCADC
#Other net   PACKAGE_PIN U11      - SYSMON_AGND               Bank   0 - GNDADC
#Other net   PACKAGE_PIN Y12      - SYSMON_DXP                Bank   0 - DXP
#Other net   PACKAGE_PIN W12      - SYSMON_VREFP              Bank   0 - VREFP
#Other net   PACKAGE_PIN V11      - SYSMON_AGND               Bank   0 - VREFN
#Other net   PACKAGE_PIN V12      - SYSMON_VP_R               Bank   0 - VP
#Other net   PACKAGE_PIN W11      - SYSMON_VN_R               Bank   0 - VN
#Other net   PACKAGE_PIN K7       - 3N5500                    Bank   0 - M0_0
#Other net   PACKAGE_PIN L7       - 3N5497                    Bank   0 - M1_0
#Other net   PACKAGE_PIN V7       - FPGA_INIT_B               Bank   0 - INIT_B_0
#Other net   PACKAGE_PIN M7       - FPGA_M2                   Bank   0 - M2_0
#Other net   PACKAGE_PIN W7       - GND                       Bank   0 - CFGBVS_0
#Other net   PACKAGE_PIN R7       - 3N2787                    Bank   0 - PUDC_B_0
#Other net   PACKAGE_PIN P7       - 3N3559                    Bank   0 - POR_OVERRIDE
#Other net   PACKAGE_PIN N7       - FPGA_DONE                 Bank   0 - DONE_0
#Other net   PACKAGE_PIN T7       - FPGA_PROG_B               Bank   0 - PROGRAM_B_0
#Other net   PACKAGE_PIN U9       - FPGA_TDO_FMC_TDI          Bank   0 - TDO_0
#Other net   PACKAGE_PIN V9       - JTAG_TDI_FPGA_BUF         Bank   0 - TDI_0
#Other net   PACKAGE_PIN U7       - QSPI0_CS_B                Bank   0 - RDWR_FCS_B_0
#Other net   PACKAGE_PIN AA7      - QSPI0_IO2                 Bank   0 - D02_0
#Other net   PACKAGE_PIN AC7      - QSPI0_IO0                 Bank   0 - D00_MOSI_0
#Other net   PACKAGE_PIN Y7       - QSPI0_IO3                 Bank   0 - D03_0
#Other net   PACKAGE_PIN AB7      - QSPI0_IO1                 Bank   0 - D01_DIN_0
#Other net   PACKAGE_PIN W9       - FPGA_TMS_BUF              Bank   0 - TMS_0
#Other net   PACKAGE_PIN AA9      - FPGA_CCLK                 Bank   0 - CCLK_0
#Other net   PACKAGE_PIN AC9      - FPGA_TCK_BUF              Bank   0 - TCK_0
#Other net   PACKAGE_PIN AD7      - FPGA_VBATT                Bank   0 - VBATT

# Bank  45 VCCO - VCC1V2_FPGA_3A - IO_L12P_T1U_N10_GC_45
set_property PACKAGE_PIN AK17            [get_ports "SYSCLK_300_P"]
set_property IOSTANDARD  DIFF_SSTL12     [get_ports "SYSCLK_300_P"]
set_property ODT         RTT_48          [get_ports "SYSCLK_300_P"]
#
# Bank  45 VCCO - VCC1V2_FPGA_3A - IO_L12N_T1U_N11_GC_45
set_property PACKAGE_PIN AK16            [get_ports "SYSCLK_300_N"]
set_property IOSTANDARD  DIFF_SSTL12     [get_ports "SYSCLK_300_N"]
set_property ODT         RTT_48          [get_ports "SYSCLK_300_N"]
#
# Bank  66 VCCO - VADJ_1V8_FPGA_10A - IO_L12P_T1U_N10_GC_66
set_property PACKAGE_PIN G10      [get_ports "CLK_125MHZ_P"]
set_property IOSTANDARD  LVDS     [get_ports "CLK_125MHZ_P"]
#
# Bank  66 VCCO - VADJ_1V8_FPGA_10A - IO_L12N_T1U_N11_GC_66
set_property PACKAGE_PIN F10      [get_ports "CLK_125MHZ_N"]
set_property IOSTANDARD  LVDS     [get_ports "CLK_125MHZ_N"]
#
# Bank  84 VCCO -          - IO_L22P_T3U_N6_DBC_AD0P_64
set_property PACKAGE_PIN AN8      [get_ports "CPU_RESET"]
set_property IOSTANDARD  LVCMOS18 [get_ports "CPU_RESET"]
# Bank  84 VCCO -          - IO_L22N_T3U_N7_DBC_AD0N_64
set_property PACKAGE_PIN AP8 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]
# Bank  85 VCCO -          - IO_L20P_T3L_N2_AD1P_D08_65
set_property PACKAGE_PIN P20 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]
# Bank  85 VCCO -          - IO_L20N_T3L_N3_AD1N_D09_65
set_property PACKAGE_PIN P21 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
# Bank  85 VCCO -          - IO_L19P_T3L_N0_DBC_AD9P_D10_65
set_property PACKAGE_PIN N22 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[4]}]
# Bank  85 VCCO -          - IO_L19N_T3L_N1_DBC_AD9N_D11_65
set_property PACKAGE_PIN M22 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[5]}]
# Bank  85 VCCO -          - IO_L18P_T2U_N10_AD2P_D12_65
set_property PACKAGE_PIN R23 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[6]}]
# Bank  85 VCCO -          - IO_L18N_T2U_N11_AD2N_D13_65
set_property PACKAGE_PIN P23 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[7]}]
# Bank  95 VCCO -          - IO_L8P_T1L_N2_AD5P_A16_65
set_property PACKAGE_PIN L23      [get_ports "USB_UART_CTS"]
set_property IOSTANDARD  LVCMOS18 [get_ports "USB_UART_CTS"]
# Bank  95 VCCO -          - IO_L3P_T0L_N4_AD15P_A26_65
set_property PACKAGE_PIN K26 [get_ports USB_UART_RX]
set_property IOSTANDARD LVCMOS18 [get_ports USB_UART_RX]
# Bank  95 VCCO -          - IO_L3N_T0L_N5_AD15N_A27_65
set_property PACKAGE_PIN K27      [get_ports "USB_UART_RTS"]
set_property IOSTANDARD  LVCMOS18 [get_ports "USB_UART_RTS"]
# Bank  95 VCCO -          - IO_L2P_T0L_N2_FOE_B_65
set_property PACKAGE_PIN G25 [get_ports USB_UART_TX]
set_property IOSTANDARD LVCMOS18 [get_ports USB_UART_TX]
# Bank  95 VCCO -          - IO_T0U_N12_A28_65
set_property PACKAGE_PIN H23 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]