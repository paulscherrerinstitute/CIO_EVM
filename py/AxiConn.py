import sys
import io

class MstPort:
  def __init__(self, addr, width=12):
    if ( addr < 0 ):
      raise RuntimeError("Address must be non-negative")
    if ( width < 1 or width > 32 ):
      raise RuntimeError("Width must be in 1..32")
    if ( addr & ((1<<width) - 1) != 0 ):
      raise RuntimeError("Misaligned Address")
    self._addr  = addr
    self._width = width

  @property
  def addr(self):
    return self._addr

  @property
  def width(self):
    return self._width

class AxiXbar:
  def __init__(self, ports, name="AxiXBar"):
    self._ports = []
    for p in ports:
      for q in self._ports:
        if ( p.addr < q.addr + (1<<q.width) and q.addr < p.addr + (1<<p.width) ):
          raise RuntimeError("Overlapping Address Range")
      self._ports.append( p )
    self._name = name
    self._sigs = [
      [ "awaddr", True, 31 ],
      [ "awlen", True, 7 ],
      [ "awsize", True, 2 ],
      [ "awburst", True, 1 ],
      [ "awlock", True, 0 ],
      [ "awcache", True, 3 ],
      [ "awprot", True, 2 ],
      [ "awqos", True, 3 ],
      [ "awuser", True, 0 ],
      [ "awvalid", True, 0 ],
      [ "awready", False, 0 ],
      [ "wdata", True, 31 ],
      [ "wstrb", True, 3 ],
      [ "wlast", True, 0 ],
      [ "wvalid", True, 0 ],
      [ "wready", False, 0 ],
      [ "bresp", False, 1 ],
      [ "bvalid", False, 0 ],
      [ "bready", True, 0 ],
      [ "araddr", True, 31 ],
      [ "arlen", True, 7 ],
      [ "arsize", True, 2 ],
      [ "arburst", True, 1 ],
      [ "arlock", True, 0 ],
      [ "arcache", True, 3 ],
      [ "arprot", True, 2 ],
      [ "arqos", True, 3 ],
      [ "aruser", True, 0 ],
      [ "arvalid", True, 0 ],
      [ "arready", False, 0 ],
      [ "rdata", False, 31 ],
      [ "rresp", False, 1 ],
      [ "rlast", False, 0 ],
      [ "rvalid", False, 0 ],
      [ "rready", True, 0 ]
    ]

  @property
  def name(self):
    return self._name

  def writeTcl(self, fnam="AxiXBar.tcl"):
    with io.open(fnam, "w") as f:
      self._writeTcl( f )
    
  def _writeTcl(self, f=sys.stdout):
    print("create_ip -name axi_crossbar -vendor xilinx.com -library ip -version 2 -module_name {}".format( self.name ), file=f )
    print("set_property -dict [list \\", file=f)
    print("  CONFIG.ARUSER_WIDTH {1} \\", file=f)
    print("  CONFIG.AWUSER_WIDTH {1} \\", file=f)
    idx = 0
    for p in self._ports:
      print("  CONFIG.M{:02d}_A00_BASE_ADDR  {{0x{:016x}}} \\".format( idx, p.addr ), file=f)
      print("  CONFIG.M{:02d}_A00_ADDR_WIDTH {{{:d}}} \\".format( idx, p.width ), file=f)
      idx += 1
    print("  CONFIG.NUM_MI {{{:d}}} \\".format( idx ), file=f)
    print("] [get_ips {}]".format( self.name ), file=f)

  def _writeDcl(self, f=sys.stdout, indent=0):
    indent = "{:{INDENT}}".format("", INDENT=indent)
    print(indent + "component {} is".format( self.name ), file=f)
    print(indent + "  port (", file=f)
    slfmt  = indent + "    {:40s}: {:3s} std_logic;" 
    slvfmt = indent + "    {:40s}: {:3s} std_logic_vector( {:d} downto 0 ){}"
    print(slfmt.format( "aclk",    "in" ), file=f)
    print(slfmt.format( "aresetn", "in" ), file=f)
    spre  = "s_axi_"
    for s in self._sigs:
      name = s[0]
      if ( s[1] ):
        io = "in"
      else:
        io = "out"
      left = s[2]
      sep  = ";"
      print(slvfmt.format( spre + name, io, left, sep, file=f ))
    n  = len(self._sigs)
    mpre  = "m_axi_"
    nmst  = len( self._ports )
    for s in self._sigs:
      n -= 1
      name = s[0]
      if ( s[1] ):
        io = "out"
      else:
        io = "in"
      left = s[2]
      sep  = ";"
      if n == 0:
        sep = ""
      print(slvfmt.format( mpre + name, io, (left + 1)*nmst - 1, sep, file=f ))
    print(indent+"  );"       , file=f)

  def _writeHdl(self, f=sys.stdout, indent=0):
    print("library ieee;",                             file = f)
    print("use     ieee.std_logic_1164.all;",          file = f)
    print("use     work.psi_common_axi_pkg.all;",      file = f)
    print("entity {}Wrapper is".format( self.name ),   file = f)
    print("end entity {}Wrapper;".format( self.name ), file = f )
    print("",                                          file = f )
    print("architecture rtl of {}Wrapper is".format( self.name ),   file = f)
    print("begin",                                                  file = f)
    print("end architecture rtl;",                                  file = f)
    
