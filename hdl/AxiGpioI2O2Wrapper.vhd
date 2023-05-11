-- Wrap Xilinx AXI GPIO IP

library ieee;
use     ieee.std_logic_1164.all;

use     work.psi_common_axi_pkg.all;

entity AxiGpioI2O2Wrapper is
  port (
    gpInp                       : in   std_logic_vector(1 downto 0);
    gp2Out                      : out  std_logic_vector(1 downto 0);

    axi_aclk                    : in   std_logic;
    axi_aresetn                 : in   std_logic;

    axi_ms                      : in   rec_axi_ms;
    axi_sm                      : out  rec_axi_sm
  );

end entity AxiGpioI2O2Wrapper;

architecture Mapping of AxiGpioI2O2Wrapper is
  constant C_S_AXI_ADDR_WIDTH : natural := 9;

  signal gpio_axi_awaddr      : std_logic_vector( 31 downto 0 );
  signal gpio_axi_awprot      : std_logic_vector( 2 downto 0 );
  signal gpio_axi_awvalid     : std_logic_vector( 0 downto 0 );
  signal gpio_axi_awready     : std_logic_vector( 0 downto 0 );
  signal gpio_axi_wdata       : std_logic_vector( 31 downto 0 );
  signal gpio_axi_wstrb       : std_logic_vector( 3 downto 0 );
  signal gpio_axi_wvalid      : std_logic_vector( 0 downto 0 );
  signal gpio_axi_wready      : std_logic_vector( 0 downto 0 );
  signal gpio_axi_bresp       : std_logic_vector( 1 downto 0 );
  signal gpio_axi_bvalid      : std_logic_vector( 0 downto 0 );
  signal gpio_axi_bready      : std_logic_vector( 0 downto 0 );
  signal gpio_axi_araddr      : std_logic_vector( 31 downto 0 );
  signal gpio_axi_arprot      : std_logic_vector( 2 downto 0 );
  signal gpio_axi_arvalid     : std_logic_vector( 0 downto 0 );
  signal gpio_axi_arready     : std_logic_vector( 0 downto 0 );
  signal gpio_axi_rdata       : std_logic_vector( 31 downto 0 );
  signal gpio_axi_rresp       : std_logic_vector( 1 downto 0 );
  signal gpio_axi_rvalid      : std_logic_vector( 0 downto 0 );
  signal gpio_axi_rready      : std_logic_vector( 0 downto 0 );

begin

  Axi4ToAxil_i  : entity work.Axi4ToAxiLite
    port map (
      s_axi_awaddr                => axi_ms.aw.addr,
      s_axi_awid                  => axi_ms.aw.id,
      s_axi_awlen                 => axi_ms.aw.len,
      s_axi_awsize                => axi_ms.aw.size,
      s_axi_awburst               => axi_ms.aw.burst,
      s_axi_awlock                => axi_ms.aw.lock,
      s_axi_awcache               => axi_ms.aw.cache,
      s_axi_awprot                => axi_ms.aw.prot,
      s_axi_awvalid               => axi_ms.aw.valid,
      s_axi_awready               => axi_sm.aw.ready,
      s_axi_wdata                 => axi_ms.dw.data,
      s_axi_wstrb                 => axi_ms.dw.strb,
      s_axi_wlast                 => axi_ms.dw.last,
      s_axi_wvalid                => axi_ms.dw.valid,
      s_axi_wready                => axi_sm.dw.ready,
      s_axi_bresp                 => axi_sm.b.resp,
      s_axi_bvalid                => axi_sm.b.valid,
      s_axi_bready                => axi_ms.b.ready,
      s_axi_araddr                => axi_ms.ar.addr,
      s_axi_arid                  => axi_ms.ar.id,
      s_axi_arlen                 => axi_ms.ar.len,
      s_axi_arsize                => axi_ms.ar.size,
      s_axi_arburst               => axi_ms.ar.burst,
      s_axi_arlock                => axi_ms.ar.lock,
      s_axi_arcache               => axi_ms.ar.cache,
      s_axi_arprot                => axi_ms.ar.prot,
      s_axi_arvalid               => axi_ms.ar.valid,
      s_axi_arready               => axi_sm.ar.ready,
      s_axi_rdata                 => axi_sm.dr.data,
      s_axi_rresp                 => axi_sm.dr.resp,
      s_axi_rlast                 => axi_sm.dr.last,
      s_axi_rvalid                => axi_sm.dr.valid,
      s_axi_rready                => axi_ms.dr.ready,

      m_axi_awaddr                => gpio_axi_awaddr,
      m_axi_awprot                => gpio_axi_awprot,
      m_axi_awvalid               => gpio_axi_awvalid,
      m_axi_awready               => gpio_axi_awready,
      m_axi_wdata                 => gpio_axi_dwdata,
      m_axi_wstrb                 => gpio_axi_dwstrb,
      m_axi_wvalid                => gpio_axi_dwvalid,
      m_axi_wready                => gpio_axi_dwready,
      m_axi_bresp                 => gpio_axi_bresp,
      m_axi_bvalid                => gpio_axi_bvalid,
      m_axi_bready                => gpio_axi_bready,
      m_axi_araddr                => gpio_axi_araddr,
      m_axi_arprot                => gpio_axi_arprot,
      m_axi_arvalid               => gpio_axi_arvalid,
      m_axi_arready               => gpio_axi_arready,
      m_axi_rdata                 => gpio_axi_drdata,
      m_axi_rresp                 => gpio_axi_drresp,
      m_axi_rvalid                => gpio_axi_drvalid,
      m_axi_rready                => gpio_axi_drready
    );

  AxiGpioI2O2_i : entity work.AxiGpioI2O2
    port map (
      gpio_io_i                   => gpInp,
      gpio2_io_o                  => gp2Out,
      s_axi_aclk                  => axi_aclk,
      s_axi_aresetn               => axi_aresetn,

      s_axi_awaddr                => gpio_axi_awaddr(C_S_AXI_ADDR_WIDTH - 1 downto 0),
      s_axi_awvalid               => gpio_axi_awvalid,
      s_axi_awready               => gpio_axi_awready,
      s_axi_wdata                 => gpio_axi_dwdata,
      s_axi_wstrb                 => gpio_axi_dwstrb,
      s_axi_wvalid                => gpio_axi_dwvalid,
      s_axi_wready                => gpio_axi_dwready,
      s_axi_bresp                 => gpio_axi_bresp,
      s_axi_bvalid                => gpio_axi_bvalid,
      s_axi_bready                => gpio_axi_bready,
      s_axi_araddr                => gpio_axi_araddr(C_S_AXI_ADDR_WIDTH - 1 downto 0),
      s_axi_arvalid               => gpio_axi_arvalid,
      s_axi_arready               => gpio_axi_arready,
      s_axi_rdata                 => gpio_axi_drdata,
      s_axi_rresp                 => gpio_axi_drresp,
      s_axi_rvalid                => gpio_axi_drvalid,
      s_axi_rready                => gpio_axi_drready
    );
end architecture Mapping;
