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
-- [ 4] 0xa8000000..0xa801ffff
-- port   start   end
-- [ 5] 0xa8020000..0xa802ffff
-- port   start   end
-- [ 6] 0xa8030000..0xa803ffff

library ieee;
use     ieee.std_logic_1164.all;
use     work.psi_common_axi_pkg.all;

entity AxiXBarWrapper is
  port (
    axi_aclk                                : in  std_logic;
    axi_aresetn                             : in  std_logic;
    saxi_araddr_hi                          : in  std_logic_vector( 39 downto 32 ) := (others => '0');
    saxi_awaddr_hi                          : in  std_logic_vector( 39 downto 32 ) := (others => '0');
    saxi_ms                                 : in  rec_axi_ms;
    saxi_sm                                 : out rec_axi_sm;
    maxi_ms                                 : out typ_arr_axi_ms(6 downto 0);
    maxi_sm                                 : in  typ_arr_axi_sm(6 downto 0)
  );
end entity AxiXBarWrapper;

architecture rtl of AxiXBarWrapper is
  component AxiXBar is
    port (
      aclk                                    : in  std_logic;
      aresetn                                 : in  std_logic;
      s_axi_awaddr                            : in  std_logic_vector( 39 downto 0 );
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
      s_axi_araddr                            : in  std_logic_vector( 39 downto 0 );
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
      m_axi_awaddr                            : out std_logic_vector( 279 downto 0 );
      m_axi_awlen                             : out std_logic_vector( 55 downto 0 );
      m_axi_awsize                            : out std_logic_vector( 20 downto 0 );
      m_axi_awburst                           : out std_logic_vector( 13 downto 0 );
      m_axi_awlock                            : out std_logic_vector( 6 downto 0 );
      m_axi_awcache                           : out std_logic_vector( 27 downto 0 );
      m_axi_awprot                            : out std_logic_vector( 20 downto 0 );
      m_axi_awqos                             : out std_logic_vector( 27 downto 0 );
      m_axi_awuser                            : out std_logic_vector( 6 downto 0 );
      m_axi_awvalid                           : out std_logic_vector( 6 downto 0 );
      m_axi_awready                           : in  std_logic_vector( 6 downto 0 );
      m_axi_wdata                             : out std_logic_vector( 223 downto 0 );
      m_axi_wstrb                             : out std_logic_vector( 27 downto 0 );
      m_axi_wlast                             : out std_logic_vector( 6 downto 0 );
      m_axi_wvalid                            : out std_logic_vector( 6 downto 0 );
      m_axi_wready                            : in  std_logic_vector( 6 downto 0 );
      m_axi_bresp                             : in  std_logic_vector( 13 downto 0 );
      m_axi_bvalid                            : in  std_logic_vector( 6 downto 0 );
      m_axi_bready                            : out std_logic_vector( 6 downto 0 );
      m_axi_araddr                            : out std_logic_vector( 279 downto 0 );
      m_axi_arlen                             : out std_logic_vector( 55 downto 0 );
      m_axi_arsize                            : out std_logic_vector( 20 downto 0 );
      m_axi_arburst                           : out std_logic_vector( 13 downto 0 );
      m_axi_arlock                            : out std_logic_vector( 6 downto 0 );
      m_axi_arcache                           : out std_logic_vector( 27 downto 0 );
      m_axi_arprot                            : out std_logic_vector( 20 downto 0 );
      m_axi_arqos                             : out std_logic_vector( 27 downto 0 );
      m_axi_aruser                            : out std_logic_vector( 6 downto 0 );
      m_axi_arvalid                           : out std_logic_vector( 6 downto 0 );
      m_axi_arready                           : in  std_logic_vector( 6 downto 0 );
      m_axi_rdata                             : in  std_logic_vector( 223 downto 0 );
      m_axi_rresp                             : in  std_logic_vector( 13 downto 0 );
      m_axi_rlast                             : in  std_logic_vector( 6 downto 0 );
      m_axi_rvalid                            : in  std_logic_vector( 6 downto 0 );
      m_axi_rready                            : out std_logic_vector( 6 downto 0 )
    );
  end component AxiXBar;

  signal m_axi00_awaddr      : std_logic_vector( 279 downto 0 );
  signal m_axi00_awlen       : std_logic_vector( 55 downto 0 );
  signal m_axi00_awsize      : std_logic_vector( 20 downto 0 );
  signal m_axi00_awburst     : std_logic_vector( 13 downto 0 );
  signal m_axi00_awlock      : std_logic_vector( 6 downto 0 );
  signal m_axi00_awcache     : std_logic_vector( 27 downto 0 );
  signal m_axi00_awprot      : std_logic_vector( 20 downto 0 );
  signal m_axi00_awqos       : std_logic_vector( 27 downto 0 );
  signal m_axi00_awuser      : std_logic_vector( 6 downto 0 );
  signal m_axi00_awvalid     : std_logic_vector( 6 downto 0 );
  signal m_axi00_awready     : std_logic_vector( 6 downto 0 );
  signal m_axi00_wdata       : std_logic_vector( 223 downto 0 );
  signal m_axi00_wstrb       : std_logic_vector( 27 downto 0 );
  signal m_axi00_wlast       : std_logic_vector( 6 downto 0 );
  signal m_axi00_wvalid      : std_logic_vector( 6 downto 0 );
  signal m_axi00_wready      : std_logic_vector( 6 downto 0 );
  signal m_axi00_bresp       : std_logic_vector( 13 downto 0 );
  signal m_axi00_bvalid      : std_logic_vector( 6 downto 0 );
  signal m_axi00_bready      : std_logic_vector( 6 downto 0 );
  signal m_axi00_araddr      : std_logic_vector( 279 downto 0 );
  signal m_axi00_arlen       : std_logic_vector( 55 downto 0 );
  signal m_axi00_arsize      : std_logic_vector( 20 downto 0 );
  signal m_axi00_arburst     : std_logic_vector( 13 downto 0 );
  signal m_axi00_arlock      : std_logic_vector( 6 downto 0 );
  signal m_axi00_arcache     : std_logic_vector( 27 downto 0 );
  signal m_axi00_arprot      : std_logic_vector( 20 downto 0 );
  signal m_axi00_arqos       : std_logic_vector( 27 downto 0 );
  signal m_axi00_aruser      : std_logic_vector( 6 downto 0 );
  signal m_axi00_arvalid     : std_logic_vector( 6 downto 0 );
  signal m_axi00_arready     : std_logic_vector( 6 downto 0 );
  signal m_axi00_rdata       : std_logic_vector( 223 downto 0 );
  signal m_axi00_rresp       : std_logic_vector( 13 downto 0 );
  signal m_axi00_rlast       : std_logic_vector( 6 downto 0 );
  signal m_axi00_rvalid      : std_logic_vector( 6 downto 0 );
  signal m_axi00_rready      : std_logic_vector( 6 downto 0 );

  signal s_axi00_awaddr      : std_logic_vector( 39 downto 0 );
  signal s_axi00_awlen       : std_logic_vector( 7 downto 0 );
  signal s_axi00_awsize      : std_logic_vector( 2 downto 0 );
  signal s_axi00_awburst     : std_logic_vector( 1 downto 0 );
  signal s_axi00_awlock      : std_logic_vector( 0 downto 0 );
  signal s_axi00_awcache     : std_logic_vector( 3 downto 0 );
  signal s_axi00_awprot      : std_logic_vector( 2 downto 0 );
  signal s_axi00_awqos       : std_logic_vector( 3 downto 0 );
  signal s_axi00_awuser      : std_logic_vector( 0 downto 0 );
  signal s_axi00_awvalid     : std_logic_vector( 0 downto 0 );
  signal s_axi00_awready     : std_logic_vector( 0 downto 0 );
  signal s_axi00_wdata       : std_logic_vector( 31 downto 0 );
  signal s_axi00_wstrb       : std_logic_vector( 3 downto 0 );
  signal s_axi00_wlast       : std_logic_vector( 0 downto 0 );
  signal s_axi00_wvalid      : std_logic_vector( 0 downto 0 );
  signal s_axi00_wready      : std_logic_vector( 0 downto 0 );
  signal s_axi00_bresp       : std_logic_vector( 1 downto 0 );
  signal s_axi00_bvalid      : std_logic_vector( 0 downto 0 );
  signal s_axi00_bready      : std_logic_vector( 0 downto 0 );
  signal s_axi00_araddr      : std_logic_vector( 39 downto 0 );
  signal s_axi00_arlen       : std_logic_vector( 7 downto 0 );
  signal s_axi00_arsize      : std_logic_vector( 2 downto 0 );
  signal s_axi00_arburst     : std_logic_vector( 1 downto 0 );
  signal s_axi00_arlock      : std_logic_vector( 0 downto 0 );
  signal s_axi00_arcache     : std_logic_vector( 3 downto 0 );
  signal s_axi00_arprot      : std_logic_vector( 2 downto 0 );
  signal s_axi00_arqos       : std_logic_vector( 3 downto 0 );
  signal s_axi00_aruser      : std_logic_vector( 0 downto 0 );
  signal s_axi00_arvalid     : std_logic_vector( 0 downto 0 );
  signal s_axi00_arready     : std_logic_vector( 0 downto 0 );
  signal s_axi00_rdata       : std_logic_vector( 31 downto 0 );
  signal s_axi00_rresp       : std_logic_vector( 1 downto 0 );
  signal s_axi00_rlast       : std_logic_vector( 0 downto 0 );
  signal s_axi00_rvalid      : std_logic_vector( 0 downto 0 );
  signal s_axi00_rready      : std_logic_vector( 0 downto 0 );

begin
  Xbar_i : component AxiXBar
    port map (
      aclk                                    => axi_aclk,
      aresetn                                 => axi_aresetn,
      s_axi_awaddr                            => s_axi00_awaddr,
      s_axi_awlen                             => s_axi00_awlen,
      s_axi_awsize                            => s_axi00_awsize,
      s_axi_awburst                           => s_axi00_awburst,
      s_axi_awlock                            => s_axi00_awlock,
      s_axi_awcache                           => s_axi00_awcache,
      s_axi_awprot                            => s_axi00_awprot,
      s_axi_awqos                             => s_axi00_awqos,
      s_axi_awuser                            => s_axi00_awuser,
      s_axi_awvalid                           => s_axi00_awvalid,
      s_axi_awready                           => s_axi00_awready,
      s_axi_wdata                             => s_axi00_wdata,
      s_axi_wstrb                             => s_axi00_wstrb,
      s_axi_wlast                             => s_axi00_wlast,
      s_axi_wvalid                            => s_axi00_wvalid,
      s_axi_wready                            => s_axi00_wready,
      s_axi_bresp                             => s_axi00_bresp,
      s_axi_bvalid                            => s_axi00_bvalid,
      s_axi_bready                            => s_axi00_bready,
      s_axi_araddr                            => s_axi00_araddr,
      s_axi_arlen                             => s_axi00_arlen,
      s_axi_arsize                            => s_axi00_arsize,
      s_axi_arburst                           => s_axi00_arburst,
      s_axi_arlock                            => s_axi00_arlock,
      s_axi_arcache                           => s_axi00_arcache,
      s_axi_arprot                            => s_axi00_arprot,
      s_axi_arqos                             => s_axi00_arqos,
      s_axi_aruser                            => s_axi00_aruser,
      s_axi_arvalid                           => s_axi00_arvalid,
      s_axi_arready                           => s_axi00_arready,
      s_axi_rdata                             => s_axi00_rdata,
      s_axi_rresp                             => s_axi00_rresp,
      s_axi_rlast                             => s_axi00_rlast,
      s_axi_rvalid                            => s_axi00_rvalid,
      s_axi_rready                            => s_axi00_rready,
      m_axi_awaddr                            => m_axi00_awaddr,
      m_axi_awlen                             => m_axi00_awlen,
      m_axi_awsize                            => m_axi00_awsize,
      m_axi_awburst                           => m_axi00_awburst,
      m_axi_awlock                            => m_axi00_awlock,
      m_axi_awcache                           => m_axi00_awcache,
      m_axi_awprot                            => m_axi00_awprot,
      m_axi_awqos                             => m_axi00_awqos,
      m_axi_awuser                            => m_axi00_awuser,
      m_axi_awvalid                           => m_axi00_awvalid,
      m_axi_awready                           => m_axi00_awready,
      m_axi_wdata                             => m_axi00_wdata,
      m_axi_wstrb                             => m_axi00_wstrb,
      m_axi_wlast                             => m_axi00_wlast,
      m_axi_wvalid                            => m_axi00_wvalid,
      m_axi_wready                            => m_axi00_wready,
      m_axi_bresp                             => m_axi00_bresp,
      m_axi_bvalid                            => m_axi00_bvalid,
      m_axi_bready                            => m_axi00_bready,
      m_axi_araddr                            => m_axi00_araddr,
      m_axi_arlen                             => m_axi00_arlen,
      m_axi_arsize                            => m_axi00_arsize,
      m_axi_arburst                           => m_axi00_arburst,
      m_axi_arlock                            => m_axi00_arlock,
      m_axi_arcache                           => m_axi00_arcache,
      m_axi_arprot                            => m_axi00_arprot,
      m_axi_arqos                             => m_axi00_arqos,
      m_axi_aruser                            => m_axi00_aruser,
      m_axi_arvalid                           => m_axi00_arvalid,
      m_axi_arready                           => m_axi00_arready,
      m_axi_rdata                             => m_axi00_rdata,
      m_axi_rresp                             => m_axi00_rresp,
      m_axi_rlast                             => m_axi00_rlast,
      m_axi_rvalid                            => m_axi00_rvalid,
      m_axi_rready                            => m_axi00_rready
    );

  maxi_ms(0).aw.addr(32 - 1 downto 0)     <= m_axi00_awaddr(31 downto 0);
  maxi_ms(1).aw.addr(32 - 1 downto 0)     <= m_axi00_awaddr(71 downto 40);
  maxi_ms(2).aw.addr(32 - 1 downto 0)     <= m_axi00_awaddr(111 downto 80);
  maxi_ms(3).aw.addr(32 - 1 downto 0)     <= m_axi00_awaddr(151 downto 120);
  maxi_ms(4).aw.addr(32 - 1 downto 0)     <= m_axi00_awaddr(191 downto 160);
  maxi_ms(5).aw.addr(32 - 1 downto 0)     <= m_axi00_awaddr(231 downto 200);
  maxi_ms(6).aw.addr(32 - 1 downto 0)     <= m_axi00_awaddr(271 downto 240);
  maxi_ms(0).aw.len                       <= m_axi00_awlen(7 downto 0);
  maxi_ms(1).aw.len                       <= m_axi00_awlen(15 downto 8);
  maxi_ms(2).aw.len                       <= m_axi00_awlen(23 downto 16);
  maxi_ms(3).aw.len                       <= m_axi00_awlen(31 downto 24);
  maxi_ms(4).aw.len                       <= m_axi00_awlen(39 downto 32);
  maxi_ms(5).aw.len                       <= m_axi00_awlen(47 downto 40);
  maxi_ms(6).aw.len                       <= m_axi00_awlen(55 downto 48);
  maxi_ms(0).aw.size                      <= m_axi00_awsize(2 downto 0);
  maxi_ms(1).aw.size                      <= m_axi00_awsize(5 downto 3);
  maxi_ms(2).aw.size                      <= m_axi00_awsize(8 downto 6);
  maxi_ms(3).aw.size                      <= m_axi00_awsize(11 downto 9);
  maxi_ms(4).aw.size                      <= m_axi00_awsize(14 downto 12);
  maxi_ms(5).aw.size                      <= m_axi00_awsize(17 downto 15);
  maxi_ms(6).aw.size                      <= m_axi00_awsize(20 downto 18);
  maxi_ms(0).aw.burst                     <= m_axi00_awburst(1 downto 0);
  maxi_ms(1).aw.burst                     <= m_axi00_awburst(3 downto 2);
  maxi_ms(2).aw.burst                     <= m_axi00_awburst(5 downto 4);
  maxi_ms(3).aw.burst                     <= m_axi00_awburst(7 downto 6);
  maxi_ms(4).aw.burst                     <= m_axi00_awburst(9 downto 8);
  maxi_ms(5).aw.burst                     <= m_axi00_awburst(11 downto 10);
  maxi_ms(6).aw.burst                     <= m_axi00_awburst(13 downto 12);
  maxi_ms(0).aw.lock                      <= m_axi00_awlock(0);
  maxi_ms(1).aw.lock                      <= m_axi00_awlock(1);
  maxi_ms(2).aw.lock                      <= m_axi00_awlock(2);
  maxi_ms(3).aw.lock                      <= m_axi00_awlock(3);
  maxi_ms(4).aw.lock                      <= m_axi00_awlock(4);
  maxi_ms(5).aw.lock                      <= m_axi00_awlock(5);
  maxi_ms(6).aw.lock                      <= m_axi00_awlock(6);
  maxi_ms(0).aw.cache                     <= m_axi00_awcache(3 downto 0);
  maxi_ms(1).aw.cache                     <= m_axi00_awcache(7 downto 4);
  maxi_ms(2).aw.cache                     <= m_axi00_awcache(11 downto 8);
  maxi_ms(3).aw.cache                     <= m_axi00_awcache(15 downto 12);
  maxi_ms(4).aw.cache                     <= m_axi00_awcache(19 downto 16);
  maxi_ms(5).aw.cache                     <= m_axi00_awcache(23 downto 20);
  maxi_ms(6).aw.cache                     <= m_axi00_awcache(27 downto 24);
  maxi_ms(0).aw.prot                      <= m_axi00_awprot(2 downto 0);
  maxi_ms(1).aw.prot                      <= m_axi00_awprot(5 downto 3);
  maxi_ms(2).aw.prot                      <= m_axi00_awprot(8 downto 6);
  maxi_ms(3).aw.prot                      <= m_axi00_awprot(11 downto 9);
  maxi_ms(4).aw.prot                      <= m_axi00_awprot(14 downto 12);
  maxi_ms(5).aw.prot                      <= m_axi00_awprot(17 downto 15);
  maxi_ms(6).aw.prot                      <= m_axi00_awprot(20 downto 18);
  maxi_ms(0).aw.qos                       <= m_axi00_awqos(3 downto 0);
  maxi_ms(1).aw.qos                       <= m_axi00_awqos(7 downto 4);
  maxi_ms(2).aw.qos                       <= m_axi00_awqos(11 downto 8);
  maxi_ms(3).aw.qos                       <= m_axi00_awqos(15 downto 12);
  maxi_ms(4).aw.qos                       <= m_axi00_awqos(19 downto 16);
  maxi_ms(5).aw.qos                       <= m_axi00_awqos(23 downto 20);
  maxi_ms(6).aw.qos                       <= m_axi00_awqos(27 downto 24);
  maxi_ms(0).aw.user                      <= m_axi00_awuser(0 downto 0);
  maxi_ms(1).aw.user                      <= m_axi00_awuser(1 downto 1);
  maxi_ms(2).aw.user                      <= m_axi00_awuser(2 downto 2);
  maxi_ms(3).aw.user                      <= m_axi00_awuser(3 downto 3);
  maxi_ms(4).aw.user                      <= m_axi00_awuser(4 downto 4);
  maxi_ms(5).aw.user                      <= m_axi00_awuser(5 downto 5);
  maxi_ms(6).aw.user                      <= m_axi00_awuser(6 downto 6);
  maxi_ms(0).aw.valid                     <= m_axi00_awvalid(0);
  maxi_ms(1).aw.valid                     <= m_axi00_awvalid(1);
  maxi_ms(2).aw.valid                     <= m_axi00_awvalid(2);
  maxi_ms(3).aw.valid                     <= m_axi00_awvalid(3);
  maxi_ms(4).aw.valid                     <= m_axi00_awvalid(4);
  maxi_ms(5).aw.valid                     <= m_axi00_awvalid(5);
  maxi_ms(6).aw.valid                     <= m_axi00_awvalid(6);
  m_axi00_awready(0)                      <= maxi_sm(0).aw.ready;
  m_axi00_awready(1)                      <= maxi_sm(1).aw.ready;
  m_axi00_awready(2)                      <= maxi_sm(2).aw.ready;
  m_axi00_awready(3)                      <= maxi_sm(3).aw.ready;
  m_axi00_awready(4)                      <= maxi_sm(4).aw.ready;
  m_axi00_awready(5)                      <= maxi_sm(5).aw.ready;
  m_axi00_awready(6)                      <= maxi_sm(6).aw.ready;
  maxi_ms(0).dw.data                      <= m_axi00_wdata(31 downto 0);
  maxi_ms(1).dw.data                      <= m_axi00_wdata(63 downto 32);
  maxi_ms(2).dw.data                      <= m_axi00_wdata(95 downto 64);
  maxi_ms(3).dw.data                      <= m_axi00_wdata(127 downto 96);
  maxi_ms(4).dw.data                      <= m_axi00_wdata(159 downto 128);
  maxi_ms(5).dw.data                      <= m_axi00_wdata(191 downto 160);
  maxi_ms(6).dw.data                      <= m_axi00_wdata(223 downto 192);
  maxi_ms(0).dw.strb                      <= m_axi00_wstrb(3 downto 0);
  maxi_ms(1).dw.strb                      <= m_axi00_wstrb(7 downto 4);
  maxi_ms(2).dw.strb                      <= m_axi00_wstrb(11 downto 8);
  maxi_ms(3).dw.strb                      <= m_axi00_wstrb(15 downto 12);
  maxi_ms(4).dw.strb                      <= m_axi00_wstrb(19 downto 16);
  maxi_ms(5).dw.strb                      <= m_axi00_wstrb(23 downto 20);
  maxi_ms(6).dw.strb                      <= m_axi00_wstrb(27 downto 24);
  maxi_ms(0).dw.last                      <= m_axi00_wlast(0);
  maxi_ms(1).dw.last                      <= m_axi00_wlast(1);
  maxi_ms(2).dw.last                      <= m_axi00_wlast(2);
  maxi_ms(3).dw.last                      <= m_axi00_wlast(3);
  maxi_ms(4).dw.last                      <= m_axi00_wlast(4);
  maxi_ms(5).dw.last                      <= m_axi00_wlast(5);
  maxi_ms(6).dw.last                      <= m_axi00_wlast(6);
  maxi_ms(0).dw.valid                     <= m_axi00_wvalid(0);
  maxi_ms(1).dw.valid                     <= m_axi00_wvalid(1);
  maxi_ms(2).dw.valid                     <= m_axi00_wvalid(2);
  maxi_ms(3).dw.valid                     <= m_axi00_wvalid(3);
  maxi_ms(4).dw.valid                     <= m_axi00_wvalid(4);
  maxi_ms(5).dw.valid                     <= m_axi00_wvalid(5);
  maxi_ms(6).dw.valid                     <= m_axi00_wvalid(6);
  m_axi00_wready(0)                       <= maxi_sm(0).dw.ready;
  m_axi00_wready(1)                       <= maxi_sm(1).dw.ready;
  m_axi00_wready(2)                       <= maxi_sm(2).dw.ready;
  m_axi00_wready(3)                       <= maxi_sm(3).dw.ready;
  m_axi00_wready(4)                       <= maxi_sm(4).dw.ready;
  m_axi00_wready(5)                       <= maxi_sm(5).dw.ready;
  m_axi00_wready(6)                       <= maxi_sm(6).dw.ready;
  m_axi00_bresp(1 downto 0)               <= maxi_sm(0).b.resp;
  m_axi00_bresp(3 downto 2)               <= maxi_sm(1).b.resp;
  m_axi00_bresp(5 downto 4)               <= maxi_sm(2).b.resp;
  m_axi00_bresp(7 downto 6)               <= maxi_sm(3).b.resp;
  m_axi00_bresp(9 downto 8)               <= maxi_sm(4).b.resp;
  m_axi00_bresp(11 downto 10)             <= maxi_sm(5).b.resp;
  m_axi00_bresp(13 downto 12)             <= maxi_sm(6).b.resp;
  m_axi00_bvalid(0)                       <= maxi_sm(0).b.valid;
  m_axi00_bvalid(1)                       <= maxi_sm(1).b.valid;
  m_axi00_bvalid(2)                       <= maxi_sm(2).b.valid;
  m_axi00_bvalid(3)                       <= maxi_sm(3).b.valid;
  m_axi00_bvalid(4)                       <= maxi_sm(4).b.valid;
  m_axi00_bvalid(5)                       <= maxi_sm(5).b.valid;
  m_axi00_bvalid(6)                       <= maxi_sm(6).b.valid;
  maxi_ms(0).b.ready                      <= m_axi00_bready(0);
  maxi_ms(1).b.ready                      <= m_axi00_bready(1);
  maxi_ms(2).b.ready                      <= m_axi00_bready(2);
  maxi_ms(3).b.ready                      <= m_axi00_bready(3);
  maxi_ms(4).b.ready                      <= m_axi00_bready(4);
  maxi_ms(5).b.ready                      <= m_axi00_bready(5);
  maxi_ms(6).b.ready                      <= m_axi00_bready(6);
  maxi_ms(0).ar.addr(32 - 1 downto 0)     <= m_axi00_araddr(31 downto 0);
  maxi_ms(1).ar.addr(32 - 1 downto 0)     <= m_axi00_araddr(71 downto 40);
  maxi_ms(2).ar.addr(32 - 1 downto 0)     <= m_axi00_araddr(111 downto 80);
  maxi_ms(3).ar.addr(32 - 1 downto 0)     <= m_axi00_araddr(151 downto 120);
  maxi_ms(4).ar.addr(32 - 1 downto 0)     <= m_axi00_araddr(191 downto 160);
  maxi_ms(5).ar.addr(32 - 1 downto 0)     <= m_axi00_araddr(231 downto 200);
  maxi_ms(6).ar.addr(32 - 1 downto 0)     <= m_axi00_araddr(271 downto 240);
  maxi_ms(0).ar.len                       <= m_axi00_arlen(7 downto 0);
  maxi_ms(1).ar.len                       <= m_axi00_arlen(15 downto 8);
  maxi_ms(2).ar.len                       <= m_axi00_arlen(23 downto 16);
  maxi_ms(3).ar.len                       <= m_axi00_arlen(31 downto 24);
  maxi_ms(4).ar.len                       <= m_axi00_arlen(39 downto 32);
  maxi_ms(5).ar.len                       <= m_axi00_arlen(47 downto 40);
  maxi_ms(6).ar.len                       <= m_axi00_arlen(55 downto 48);
  maxi_ms(0).ar.size                      <= m_axi00_arsize(2 downto 0);
  maxi_ms(1).ar.size                      <= m_axi00_arsize(5 downto 3);
  maxi_ms(2).ar.size                      <= m_axi00_arsize(8 downto 6);
  maxi_ms(3).ar.size                      <= m_axi00_arsize(11 downto 9);
  maxi_ms(4).ar.size                      <= m_axi00_arsize(14 downto 12);
  maxi_ms(5).ar.size                      <= m_axi00_arsize(17 downto 15);
  maxi_ms(6).ar.size                      <= m_axi00_arsize(20 downto 18);
  maxi_ms(0).ar.burst                     <= m_axi00_arburst(1 downto 0);
  maxi_ms(1).ar.burst                     <= m_axi00_arburst(3 downto 2);
  maxi_ms(2).ar.burst                     <= m_axi00_arburst(5 downto 4);
  maxi_ms(3).ar.burst                     <= m_axi00_arburst(7 downto 6);
  maxi_ms(4).ar.burst                     <= m_axi00_arburst(9 downto 8);
  maxi_ms(5).ar.burst                     <= m_axi00_arburst(11 downto 10);
  maxi_ms(6).ar.burst                     <= m_axi00_arburst(13 downto 12);
  maxi_ms(0).ar.lock                      <= m_axi00_arlock(0);
  maxi_ms(1).ar.lock                      <= m_axi00_arlock(1);
  maxi_ms(2).ar.lock                      <= m_axi00_arlock(2);
  maxi_ms(3).ar.lock                      <= m_axi00_arlock(3);
  maxi_ms(4).ar.lock                      <= m_axi00_arlock(4);
  maxi_ms(5).ar.lock                      <= m_axi00_arlock(5);
  maxi_ms(6).ar.lock                      <= m_axi00_arlock(6);
  maxi_ms(0).ar.cache                     <= m_axi00_arcache(3 downto 0);
  maxi_ms(1).ar.cache                     <= m_axi00_arcache(7 downto 4);
  maxi_ms(2).ar.cache                     <= m_axi00_arcache(11 downto 8);
  maxi_ms(3).ar.cache                     <= m_axi00_arcache(15 downto 12);
  maxi_ms(4).ar.cache                     <= m_axi00_arcache(19 downto 16);
  maxi_ms(5).ar.cache                     <= m_axi00_arcache(23 downto 20);
  maxi_ms(6).ar.cache                     <= m_axi00_arcache(27 downto 24);
  maxi_ms(0).ar.prot                      <= m_axi00_arprot(2 downto 0);
  maxi_ms(1).ar.prot                      <= m_axi00_arprot(5 downto 3);
  maxi_ms(2).ar.prot                      <= m_axi00_arprot(8 downto 6);
  maxi_ms(3).ar.prot                      <= m_axi00_arprot(11 downto 9);
  maxi_ms(4).ar.prot                      <= m_axi00_arprot(14 downto 12);
  maxi_ms(5).ar.prot                      <= m_axi00_arprot(17 downto 15);
  maxi_ms(6).ar.prot                      <= m_axi00_arprot(20 downto 18);
  maxi_ms(0).ar.qos                       <= m_axi00_arqos(3 downto 0);
  maxi_ms(1).ar.qos                       <= m_axi00_arqos(7 downto 4);
  maxi_ms(2).ar.qos                       <= m_axi00_arqos(11 downto 8);
  maxi_ms(3).ar.qos                       <= m_axi00_arqos(15 downto 12);
  maxi_ms(4).ar.qos                       <= m_axi00_arqos(19 downto 16);
  maxi_ms(5).ar.qos                       <= m_axi00_arqos(23 downto 20);
  maxi_ms(6).ar.qos                       <= m_axi00_arqos(27 downto 24);
  maxi_ms(0).ar.user                      <= m_axi00_aruser(0 downto 0);
  maxi_ms(1).ar.user                      <= m_axi00_aruser(1 downto 1);
  maxi_ms(2).ar.user                      <= m_axi00_aruser(2 downto 2);
  maxi_ms(3).ar.user                      <= m_axi00_aruser(3 downto 3);
  maxi_ms(4).ar.user                      <= m_axi00_aruser(4 downto 4);
  maxi_ms(5).ar.user                      <= m_axi00_aruser(5 downto 5);
  maxi_ms(6).ar.user                      <= m_axi00_aruser(6 downto 6);
  maxi_ms(0).ar.valid                     <= m_axi00_arvalid(0);
  maxi_ms(1).ar.valid                     <= m_axi00_arvalid(1);
  maxi_ms(2).ar.valid                     <= m_axi00_arvalid(2);
  maxi_ms(3).ar.valid                     <= m_axi00_arvalid(3);
  maxi_ms(4).ar.valid                     <= m_axi00_arvalid(4);
  maxi_ms(5).ar.valid                     <= m_axi00_arvalid(5);
  maxi_ms(6).ar.valid                     <= m_axi00_arvalid(6);
  m_axi00_arready(0)                      <= maxi_sm(0).ar.ready;
  m_axi00_arready(1)                      <= maxi_sm(1).ar.ready;
  m_axi00_arready(2)                      <= maxi_sm(2).ar.ready;
  m_axi00_arready(3)                      <= maxi_sm(3).ar.ready;
  m_axi00_arready(4)                      <= maxi_sm(4).ar.ready;
  m_axi00_arready(5)                      <= maxi_sm(5).ar.ready;
  m_axi00_arready(6)                      <= maxi_sm(6).ar.ready;
  m_axi00_rdata(31 downto 0)              <= maxi_sm(0).dr.data;
  m_axi00_rdata(63 downto 32)             <= maxi_sm(1).dr.data;
  m_axi00_rdata(95 downto 64)             <= maxi_sm(2).dr.data;
  m_axi00_rdata(127 downto 96)            <= maxi_sm(3).dr.data;
  m_axi00_rdata(159 downto 128)           <= maxi_sm(4).dr.data;
  m_axi00_rdata(191 downto 160)           <= maxi_sm(5).dr.data;
  m_axi00_rdata(223 downto 192)           <= maxi_sm(6).dr.data;
  m_axi00_rresp(1 downto 0)               <= maxi_sm(0).dr.resp;
  m_axi00_rresp(3 downto 2)               <= maxi_sm(1).dr.resp;
  m_axi00_rresp(5 downto 4)               <= maxi_sm(2).dr.resp;
  m_axi00_rresp(7 downto 6)               <= maxi_sm(3).dr.resp;
  m_axi00_rresp(9 downto 8)               <= maxi_sm(4).dr.resp;
  m_axi00_rresp(11 downto 10)             <= maxi_sm(5).dr.resp;
  m_axi00_rresp(13 downto 12)             <= maxi_sm(6).dr.resp;
  m_axi00_rlast(0)                        <= maxi_sm(0).dr.last;
  m_axi00_rlast(1)                        <= maxi_sm(1).dr.last;
  m_axi00_rlast(2)                        <= maxi_sm(2).dr.last;
  m_axi00_rlast(3)                        <= maxi_sm(3).dr.last;
  m_axi00_rlast(4)                        <= maxi_sm(4).dr.last;
  m_axi00_rlast(5)                        <= maxi_sm(5).dr.last;
  m_axi00_rlast(6)                        <= maxi_sm(6).dr.last;
  m_axi00_rvalid(0)                       <= maxi_sm(0).dr.valid;
  m_axi00_rvalid(1)                       <= maxi_sm(1).dr.valid;
  m_axi00_rvalid(2)                       <= maxi_sm(2).dr.valid;
  m_axi00_rvalid(3)                       <= maxi_sm(3).dr.valid;
  m_axi00_rvalid(4)                       <= maxi_sm(4).dr.valid;
  m_axi00_rvalid(5)                       <= maxi_sm(5).dr.valid;
  m_axi00_rvalid(6)                       <= maxi_sm(6).dr.valid;
  maxi_ms(0).dr.ready                     <= m_axi00_rready(0);
  maxi_ms(1).dr.ready                     <= m_axi00_rready(1);
  maxi_ms(2).dr.ready                     <= m_axi00_rready(2);
  maxi_ms(3).dr.ready                     <= m_axi00_rready(3);
  maxi_ms(4).dr.ready                     <= m_axi00_rready(4);
  maxi_ms(5).dr.ready                     <= m_axi00_rready(5);
  maxi_ms(6).dr.ready                     <= m_axi00_rready(6);

  s_axi00_awaddr(31 downto 0)             <= saxi_ms.aw.addr(32 - 1 downto 0);
  s_axi00_awlen(7 downto 0)               <= saxi_ms.aw.len;
  s_axi00_awsize(2 downto 0)              <= saxi_ms.aw.size;
  s_axi00_awburst(1 downto 0)             <= saxi_ms.aw.burst;
  s_axi00_awlock(0)                       <= saxi_ms.aw.lock;
  s_axi00_awcache(3 downto 0)             <= saxi_ms.aw.cache;
  s_axi00_awprot(2 downto 0)              <= saxi_ms.aw.prot;
  s_axi00_awqos(3 downto 0)               <= saxi_ms.aw.qos;
  s_axi00_awuser(0 downto 0)              <= saxi_ms.aw.user;
  s_axi00_awvalid(0)                      <= saxi_ms.aw.valid;
  saxi_sm.aw.ready                        <= s_axi00_awready(0);
  s_axi00_wdata(31 downto 0)              <= saxi_ms.dw.data;
  s_axi00_wstrb(3 downto 0)               <= saxi_ms.dw.strb;
  s_axi00_wlast(0)                        <= saxi_ms.dw.last;
  s_axi00_wvalid(0)                       <= saxi_ms.dw.valid;
  saxi_sm.dw.ready                        <= s_axi00_wready(0);
  saxi_sm.b.resp                          <= s_axi00_bresp(1 downto 0);
  saxi_sm.b.valid                         <= s_axi00_bvalid(0);
  s_axi00_bready(0)                       <= saxi_ms.b.ready;
  s_axi00_araddr(31 downto 0)             <= saxi_ms.ar.addr(32 - 1 downto 0);
  s_axi00_arlen(7 downto 0)               <= saxi_ms.ar.len;
  s_axi00_arsize(2 downto 0)              <= saxi_ms.ar.size;
  s_axi00_arburst(1 downto 0)             <= saxi_ms.ar.burst;
  s_axi00_arlock(0)                       <= saxi_ms.ar.lock;
  s_axi00_arcache(3 downto 0)             <= saxi_ms.ar.cache;
  s_axi00_arprot(2 downto 0)              <= saxi_ms.ar.prot;
  s_axi00_arqos(3 downto 0)               <= saxi_ms.ar.qos;
  s_axi00_aruser(0 downto 0)              <= saxi_ms.ar.user;
  s_axi00_arvalid(0)                      <= saxi_ms.ar.valid;
  saxi_sm.ar.ready                        <= s_axi00_arready(0);
  saxi_sm.dr.data                         <= s_axi00_rdata(31 downto 0);
  saxi_sm.dr.resp                         <= s_axi00_rresp(1 downto 0);
  saxi_sm.dr.last                         <= s_axi00_rlast(0);
  saxi_sm.dr.valid                        <= s_axi00_rvalid(0);
  s_axi00_rready(0)                       <= saxi_ms.dr.ready;
  s_axi00_araddr(39 downto 32)            <= saxi_araddr_hi(39 downto 32);
  s_axi00_awaddr(39 downto 32)            <= saxi_awaddr_hi(39 downto 32);
end architecture rtl;
