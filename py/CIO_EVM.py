# Script
#  - generate TCL script to instantiate an AXI crossbar IP with a defined address mapping
#  - hdl wrapper to export AXI ports as psi_common_axi records

import AxiConn

# generate a list of master ports
ports = []
# FW version
ports.append( AxiConn.MstPort( addr = 0xA0000000, width = 12 ) )
# Clock measurement
ports.append( AxiConn.MstPort( addr = 0xA0001000, width = 12 ) )
# FP LEMO Control
ports.append( AxiConn.MstPort( addr = 0xA0002000, width = 12 ) )
# Timing Delay
ports.append( AxiConn.MstPort( addr = 0xA0008000, width = 14 ) )
# EVM
ports.append( AxiConn.MstPort( addr = 0xA8000000, width = 25 ) )

# configure the crossbar for an address width of 40
# which matches a the zynqmp IP
xbar = AxiConn.AxiXbar( ports, saddrWidth=40 )
xbar.writeTcl()
xbar.writeHdl()
