# Auto-generate code to map between Xilinx/flat AXI ports which expose all the
# signals and records as defined in 'psi_common_axi_pkg'. These are far
# easier to connect between blocks.

import sys
import io

# Object with setters/getters. We want setters to return the object instance
# so that we can write
#    o.prop1(val1).prop2(val2)
# which is not possible with the standard property object. We also want to
# have to write less code, i.e., automatically return a default value if
# a property is not set in the constructor.
# Getting a property value requires a function; just using o.prop is not
# possible. Interpret an empty argument list as a 'get' operation:
#
#   o.prop1()    -> get 'prop1'
#   o.prop1(val) -> set 'prop1' to 'val' and return o

class PropBase:
  # properties are dictionary of properties mapping to a default value
  #
  #  props = { "p1" : dflt1, "p2" : dflt2, ... } 
  #
  # by default: empty
  props = {}

  def __init__(self, **kwargs):
    super().__init__()
    for kv in kwargs.items():
      getattr(self, kv[0])( kv[1] )

  def __init_subclass__(cls, **kwargs):
    # inheritance
    d = cls.__bases__[0].props
    try:
      myprops = cls.props
      d       = d.copy()
      d.update( myprops )
    except AttributeError:
      # this class has nothing to add
      pass
    cls.props = d

  # override __getattribute__()
  def __getattribute__(self, prop):
    # super-class method; we can't call super() from the
    # the local function definition as this would be executed
    # too late...
    sga = super().__getattribute__

    # setter-getter
    def setget(*args):
      if ( len( args ) == 0 ):
        # get
        try:
           return sga("_" + prop)
        except AttributeError as e:
          # not set; return class-specific default
          return self.props[prop]
      else:
        # set
        setattr(self, "_" + prop, *args)
        return self
    if ( prop != "props" ):
      if ( prop in self.props ):
        return setget
    return sga(prop)

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

class AxiPort(PropBase):

  _SIGNALS = {
    "aw.addr"  : [ True, 31  ],
    "aw.id"    : [ True, 0   ],
    "aw.len"   : [ True, 7   ],
    "aw.size"  : [ True, 2   ],
    "aw.burst" : [ True, 1   ],
    "aw.lock"  : [ True,-1   ],
    "aw.cache" : [ True, 3   ],
    "aw.prot"  : [ True, 2   ],
    "aw.qos"   : [ True, 3   ],
    "aw.user"  : [ True, 0   ],
    "aw.valid" : [ True, -1  ],
    "aw.ready" : [ False,-1  ],
    "w.data"   : [ True, 31  ],
    "w.strb"   : [ True, 3   ],
    "w.last"   : [ True,-1   ],
    "w.valid"  : [ True, -1  ],
    "w.ready"  : [ False,-1  ],
    "b.resp"   : [ False, 1  ],
    "b.valid"  : [ False,-1  ],
    "b.ready"  : [ True,-1   ],
    "ar.addr"  : [ True, 31  ],
    "ar.id"    : [ True, 0   ],
    "ar.len"   : [ True, 7   ],
    "ar.size"  : [ True, 2   ],
    "ar.burst" : [ True, 1   ],
    "ar.lock"  : [ True,-1   ],
    "ar.cache" : [ True, 3   ],
    "ar.prot"  : [ True, 2   ],
    "ar.qos"   : [ True, 3   ],
    "ar.user"  : [ True, 0   ],
    "ar.valid" : [ True,-1   ],
    "ar.ready" : [ False,-1  ],
    "r.data"   : [ False, 31 ],
    "r.resp"   : [ False, 1  ],
    "r.last"   : [ False,-1  ],
    "r.valid"  : [ False,-1  ],
    "r.ready"  : [ True,-1   ]
  }

  _AXIL_FILTER_KEYS = [
    "aw.id",
    "aw.len",
    "aw.size",
    "aw.burst",
    "aw.lock",
    "aw.cache",
    "aw.qos",
    "aw.user",
    "w.last",
    "ar.id",
    "ar.len",
    "ar.size",
    "ar.burst",
    "ar.lock",
    "ar.cache",
    "ar.qos",
    "ar.user",
    "r.last"
  ]

  @staticmethod
  def toRecField(port):
    if ( (port == "r") or (port == "w") ):
      return "d"+port
    return port

  props = {
    "file"   : sys.stdout,
    "indent" : 0
  }

  def __init__(self, **kwargs):
    self._s = self._SIGNALS.copy()
    super().__init__(**kwargs)

  def p(self, s, end="\n"):
    print( "{:{IND}}{}".format( "", s, IND = self.indent() ), file=self.file(), end=end )

  def map(self, f=None, arg=None):
    i = len(self.SIGNALS)
    if ( f is None ):
      f = self
    for s in self.SIGNALS.items():
      i -= 1
      nm = s[0].split(".")
      f( nm[0], nm[1], s[1][0], s[1][1] + 1, (i == 0), arg )

  @property
  def SIGNALS(self):
    return self._s

  def filter(self, keys):
    for k in keys:
      del( self._s[k] )

  def setWidth(self, key, val):
    self._s[key][1] = val - 1

  def trimToAxiLite(self):
    self.filter( self._AXIL_FILTER_KEYS )

  def __call__(self, port, sname, m2s, width, isLast, arg):
    raise RuntimeError("Must be implemented by subclass")

class AxiPortDecl(AxiPort):

  props = {
    "fieldWidth"     : 40,
    "nPortsInVect"   : 1,
    "isLastPort"     : False,
    "isMst"          : True,
    "prefix"         : ""
  }

  def __init__(self, prefix, isMst, **kwargs):
    super().__init__(**kwargs)
    self.prefix( prefix )
    self.isMst ( isMst  )

  def __call__(self, port, sname, m2s, width, isLast, arg):
    isMst = self.isMst()
    if isMst is None:
      iofmt = "{:s}"
    else:
      iofmt = "{:4s}"
    f = "{:{W}}: " + iofmt + "std_logic_vector( {:d} downto 0 ){}"
    if ( isMst is None ):
      io = ""
    elif ( m2s == isMst ):
      io = "out"
    else:
      io = "in"
    end = ";"
    if ( isLast and self.isLastPort() ):
      end = ""
    if width == 0:
      width = 1
    self.p( f.format( self.prefix() + port + sname, io, width * self.nPortsInVect() - 1, end, W=self.fieldWidth() ) )

class AxiSignalDecl(AxiPortDecl):

  # change default value
  props = { "fieldWidth" : 20, "numPorts" : 1 }

  def __init__(self, prefix, **kwargs):
    super().__init__(prefix, None, **kwargs)

  def __call__(self, port, sname, m2s, width, isLast, arg):
    self.p( "signal ", end="" )
    orig = self.indent()
    self.indent( 0 )
    if width == 0:
      width = 1
    super().__call__(port, sname, m2s, width * self.numPorts(), isLast, arg)
    self.indent( orig )

  def mapping(self, assign, me, other, isLast):
    rhs = me
    lhs = other
    isMst = self.isMst()
    if isMst is None:
      isMst = True
    if ( assign ):
      op  = "<="
      end = ";"
      if ( isMst != m2s ):
        rhs = other
        lhs = me
    else:
      op  = "=>"
      end = ","
      if ( not isMst ):
        rhs = other
        lhs = me
    if ( self.isLastPort() and isLast ):
      end = ""
    self.p( "{:{FW}}{} {}{}".format( lhs, op, rhs, end, FW=self.fieldWidth() ) )

  def assign(self, port, sname, m2s, width, isLast, arg):
    self.mapping( True, self.prefix() + port + sname, arg + port + sname, isLast )

  def pmap(self, port, sname, m2s, width, isLast, arg):
    self.mapping( False, self.prefix() + port + sname, arg + port + sname, isLast )

# Map a collection of flat signals to rec_axi_ms/rec_axi_sm
class AxiPortMap(AxiPort):

  props = {
    "flatPrefix"      : "",     # prefix of the flat signals
    "recPrefix"       : "",     # prefix of the records
    "pruneAddr"       : None,   # optional: positive number limiting with of address mapping
    "isLastPort"      : False,  # if this is the last port (omitting ',' at the end of the line)
    "fieldWidth"      : 40,     # field width (pretty printing) of LHS
    "useLHRange"      : True,   # whether to use a range on the LHS
    "flatToRec"       : True,   # direction of mapping (currently unused/untested)
    "numPorts"        : 1,      # number of ports (array of records mapped to vectors on the flat side)
    "isAssign"        : False   # create an assignment a <= b;
  }

  def __init__(self, flatPrefix, recPrefix, **kwargs):
    super().__init__(**kwargs)
    self.flatPrefix ( flatPrefix )
    self.recPrefix  ( recPrefix )

  def __call__(self, port, sname, m2s, width, isLast, arg):
    if ( width == 0 ):
      width = 1
    if ( self.numPorts() == 1 ):
      fidx =''
    else:
      fidx = '({2:d})'
    trng = ""
    prunedWidth = width
    if ( (sname == "addr") and (not self.pruneAddr() is None) ):
       prunedWidth = self.pruneAddr()
       trng = "({:} - 1 downto 0)".format( prunedWidth )
    if ( self.isAssign() ):
       op = "<="
    else:
       op = "=>"
    f = "{0:{W}}" + op + " {1}{2}"
    for pidx in range(self.numPorts()):
      if ( self.useLHRange() ):
        if ( (width == 1) and (sname != "user") ):
          rng = "({:d})".format( pidx )
        else:
          r   = pidx * width
          l   = r + prunedWidth - 1
          rng = "({:d} downto {:d})".format( l, r )
      else:
          rng = ""
      flatName = self.flatPrefix() + port + sname + rng
      if ( self.isAssign() ):
        end = ";"
      else:
        end = ","
      if isLast and self.isLastPort() and pidx == self.numPorts() - 1:
        end = ""

      #    flatToRec     dir-OUT                 ASSIGN
      #       false      false           rec_sm    <= flat    
      #       false      true            flat      <= rec_ms
      #       true       false           flat      <= rec_sm  
      #       true       true            rec_ms    <= flat
      #                                           MAP
      #       true       false           flat      => rec_sm  
      #       true       true            flat      => rec_ms
      #       false      false           rec_sm    => flat    
      #       false      true            rec_ms    => flat
      if ( m2s ):
        direction = "ms"
      else:
        direction = "sm"

      recName = ("{0}_{1}" + fidx + ".{3}.{4}" + trng).format( self.recPrefix(), direction, pidx, self.toRecField( port ), sname )

      if ( self.isAssign() ):
        if (m2s != self.flatToRec() ):
          lhs = flatName
          rhs = recName
        else:
          lhs = recName
          rhs = flatName
      else:
         if ( self.flatToRec() ):
           lhs = flatName
           rhs = recName
         else:
           lhs = recName
           rhs = flatName
      self.p( f.format(lhs, rhs, end, W=self.fieldWidth()) )

# Xilinx AXI Crossbar IP
class AxiXbar:

  # The crossbar does not use the ID signals
  _skip = [ "aw.id", "ar.id" ]

  def __init__(self, ports, name="AxiXBar", saddrWidth=32):
    self._ports = []
    if ( saddrWidth < 32 or saddrWidth > 64 ):
      raise RuntimeError("invalid saddrWidth")
    self._sawidth = saddrWidth
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
    print("create_ip -name axi_crossbar -vendor xilinx.com -library ip -version {{2.*}} -module_name {}".format( self.name ), file=file )
    print("set_property -dict [list \\",                                                                                file=file)
    print("  CONFIG.ARUSER_WIDTH {1} \\",                                                                               file=file)
    print("  CONFIG.AWUSER_WIDTH {1} \\",                                                                               file=file)
    idx = 0
    for p in self._ports:
      print("  CONFIG.M{:02d}_A00_BASE_ADDR  {{0x{:016x}}} \\".format( idx, p.addr ),                                   file=file)
      print("  CONFIG.M{:02d}_A00_ADDR_WIDTH {{{:d}}} \\".format( idx, p.width ),                                       file=file)
      idx += 1
    print("  CONFIG.NUM_MI {{{:d}}} \\".format( idx ),                                                                  file=file)
    if self._sawidth != 32:
      print("  CONFIG.ADDR_WIDTH {{{:d}}} \\".format( self._sawidth ),
                   file=file)

    print("] [get_ips {}]".format( self.name ),                                                                         file=file)

  def _writeComponentDeclaration(self, file=sys.stdout, indent=0):
    ind = "{:{INDENT}}".format("", INDENT=indent)
    print(ind + "component {} is".format( self.name ), file=file)
    print(ind + "  port (", file=file)
    slfmt  = ind + "    {:40s}: {:3s} std_logic;" 
    slvfmt = ind + "    {:40s}: {:3s} std_logic_vector( {:d} downto 0 ){}"
    print(slfmt.format( "aclk",    "in" ), file=file)
    print(slfmt.format( "aresetn", "in" ), file=file)
    port = AxiPortDecl( prefix="s_axi_", isMst=False, indent=(indent + 4), file=file )
    port.filter( self._skip )
    port.setWidth( "ar.addr", self._sawidth )
    port.setWidth( "aw.addr", self._sawidth )
    # crossbar 
    port.map()
    port.prefix( "m_axi_" ).isMst( True ).nPortsInVect( self.numMst ).isLastPort( True )
    port.map()
    print(ind+"  );"       , file=file)
    print(ind+"end component {};".format( self.name ), file = file)

  def _writeHdl(self, file=sys.stdout):
    clk = "axi_aclk"
    rst = "axi_aresetn"
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
    n = "saxi_araddr_hi"
    l = 39
    print("    {:40s}: in  std_logic_vector( {:d} downto 32 ) := (others => '0');".format(n, l),   file = file)
    n = "saxi_awaddr_hi"
    print("    {:40s}: in  std_logic_vector( {:d} downto 32 ) := (others => '0');".format(n, l),   file = file)
    print("    {:40s}: in  rec_axi_ms;".format("saxi_ms", self.numMst - 1),                        file = file)
    print("    {:40s}: out rec_axi_sm;".format("saxi_sm", self.numMst - 1),                        file = file)
    print("    {:40s}: out typ_arr_axi_ms({:d} downto 0);".format("maxi_ms", self.numMst - 1),     file = file)
    print("    {:40s}: in  typ_arr_axi_sm({:d} downto 0)".format("maxi_sm", self.numMst - 1),      file = file)
    print("  );",                                                                                  file = file)
    print("end entity {}Wrapper;".format( self.name ),                                             file = file)
    print("",                                                                                      file = file)
    print("architecture rtl of {}Wrapper is".format( self.name ),                                  file = file)
    self._writeComponentDeclaration(file=file, indent=2)
    print("",                                                                                      file = file)

    msig = AxiSignalDecl( "m_axi00_", file=file, indent=2)
    msig.numPorts( self.numMst )
    msig.filter( self._skip )
    msig.map()
    print("",                                                                                      file = file)

    ssig = AxiSignalDecl( "s_axi00_", file=file, indent=2)
    ssig.filter( self._skip )
    ssig.map()
    print("",                                                                                      file = file)

    print("begin",                                                                                 file = file)
    print("  Xbar_i : component {}".format(self.name),                                             file = file)
    print("    port map (",                                                                        file = file)
    print("      {:40s}=> {},".format("aclk",    clk),                                            file = file)
    print("      {:40s}=> {},".format("aresetn", rst),                                            file = file)
    ssig.fieldWidth( 40 ).indent(6).map(ssig.pmap, "s_axi_")
    msig.isLastPort(True)
    msig.fieldWidth( 40 ).indent(6).map(msig.pmap, "m_axi_")
    print("    );",                                                                                file = file)
    print("",                                                                                     file = file)

    # map intermediate signals to records
    # master ports first; we can use standard features to map addresses != 32
    m = AxiPortMap( flatPrefix = "m_axi00_", recPrefix="maxi",file=file, indent=2)
    m.filter( self._skip )
    m.numPorts( self.numMst ).isAssign(True)
    if self._sawidth > 32:
      m.pruneAddr(32)
    m.map()
    print("",                                                                                     file = file)

    m.flatPrefix("s_axi00_").recPrefix("saxi").numPorts(1).flatToRec( False )
    m.map()
    # extra address lines
    if ( self._sawidth > 32 ):
      l = self._sawidth - 1
      nam = "s_axi00_araddr({:d} downto 32)".format( l )
      print("  {:40s}<= saxi_araddr_hi({:d} downto 32);".format( nam, l ),                        file = file)
      nam = "s_axi00_awaddr({:d} downto 32)".format( l )
      print("  {:40s}<= saxi_awaddr_hi({:d} downto 32);".format( nam, l ),                        file = file)
    print("end architecture rtl;",                                                                file = file)

class AxiSubMap(AxiPortMap):

  props = {
    "indent"     :   6,
    "fieldWidth" :  28
  }

  def __init__(self, flatPrefix="s00_axi_", recPrefix="axi", **kwargs):
    super().__init__(flatPrefix, recPrefix, **kwargs)
    self.filter( ["ar.qos", "aw.qos", "ar.user", "aw.user"] )
    self.useLHRange( False )

  def write(self, fnam):
    fo=self.file()
    try:
      with io.open(fnam, "w") as f:
        self.file(f)
        self.map()
    finally:
      self.file(fo)

    
class AxiIlaMap(AxiPort):

  props = {
    "ilaPrefix"       : "probe0",        # prefix of the ILA port
    "recPrefix"       : "axi",            # prefix of the records
    "pruneAddr"       : None,            # optional: positive number limiting with of address mapping
    "fieldWidth"      : 40               # field width (pretty printing) of LHS
  }

  def __init__(self, **kwargs):
    super().__init__(**kwargs)
    self._i = 0

  def map(self, f=None, arg=None):
    self._i = 0
    super().map(f, arg)

  def __call__(self, port, sname, m2s, width, isLast, arg):
    isVect = (width != 0)
    if ( not isVect ):
      width = 1
    e = self._i + width
    trng = ""
    if ( ( not self.pruneAddr() is None ) and ( sname == "addr" ) ):
      width = self.pruneAddr()
      trng = "({:d} downto 0)".format( width - 1 )

    if ( isVect ):
      p = self.ilaPrefix() + "({:d} downto {:d})".format( e - 1, self._i )
    else:
      p = self.ilaPrefix() + "({:d})".format( self._i )
    end = ","
    if ( isLast ):
      end = ""

    if ( m2s ):
      dir = "m"
    else:
      dir = "s"
    
    f = "{:{W}} => {}{}.{}.{}" + trng + end
    self.p( f.format( p, self.recPrefix(), dir, self.toRecField(port), sname, W=self.fieldWidth() ) )
    self._i = e
