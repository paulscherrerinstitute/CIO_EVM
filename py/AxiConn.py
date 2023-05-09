# Auto-generate code to map between Xilinx/flat AXI ports which expose all the
# signals and records as defined in 'psi_common_axi_pkg'. These are far
# easier to connect between blocks.

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

  @property
  def description(self):
    return "0x{:08x}..0x{:08x}".format( self.addr, self.addr + (1 << self.width) - 1 )

class AxiPort:
  SIGNALS = [
    [ "aw", "addr", True, 31 ],
    [ "aw", "len", True, 7 ],
    [ "aw", "size", True, 2 ],
    [ "aw", "burst", True, 1 ],
    [ "aw", "lock", True, 0 ],
    [ "aw", "cache", True, 3 ],
    [ "aw", "prot", True, 2 ],
    [ "aw", "qos", True, 3 ],
    [ "aw", "user", True, 0 ],
    [ "aw", "valid", True, 0 ],
    [ "aw", "ready", False, 0 ],
    [ "w", "data", True, 31 ],
    [ "w", "strb", True, 3 ],
    [ "w", "last", True, 0 ],
    [ "w", "valid", True, 0 ],
    [ "w", "ready", False, 0 ],
    [ "b", "resp", False, 1 ],
    [ "b", "valid", False, 0 ],
    [ "b", "ready", True, 0 ],
    [ "ar", "addr", True, 31 ],
    [ "ar", "len", True, 7 ],
    [ "ar", "size", True, 2 ],
    [ "ar", "burst", True, 1 ],
    [ "ar", "lock", True, 0 ],
    [ "ar", "cache", True, 3 ],
    [ "ar", "prot", True, 2 ],
    [ "ar", "qos", True, 3 ],
    [ "ar", "user", True, 0 ],
    [ "ar", "valid", True, 0 ],
    [ "ar", "ready", False, 0 ],
    [ "r", "data", False, 31 ],
    [ "r", "resp", False, 1 ],
    [ "r", "last", False, 0 ],
    [ "r", "valid", False, 0 ],
    [ "r", "ready", True, 0 ]
  ]

  @staticmethod
  def toRecField(port):
    if ( (port == "r") or (port == "w") ):
      return "d"+port
    return port

  def __init__(self, file=sys.stdout, indent=0):
    self._f = file
    self._i = "{:{IND}}".format("", IND=indent)

  def p(self, s, end="\n"):
    print( self._i + s, file=self._f, end=end )

  def map(self):
    i = len(self.SIGNALS)
    for s in self.SIGNALS:
      i -= 1
      self( s[0], s[1], s[2], s[3] + 1, (i == 0) )

  def __call__(self, port, sname, m2s, width, isLast):
    raise RuntimeError("Must be implemented by subclass")

class AxiPortDecl(AxiPort):
  def __init__(self, prefix, isMst, fieldWidth=40, nPortsInVect=1, indent=0, file=sys.stdout, isLastPort=False):
    super().__init__(file, indent)
    self._pre          = prefix
    self._isMst        = isMst
    self._isLastPort   = isLastPort
    self._fieldWidth   = fieldWidth
    if isMst is None:
      iofmt = "{:s}"
    else:
      iofmt = "{:4s}"
    self._fmt          = "{:{W}}: " + iofmt + "std_logic_vector( {:d} downto 0 ){}"
    self._nPortsInVect = nPortsInVect

  def __call__(self, port, sname, m2s, width, isLast):
    if ( self._isMst is None ):
      io = ""
    elif ( m2s == self._isMst ):
      io = "out"
    else:
      io = "in"
    end = ";"
    if ( isLast and self._isLastPort ):
      end = ""
    self.p( self._fmt.format( self._pre + port + sname, io, width * self._nPortsInVect - 1, end, W=self._fieldWidth ) )

class AxiSignalDecl(AxiPortDecl):
  def __init__(self, prefix, fieldWidth = 20, nPortsInVect = 1, file=sys.stdout, indent=0):
    super().__init__(isMst=None, prefix=prefix, fieldWidth=fieldWidth, nPortsInVect=nPortsInVect, file=file, indent=0)
    self._subIndent = "{:{W}}".format("",W=indent)

  def __call__(self, port, sname, m2s, width, isLast):
    self.p( self._subIndent + "signal ", end="")
    super().__call__(port, sname, m2s, width, isLast)

class AxiPortMap(AxiPort):
  def __init__(self, flatPrefix, recPrefix, fieldWidth=40, pruneAddr=None, useSRange=True, flatToRec=True, numPorts=1, isLastPort=False, file=sys.stdout, indent=0):
    super().__init__(file=file, indent=indent)
    self._flatPrefix = flatPrefix
    self._recPrefix  = recPrefix
    self._dir        = flatToRec
    self._isLastPort = isLastPort
    self._numPorts   = numPorts
    self._pruneAddr  = pruneAddr
    self._fieldWidth = fieldWidth
    self._useSRange  = useSRange

  def __call__(self, port, sname, m2s, width, isLast):
    if ( self._numPorts == 1 ):
      fidx =''
    else:
      fidx = '({3:d})'
    trng = ""
    if ( (sname == "addr") and (not self._pruneAddr is None) ):
       trng = "({:} - 1 downto 0)".format( self._pruneAddr )
    f = "{0:{W}} => {1}_{2}" + fidx + ".{4}.{5}" + trng + "{6}"
    for pidx in range(self._numPorts):
      if ( self._useSRange ):
        if ( (width == 1) and (sname != "user") ):
          rng = "({:d})".format( pidx )
        else:
          r   = pidx * width
          l   = r + width - 1
          rng = "({:d} downto {:d})".format( l, r )
      else:
          rng = ""
      flatName = self._flatPrefix + port + sname + rng
      if ( m2s == self._dir ):
        direction = "ms"
      else:
        direction = "sm"
      end = ","
      if isLast and self._isLastPort and pidx == self._numPorts - 1:
        end = ""
      self.p( f.format(flatName, self._recPrefix, direction, pidx, self.toRecField(port), sname, end, W=self._fieldWidth) )

class AxiXbar:
  def __init__(self, ports, name="AxiXBar"):
    self._ports = []
    for p in ports:
      for q in self._ports:
        if ( p.addr < q.addr + (1<<q.width) and q.addr < p.addr + (1<<p.width) ):
          raise RuntimeError("Overlapping Address Range")
      self._ports.append( p )
    self._name = name

  @property
  def name(self):
    return self._name

  @property
  def numMst(self):
    return len(self._ports)

  def writeTcl(self, fnam="AxiXBar.tcl"):
    with io.open(fnam, "w") as f:
      self._writeTcl( f )

  def writeHdl(self, fnam="AxiXBarWrapper.vhd"):
    with io.open(fnam, "w") as f:
      self._writeHdl( f )
    
  def _writeTcl(self, file=sys.stdout):
    print("## THIS CODE WAS AUTOMATICALLY GENERATED; DO NOT EDIT",                                                      file=file)
    print("create_ip -name axi_crossbar -vendor xilinx.com -library ip -version 2 -module_name {}".format( self.name ), file=file )
    print("set_property -dict [list \\",                                                                                file=file)
    print("  CONFIG.ARUSER_WIDTH {1} \\",                                                                               file=file)
    print("  CONFIG.AWUSER_WIDTH {1} \\",                                                                               file=file)
    idx = 0
    for p in self._ports:
      print("  CONFIG.M{:02d}_A00_BASE_ADDR  {{0x{:016x}}} \\".format( idx, p.addr ),                                   file=file)
      print("  CONFIG.M{:02d}_A00_ADDR_WIDTH {{{:d}}} \\".format( idx, p.width ),                                       file=file)
      idx += 1
    print("  CONFIG.NUM_MI {{{:d}}} \\".format( idx ),                                                                  file=file)
    print("] [get_ips {}]".format( self.name ),                                                                         file=file)

  def _writeComponentDeclaration(self, file=sys.stdout, indent=0):
    ind = "{:{INDENT}}".format("", INDENT=indent)
    print(ind + "component {} is".format( self.name ), file=file)
    print(ind + "  port (", file=file)
    slfmt  = ind + "    {:40s}: {:3s} std_logic;" 
    slvfmt = ind + "    {:40s}: {:3s} std_logic_vector( {:d} downto 0 ){}"
    slvfmt = ind + "    {:40s}: {:3s} std_logic_vector( {:d} downto 0 ){}"
    print(slfmt.format( "aclk",    "in" ), file=file)
    print(slfmt.format( "aresetn", "in" ), file=file)
    sport = AxiPortDecl( "s_axi_", isMst=False, indent=(indent + 4), file=file )
    sport.map()
    mport = AxiPortDecl( "m_axi_", isMst=True,  indent=(indent + 4), nPortsInVect=self.numMst, file=file, isLastPort=True )
    mport.map()
    print(ind+"  );"       , file=file)
    print(ind+"end component {};".format( self.name ), file = file)

  def _writeHdl(self, file=sys.stdout):
    clk = "aclk"
    rst = "aresetn"
    print("-- THIS CODE WAS AUTOMATICALLY GENERATED; DO NOT EDIT",                                 file = file)
    print("-- Wrapper to expose an Axi Crossbar's AXI ports as records (defined",                  file = file)
    print("-- in the 'psi_common_axi_pkg.vhd' package).",                                          file = file)
    print("--",                                                                                    file = file)
    print("-- The crossbar instantiated by the associated TCL script",                             file = file)
    print("-- implements the following mappings:",                                                 file = file)
    pidx = 0
    for p in self._ports:
      print("-- port   start   end",                                                               file = file)
      print("-- [{:2d}] {:s}".format(pidx, p.description),                                         file = file)
      pidx += 1
    print("",                                                                                      file = file)
    print("library ieee;",                                                                         file = file)
    print("use     ieee.std_logic_1164.all;",                                                      file = file)
    print("use     work.psi_common_axi_pkg.all;",                                                  file = file)
    print("",                                                                                      file = file)
    print("entity {}Wrapper is".format( self.name ),                                               file = file)
    print("  port (",                                                                              file = file)
    print("    {:40s}: in  std_logic;".format(clk),                                                file = file)
    print("    {:40s}: in  std_logic;".format(rst),                                                file = file)
    print("    {:40s}: in  rec_axi_ms;".format("saxi_ms", self.numMst - 1),                        file = file)
    print("    {:40s}: out rec_axi_sm;".format("saxi_sm", self.numMst - 1),                        file = file)
    print("    {:40s}: out typ_arr_axi_ms({:d} downto 0);".format("maxi_ms", self.numMst - 1),     file = file)
    print("    {:40s}: in  typ_arr_axi_sm({:d} downto 0)".format("maxi_sm", self.numMst - 1),      file = file)
    print("  );",                                                                                  file = file)
    print("end entity {}Wrapper;".format( self.name ),                                             file = file)
    print("",                                                                                      file = file)
    print("architecture rtl of {}Wrapper is".format( self.name ),                                  file = file)
    self._writeComponentDeclaration(file=file, indent=2)
    print("begin",                                                                                 file = file)
    print("  Xbar_i : component {}".format(self.name),                                             file = file)
    print("    port map (",                                                                        file = file)
    print("      {:40s} => {},".format("aclk",    clk),                                            file = file)
    print("      {:40s} => {},".format("aresetn", rst),                                            file = file)
    m = AxiPortMap( flatPrefix = "s_axi_", recPrefix="saxi",file=file, indent=6, isLastPort=False)
    m.map()
    m = AxiPortMap( flatPrefix = "m_axi_", recPrefix="maxi",file=file, indent=6, numPorts=self.numMst, isLastPort=True )
    m.map()
    print("    );",                                                                                file = file)
    print("end architecture rtl;",                                                                 file = file)
