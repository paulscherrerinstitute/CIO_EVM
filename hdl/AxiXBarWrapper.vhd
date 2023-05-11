-- THIS CODE WAS AUTOMATICALLY GENERATED; DO NOT EDIT
-- Wrapper to expose an Axi Crossbar's AXI ports as records (defined
-- in the 'psi_common_axi_pkg.vhd' package).
--
-- The crossbar instantiated by the associated TCL script
-- implements the following mappings:
-- port   start   end
-- [ 0] 0xa0000000..0xa0000fff
-- port   start   end
-- [ 1] 0xa0001000..0xa0001fff
-- port   start   end
-- [ 2] 0xa0002000..0xa0002fff
-- port   start   end
-- [ 3] 0xa0008000..0xa000bfff
-- port   start   end
-- [ 4] 0xa8000000..0xa9ffffff

library ieee;
use     ieee.std_logic_1164.all;
use     work.psi_common_axi_pkg.all;

entity AxiXBarWrapper is
  port (
    axi_aclk                                : in  std_logic;
    axi_aresetn                             : in  std_logic;
    saxi_ms                                 : in  rec_axi_ms;
    saxi_sm                                 : out rec_axi_sm;
    maxi_ms                                 : out typ_arr_axi_ms(4 downto 0);
    maxi_sm                                 : in  typ_arr_axi_sm(4 downto 0)
  );
end entity AxiXBarWrapper;

architecture rtl of AxiXBarWrapper is
  component AxiXBar is
    port (
      aclk                                    : in  std_logic;
      aresetn                                 : in  std_logic;
      s_axi_awaddr                            : in  std_logic_vector( 31 downto 0 );
      s_axi_awlen                             : in  std_logic_vector( 7 downto 0 );
      s_axi_awsize                            : in  std_logic_vector( 2 downto 0 );
      s_axi_awburst                           : in  std_logic_vector( 1 downto 0 );
      s_axi_awlock                            : in  std_logic_vector( 0 downto 0 );
      s_axi_awcache                           : in  std_logic_vector( 3 downto 0 );
      s_axi_awprot                            : in  std_logic_vector( 2 downto 0 );
      s_axi_awqos                             : in  std_logic_vector( 3 downto 0 );
      s_axi_awuser                            : in  std_logic_vector( 0 downto 0 );
      s_axi_awvalid                           : in  std_logic_vector( 0 downto 0 );
      s_axi_awready                           : out std_logic_vector( 0 downto 0 );
      s_axi_wdata                             : in  std_logic_vector( 31 downto 0 );
      s_axi_wstrb                             : in  std_logic_vector( 3 downto 0 );
      s_axi_wlast                             : in  std_logic_vector( 0 downto 0 );
      s_axi_wvalid                            : in  std_logic_vector( 0 downto 0 );
      s_axi_wready                            : out std_logic_vector( 0 downto 0 );
      s_axi_bresp                             : out std_logic_vector( 1 downto 0 );
      s_axi_bvalid                            : out std_logic_vector( 0 downto 0 );
      s_axi_bready                            : in  std_logic_vector( 0 downto 0 );
      s_axi_araddr                            : in  std_logic_vector( 31 downto 0 );
      s_axi_arlen                             : in  std_logic_vector( 7 downto 0 );
      s_axi_arsize                            : in  std_logic_vector( 2 downto 0 );
      s_axi_arburst                           : in  std_logic_vector( 1 downto 0 );
      s_axi_arlock                            : in  std_logic_vector( 0 downto 0 );
      s_axi_arcache                           : in  std_logic_vector( 3 downto 0 );
      s_axi_arprot                            : in  std_logic_vector( 2 downto 0 );
      s_axi_arqos                             : in  std_logic_vector( 3 downto 0 );
      s_axi_aruser                            : in  std_logic_vector( 0 downto 0 );
      s_axi_arvalid                           : in  std_logic_vector( 0 downto 0 );
      s_axi_arready                           : out std_logic_vector( 0 downto 0 );
      s_axi_rdata                             : out std_logic_vector( 31 downto 0 );
      s_axi_rresp                             : out std_logic_vector( 1 downto 0 );
      s_axi_rlast                             : out std_logic_vector( 0 downto 0 );
      s_axi_rvalid                            : out std_logic_vector( 0 downto 0 );
      s_axi_rready                            : in  std_logic_vector( 0 downto 0 );
      m_axi_awaddr                            : out std_logic_vector( 159 downto 0 );
      m_axi_awlen                             : out std_logic_vector( 39 downto 0 );
      m_axi_awsize                            : out std_logic_vector( 14 downto 0 );
      m_axi_awburst                           : out std_logic_vector( 9 downto 0 );
      m_axi_awlock                            : out std_logic_vector( 4 downto 0 );
      m_axi_awcache                           : out std_logic_vector( 19 downto 0 );
      m_axi_awprot                            : out std_logic_vector( 14 downto 0 );
      m_axi_awqos                             : out std_logic_vector( 19 downto 0 );
      m_axi_awuser                            : out std_logic_vector( 4 downto 0 );
      m_axi_awvalid                           : out std_logic_vector( 4 downto 0 );
      m_axi_awready                           : in  std_logic_vector( 4 downto 0 );
      m_axi_wdata                             : out std_logic_vector( 159 downto 0 );
      m_axi_wstrb                             : out std_logic_vector( 19 downto 0 );
      m_axi_wlast                             : out std_logic_vector( 4 downto 0 );
      m_axi_wvalid                            : out std_logic_vector( 4 downto 0 );
      m_axi_wready                            : in  std_logic_vector( 4 downto 0 );
      m_axi_bresp                             : in  std_logic_vector( 9 downto 0 );
      m_axi_bvalid                            : in  std_logic_vector( 4 downto 0 );
      m_axi_bready                            : out std_logic_vector( 4 downto 0 );
      m_axi_araddr                            : out std_logic_vector( 159 downto 0 );
      m_axi_arlen                             : out std_logic_vector( 39 downto 0 );
      m_axi_arsize                            : out std_logic_vector( 14 downto 0 );
      m_axi_arburst                           : out std_logic_vector( 9 downto 0 );
      m_axi_arlock                            : out std_logic_vector( 4 downto 0 );
      m_axi_arcache                           : out std_logic_vector( 19 downto 0 );
      m_axi_arprot                            : out std_logic_vector( 14 downto 0 );
      m_axi_arqos                             : out std_logic_vector( 19 downto 0 );
      m_axi_aruser                            : out std_logic_vector( 4 downto 0 );
      m_axi_arvalid                           : out std_logic_vector( 4 downto 0 );
      m_axi_arready                           : in  std_logic_vector( 4 downto 0 );
      m_axi_rdata                             : in  std_logic_vector( 159 downto 0 );
      m_axi_rresp                             : in  std_logic_vector( 9 downto 0 );
      m_axi_rlast                             : in  std_logic_vector( 4 downto 0 );
      m_axi_rvalid                            : in  std_logic_vector( 4 downto 0 );
      m_axi_rready                            : out std_logic_vector( 4 downto 0 )
    );
  end component AxiXBar;
begin
  Xbar_i : component AxiXBar
    port map (
      aclk                                    => axi_aclk,
      aresetn                                 => axi_aresetn,
      s_axi_awaddr(31 downto 0)               => saxi_ms.aw.addr,
      s_axi_awlen(7 downto 0)                 => saxi_ms.aw.len,
      s_axi_awsize(2 downto 0)                => saxi_ms.aw.size,
      s_axi_awburst(1 downto 0)               => saxi_ms.aw.burst,
      s_axi_awlock(0)                         => saxi_ms.aw.lock,
      s_axi_awcache(3 downto 0)               => saxi_ms.aw.cache,
      s_axi_awprot(2 downto 0)                => saxi_ms.aw.prot,
      s_axi_awqos(3 downto 0)                 => saxi_ms.aw.qos,
      s_axi_awuser(0 downto 0)                => saxi_ms.aw.user,
      s_axi_awvalid(0)                        => saxi_ms.aw.valid,
      s_axi_awready(0)                        => saxi_sm.aw.ready,
      s_axi_wdata(31 downto 0)                => saxi_ms.dw.data,
      s_axi_wstrb(3 downto 0)                 => saxi_ms.dw.strb,
      s_axi_wlast(0)                          => saxi_ms.dw.last,
      s_axi_wvalid(0)                         => saxi_ms.dw.valid,
      s_axi_wready(0)                         => saxi_sm.dw.ready,
      s_axi_bresp(1 downto 0)                 => saxi_sm.b.resp,
      s_axi_bvalid(0)                         => saxi_sm.b.valid,
      s_axi_bready(0)                         => saxi_ms.b.ready,
      s_axi_araddr(31 downto 0)               => saxi_ms.ar.addr,
      s_axi_arlen(7 downto 0)                 => saxi_ms.ar.len,
      s_axi_arsize(2 downto 0)                => saxi_ms.ar.size,
      s_axi_arburst(1 downto 0)               => saxi_ms.ar.burst,
      s_axi_arlock(0)                         => saxi_ms.ar.lock,
      s_axi_arcache(3 downto 0)               => saxi_ms.ar.cache,
      s_axi_arprot(2 downto 0)                => saxi_ms.ar.prot,
      s_axi_arqos(3 downto 0)                 => saxi_ms.ar.qos,
      s_axi_aruser(0 downto 0)                => saxi_ms.ar.user,
      s_axi_arvalid(0)                        => saxi_ms.ar.valid,
      s_axi_arready(0)                        => saxi_sm.ar.ready,
      s_axi_rdata(31 downto 0)                => saxi_sm.dr.data,
      s_axi_rresp(1 downto 0)                 => saxi_sm.dr.resp,
      s_axi_rlast(0)                          => saxi_sm.dr.last,
      s_axi_rvalid(0)                         => saxi_sm.dr.valid,
      s_axi_rready(0)                         => saxi_ms.dr.ready,
      m_axi_awaddr(31 downto 0)               => maxi_ms(0).aw.addr,
      m_axi_awaddr(63 downto 32)              => maxi_ms(1).aw.addr,
      m_axi_awaddr(95 downto 64)              => maxi_ms(2).aw.addr,
      m_axi_awaddr(127 downto 96)             => maxi_ms(3).aw.addr,
      m_axi_awaddr(159 downto 128)            => maxi_ms(4).aw.addr,
      m_axi_awlen(7 downto 0)                 => maxi_ms(0).aw.len,
      m_axi_awlen(15 downto 8)                => maxi_ms(1).aw.len,
      m_axi_awlen(23 downto 16)               => maxi_ms(2).aw.len,
      m_axi_awlen(31 downto 24)               => maxi_ms(3).aw.len,
      m_axi_awlen(39 downto 32)               => maxi_ms(4).aw.len,
      m_axi_awsize(2 downto 0)                => maxi_ms(0).aw.size,
      m_axi_awsize(5 downto 3)                => maxi_ms(1).aw.size,
      m_axi_awsize(8 downto 6)                => maxi_ms(2).aw.size,
      m_axi_awsize(11 downto 9)               => maxi_ms(3).aw.size,
      m_axi_awsize(14 downto 12)              => maxi_ms(4).aw.size,
      m_axi_awburst(1 downto 0)               => maxi_ms(0).aw.burst,
      m_axi_awburst(3 downto 2)               => maxi_ms(1).aw.burst,
      m_axi_awburst(5 downto 4)               => maxi_ms(2).aw.burst,
      m_axi_awburst(7 downto 6)               => maxi_ms(3).aw.burst,
      m_axi_awburst(9 downto 8)               => maxi_ms(4).aw.burst,
      m_axi_awlock(0)                         => maxi_ms(0).aw.lock,
      m_axi_awlock(1)                         => maxi_ms(1).aw.lock,
      m_axi_awlock(2)                         => maxi_ms(2).aw.lock,
      m_axi_awlock(3)                         => maxi_ms(3).aw.lock,
      m_axi_awlock(4)                         => maxi_ms(4).aw.lock,
      m_axi_awcache(3 downto 0)               => maxi_ms(0).aw.cache,
      m_axi_awcache(7 downto 4)               => maxi_ms(1).aw.cache,
      m_axi_awcache(11 downto 8)              => maxi_ms(2).aw.cache,
      m_axi_awcache(15 downto 12)             => maxi_ms(3).aw.cache,
      m_axi_awcache(19 downto 16)             => maxi_ms(4).aw.cache,
      m_axi_awprot(2 downto 0)                => maxi_ms(0).aw.prot,
      m_axi_awprot(5 downto 3)                => maxi_ms(1).aw.prot,
      m_axi_awprot(8 downto 6)                => maxi_ms(2).aw.prot,
      m_axi_awprot(11 downto 9)               => maxi_ms(3).aw.prot,
      m_axi_awprot(14 downto 12)              => maxi_ms(4).aw.prot,
      m_axi_awqos(3 downto 0)                 => maxi_ms(0).aw.qos,
      m_axi_awqos(7 downto 4)                 => maxi_ms(1).aw.qos,
      m_axi_awqos(11 downto 8)                => maxi_ms(2).aw.qos,
      m_axi_awqos(15 downto 12)               => maxi_ms(3).aw.qos,
      m_axi_awqos(19 downto 16)               => maxi_ms(4).aw.qos,
      m_axi_awuser(0 downto 0)                => maxi_ms(0).aw.user,
      m_axi_awuser(1 downto 1)                => maxi_ms(1).aw.user,
      m_axi_awuser(2 downto 2)                => maxi_ms(2).aw.user,
      m_axi_awuser(3 downto 3)                => maxi_ms(3).aw.user,
      m_axi_awuser(4 downto 4)                => maxi_ms(4).aw.user,
      m_axi_awvalid(0)                        => maxi_ms(0).aw.valid,
      m_axi_awvalid(1)                        => maxi_ms(1).aw.valid,
      m_axi_awvalid(2)                        => maxi_ms(2).aw.valid,
      m_axi_awvalid(3)                        => maxi_ms(3).aw.valid,
      m_axi_awvalid(4)                        => maxi_ms(4).aw.valid,
      m_axi_awready(0)                        => maxi_sm(0).aw.ready,
      m_axi_awready(1)                        => maxi_sm(1).aw.ready,
      m_axi_awready(2)                        => maxi_sm(2).aw.ready,
      m_axi_awready(3)                        => maxi_sm(3).aw.ready,
      m_axi_awready(4)                        => maxi_sm(4).aw.ready,
      m_axi_wdata(31 downto 0)                => maxi_ms(0).dw.data,
      m_axi_wdata(63 downto 32)               => maxi_ms(1).dw.data,
      m_axi_wdata(95 downto 64)               => maxi_ms(2).dw.data,
      m_axi_wdata(127 downto 96)              => maxi_ms(3).dw.data,
      m_axi_wdata(159 downto 128)             => maxi_ms(4).dw.data,
      m_axi_wstrb(3 downto 0)                 => maxi_ms(0).dw.strb,
      m_axi_wstrb(7 downto 4)                 => maxi_ms(1).dw.strb,
      m_axi_wstrb(11 downto 8)                => maxi_ms(2).dw.strb,
      m_axi_wstrb(15 downto 12)               => maxi_ms(3).dw.strb,
      m_axi_wstrb(19 downto 16)               => maxi_ms(4).dw.strb,
      m_axi_wlast(0)                          => maxi_ms(0).dw.last,
      m_axi_wlast(1)                          => maxi_ms(1).dw.last,
      m_axi_wlast(2)                          => maxi_ms(2).dw.last,
      m_axi_wlast(3)                          => maxi_ms(3).dw.last,
      m_axi_wlast(4)                          => maxi_ms(4).dw.last,
      m_axi_wvalid(0)                         => maxi_ms(0).dw.valid,
      m_axi_wvalid(1)                         => maxi_ms(1).dw.valid,
      m_axi_wvalid(2)                         => maxi_ms(2).dw.valid,
      m_axi_wvalid(3)                         => maxi_ms(3).dw.valid,
      m_axi_wvalid(4)                         => maxi_ms(4).dw.valid,
      m_axi_wready(0)                         => maxi_sm(0).dw.ready,
      m_axi_wready(1)                         => maxi_sm(1).dw.ready,
      m_axi_wready(2)                         => maxi_sm(2).dw.ready,
      m_axi_wready(3)                         => maxi_sm(3).dw.ready,
      m_axi_wready(4)                         => maxi_sm(4).dw.ready,
      m_axi_bresp(1 downto 0)                 => maxi_sm(0).b.resp,
      m_axi_bresp(3 downto 2)                 => maxi_sm(1).b.resp,
      m_axi_bresp(5 downto 4)                 => maxi_sm(2).b.resp,
      m_axi_bresp(7 downto 6)                 => maxi_sm(3).b.resp,
      m_axi_bresp(9 downto 8)                 => maxi_sm(4).b.resp,
      m_axi_bvalid(0)                         => maxi_sm(0).b.valid,
      m_axi_bvalid(1)                         => maxi_sm(1).b.valid,
      m_axi_bvalid(2)                         => maxi_sm(2).b.valid,
      m_axi_bvalid(3)                         => maxi_sm(3).b.valid,
      m_axi_bvalid(4)                         => maxi_sm(4).b.valid,
      m_axi_bready(0)                         => maxi_ms(0).b.ready,
      m_axi_bready(1)                         => maxi_ms(1).b.ready,
      m_axi_bready(2)                         => maxi_ms(2).b.ready,
      m_axi_bready(3)                         => maxi_ms(3).b.ready,
      m_axi_bready(4)                         => maxi_ms(4).b.ready,
      m_axi_araddr(31 downto 0)               => maxi_ms(0).ar.addr,
      m_axi_araddr(63 downto 32)              => maxi_ms(1).ar.addr,
      m_axi_araddr(95 downto 64)              => maxi_ms(2).ar.addr,
      m_axi_araddr(127 downto 96)             => maxi_ms(3).ar.addr,
      m_axi_araddr(159 downto 128)            => maxi_ms(4).ar.addr,
      m_axi_arlen(7 downto 0)                 => maxi_ms(0).ar.len,
      m_axi_arlen(15 downto 8)                => maxi_ms(1).ar.len,
      m_axi_arlen(23 downto 16)               => maxi_ms(2).ar.len,
      m_axi_arlen(31 downto 24)               => maxi_ms(3).ar.len,
      m_axi_arlen(39 downto 32)               => maxi_ms(4).ar.len,
      m_axi_arsize(2 downto 0)                => maxi_ms(0).ar.size,
      m_axi_arsize(5 downto 3)                => maxi_ms(1).ar.size,
      m_axi_arsize(8 downto 6)                => maxi_ms(2).ar.size,
      m_axi_arsize(11 downto 9)               => maxi_ms(3).ar.size,
      m_axi_arsize(14 downto 12)              => maxi_ms(4).ar.size,
      m_axi_arburst(1 downto 0)               => maxi_ms(0).ar.burst,
      m_axi_arburst(3 downto 2)               => maxi_ms(1).ar.burst,
      m_axi_arburst(5 downto 4)               => maxi_ms(2).ar.burst,
      m_axi_arburst(7 downto 6)               => maxi_ms(3).ar.burst,
      m_axi_arburst(9 downto 8)               => maxi_ms(4).ar.burst,
      m_axi_arlock(0)                         => maxi_ms(0).ar.lock,
      m_axi_arlock(1)                         => maxi_ms(1).ar.lock,
      m_axi_arlock(2)                         => maxi_ms(2).ar.lock,
      m_axi_arlock(3)                         => maxi_ms(3).ar.lock,
      m_axi_arlock(4)                         => maxi_ms(4).ar.lock,
      m_axi_arcache(3 downto 0)               => maxi_ms(0).ar.cache,
      m_axi_arcache(7 downto 4)               => maxi_ms(1).ar.cache,
      m_axi_arcache(11 downto 8)              => maxi_ms(2).ar.cache,
      m_axi_arcache(15 downto 12)             => maxi_ms(3).ar.cache,
      m_axi_arcache(19 downto 16)             => maxi_ms(4).ar.cache,
      m_axi_arprot(2 downto 0)                => maxi_ms(0).ar.prot,
      m_axi_arprot(5 downto 3)                => maxi_ms(1).ar.prot,
      m_axi_arprot(8 downto 6)                => maxi_ms(2).ar.prot,
      m_axi_arprot(11 downto 9)               => maxi_ms(3).ar.prot,
      m_axi_arprot(14 downto 12)              => maxi_ms(4).ar.prot,
      m_axi_arqos(3 downto 0)                 => maxi_ms(0).ar.qos,
      m_axi_arqos(7 downto 4)                 => maxi_ms(1).ar.qos,
      m_axi_arqos(11 downto 8)                => maxi_ms(2).ar.qos,
      m_axi_arqos(15 downto 12)               => maxi_ms(3).ar.qos,
      m_axi_arqos(19 downto 16)               => maxi_ms(4).ar.qos,
      m_axi_aruser(0 downto 0)                => maxi_ms(0).ar.user,
      m_axi_aruser(1 downto 1)                => maxi_ms(1).ar.user,
      m_axi_aruser(2 downto 2)                => maxi_ms(2).ar.user,
      m_axi_aruser(3 downto 3)                => maxi_ms(3).ar.user,
      m_axi_aruser(4 downto 4)                => maxi_ms(4).ar.user,
      m_axi_arvalid(0)                        => maxi_ms(0).ar.valid,
      m_axi_arvalid(1)                        => maxi_ms(1).ar.valid,
      m_axi_arvalid(2)                        => maxi_ms(2).ar.valid,
      m_axi_arvalid(3)                        => maxi_ms(3).ar.valid,
      m_axi_arvalid(4)                        => maxi_ms(4).ar.valid,
      m_axi_arready(0)                        => maxi_sm(0).ar.ready,
      m_axi_arready(1)                        => maxi_sm(1).ar.ready,
      m_axi_arready(2)                        => maxi_sm(2).ar.ready,
      m_axi_arready(3)                        => maxi_sm(3).ar.ready,
      m_axi_arready(4)                        => maxi_sm(4).ar.ready,
      m_axi_rdata(31 downto 0)                => maxi_sm(0).dr.data,
      m_axi_rdata(63 downto 32)               => maxi_sm(1).dr.data,
      m_axi_rdata(95 downto 64)               => maxi_sm(2).dr.data,
      m_axi_rdata(127 downto 96)              => maxi_sm(3).dr.data,
      m_axi_rdata(159 downto 128)             => maxi_sm(4).dr.data,
      m_axi_rresp(1 downto 0)                 => maxi_sm(0).dr.resp,
      m_axi_rresp(3 downto 2)                 => maxi_sm(1).dr.resp,
      m_axi_rresp(5 downto 4)                 => maxi_sm(2).dr.resp,
      m_axi_rresp(7 downto 6)                 => maxi_sm(3).dr.resp,
      m_axi_rresp(9 downto 8)                 => maxi_sm(4).dr.resp,
      m_axi_rlast(0)                          => maxi_sm(0).dr.last,
      m_axi_rlast(1)                          => maxi_sm(1).dr.last,
      m_axi_rlast(2)                          => maxi_sm(2).dr.last,
      m_axi_rlast(3)                          => maxi_sm(3).dr.last,
      m_axi_rlast(4)                          => maxi_sm(4).dr.last,
      m_axi_rvalid(0)                         => maxi_sm(0).dr.valid,
      m_axi_rvalid(1)                         => maxi_sm(1).dr.valid,
      m_axi_rvalid(2)                         => maxi_sm(2).dr.valid,
      m_axi_rvalid(3)                         => maxi_sm(3).dr.valid,
      m_axi_rvalid(4)                         => maxi_sm(4).dr.valid,
      m_axi_rready(0)                         => maxi_ms(0).dr.ready,
      m_axi_rready(1)                         => maxi_ms(1).dr.ready,
      m_axi_rready(2)                         => maxi_ms(2).dr.ready,
      m_axi_rready(3)                         => maxi_ms(3).dr.ready,
      m_axi_rready(4)                         => maxi_ms(4).dr.ready
    );
end architecture rtl;
