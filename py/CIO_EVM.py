# Script
#  - generate TCL script to instantiate an AXI crossbar IP with a defined address mapping
#  - hdl wrapper to export AXI ports as psi_common_axi records

import AxiConn

# generate a list of master ports
ports = []
# FW version
ports.append( AxiConn.MstPort( addr = 0x00000000, width = 12 ) )
# Clock measurement
ports.append( AxiConn.MstPort( addr = 0x00001000, width = 12 ) )
# FP LEMO Control
ports.append( AxiConn.MstPort( addr = 0x00002000, width = 12 ) )
# Timing Delay
ports.append( AxiConn.MstPort( addr = 0x00008000, width = 14 ) )
# EVM
ports.append( AxiConn.MstPort( addr = 0x08000000, width = 25 ) )

xbar = AxiConn.AxiXbar( ports )
xbar.writeTcl()
xbar.writeHdl()
