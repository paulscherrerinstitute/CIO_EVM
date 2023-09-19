library ieee;
use     ieee.std_logic_1164.all;

use     work.psi_common_axi_pkg.all;

entity Axi4ClkConverterWrapper is
  port (
    s_axi_aclk        : in  std_logic;
    s_axi_aresetn     : in  std_logic;
    s_axi_ms          : in  rec_axi_ms;
    s_axi_sm          : out rec_axi_sm;

    m_axi_aclk        : in  std_logic;
    m_axi_aresetn     : in  std_logic;
    m_axi_ms          : out rec_axi_ms;
    m_axi_sm          : in  rec_axi_sm
  );
end entity Axi4ClkConverterWrapper;

architecture rtl of Axi4ClkConverterWrapper is

  component axi_clock_converter_0 is
    port (
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC;
      s_axi_awid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_awvalid : IN STD_LOGIC;
      s_axi_awready : OUT STD_LOGIC;
      s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_wlast : IN STD_LOGIC;
      s_axi_wvalid : IN STD_LOGIC;
      s_axi_wready : OUT STD_LOGIC;
      s_axi_bid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_bvalid : OUT STD_LOGIC;
      s_axi_bready : IN STD_LOGIC;
      s_axi_arid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_arvalid : IN STD_LOGIC;
      s_axi_arready : OUT STD_LOGIC;
      s_axi_rid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_rlast : OUT STD_LOGIC;
      s_axi_rvalid : OUT STD_LOGIC;
      s_axi_rready : IN STD_LOGIC;
      m_axi_aclk : IN STD_LOGIC;
      m_axi_aresetn : IN STD_LOGIC;
      m_axi_awid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_awlock : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_awregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_awvalid : OUT STD_LOGIC;
      m_axi_awready : IN STD_LOGIC;
      m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_wlast : OUT STD_LOGIC;
      m_axi_wvalid : OUT STD_LOGIC;
      m_axi_wready : IN STD_LOGIC;
      m_axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_bvalid : IN STD_LOGIC;
      m_axi_bready : OUT STD_LOGIC;
      m_axi_arid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_arlock : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_arregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_arvalid : OUT STD_LOGIC;
      m_axi_arready : IN STD_LOGIC;
      m_axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_rlast : IN STD_LOGIC;
      m_axi_rvalid : IN STD_LOGIC;
      m_axi_rready : OUT STD_LOGIC 
    );
  end component axi_clock_converter_0;

begin

  i_cvt : component axi_clock_converter_0
    port map (
      s_axi_aclk                  => s_axi_aclk,
      s_axi_aresetn               => s_axi_aresetn,
      s_axi_awaddr                => s_axi_ms.aw.addr,
      s_axi_awid                  => s_axi_ms.aw.id,
      s_axi_awlen                 => s_axi_ms.aw.len,
      s_axi_awsize                => s_axi_ms.aw.size,
      s_axi_awburst               => s_axi_ms.aw.burst,
      s_axi_awlock(0)             => s_axi_ms.aw.lock,
      s_axi_awcache               => s_axi_ms.aw.cache,
      s_axi_awprot                => s_axi_ms.aw.prot,
      s_axi_awregion              => "0000",
      s_axi_awqos                 => "0000",
      s_axi_awvalid               => s_axi_ms.aw.valid,
      s_axi_awready               => s_axi_sm.aw.ready,
      s_axi_wdata                 => s_axi_ms.dw.data,
      s_axi_wstrb                 => s_axi_ms.dw.strb,
      s_axi_wlast                 => s_axi_ms.dw.last,
      s_axi_wvalid                => s_axi_ms.dw.valid,
      s_axi_wready                => s_axi_sm.dw.ready,
      s_axi_bid                   => s_axi_sm.b.id,
      s_axi_bresp                 => s_axi_sm.b.resp,
      s_axi_bvalid                => s_axi_sm.b.valid,
      s_axi_bready                => s_axi_ms.b.ready,
      s_axi_araddr                => s_axi_ms.ar.addr,
      s_axi_arid                  => s_axi_ms.ar.id,
      s_axi_arlen                 => s_axi_ms.ar.len,
      s_axi_arsize                => s_axi_ms.ar.size,
      s_axi_arburst               => s_axi_ms.ar.burst,
      s_axi_arlock(0)             => s_axi_ms.ar.lock,
      s_axi_arcache               => s_axi_ms.ar.cache,
      s_axi_arprot                => s_axi_ms.ar.prot,
      s_axi_arregion              => "0000",
      s_axi_arqos                 => "0000",
      s_axi_arvalid               => s_axi_ms.ar.valid,
      s_axi_arready               => s_axi_sm.ar.ready,
      s_axi_rdata                 => s_axi_sm.dr.data,
      s_axi_rid                   => s_axi_sm.dr.id,
      s_axi_rresp                 => s_axi_sm.dr.resp,
      s_axi_rlast                 => s_axi_sm.dr.last,
      s_axi_rvalid                => s_axi_sm.dr.valid,
      s_axi_rready                => s_axi_ms.dr.ready,

      m_axi_aclk                  => m_axi_aclk,
      m_axi_aresetn               => m_axi_aresetn,
      m_axi_awaddr                => m_axi_ms.aw.addr,
      m_axi_awid                  => m_axi_ms.aw.id,
      m_axi_awlen                 => m_axi_ms.aw.len,
      m_axi_awsize                => m_axi_ms.aw.size,
      m_axi_awburst               => m_axi_ms.aw.burst,
      m_axi_awlock(0)             => m_axi_ms.aw.lock,
      m_axi_awcache               => m_axi_ms.aw.cache,
      m_axi_awprot                => m_axi_ms.aw.prot,
      m_axi_awregion              => open,
      m_axi_awqos                 => open,
      m_axi_awvalid               => m_axi_ms.aw.valid,
      m_axi_awready               => m_axi_sm.aw.ready,
      m_axi_wdata                 => m_axi_ms.dw.data,
      m_axi_wstrb                 => m_axi_ms.dw.strb,
      m_axi_wlast                 => m_axi_ms.dw.last,
      m_axi_wvalid                => m_axi_ms.dw.valid,
      m_axi_wready                => m_axi_sm.dw.ready,
      m_axi_bid                   => m_axi_sm.b.id,
      m_axi_bresp                 => m_axi_sm.b.resp,
      m_axi_bvalid                => m_axi_sm.b.valid,
      m_axi_bready                => m_axi_ms.b.ready,
      m_axi_araddr                => m_axi_ms.ar.addr,
      m_axi_arid                  => m_axi_ms.ar.id,
      m_axi_arlen                 => m_axi_ms.ar.len,
      m_axi_arsize                => m_axi_ms.ar.size,
      m_axi_arburst               => m_axi_ms.ar.burst,
      m_axi_arlock(0)             => m_axi_ms.ar.lock,
      m_axi_arcache               => m_axi_ms.ar.cache,
      m_axi_arprot                => m_axi_ms.ar.prot,
      m_axi_arregion              => open,
      m_axi_arqos                 => open,
      m_axi_arvalid               => m_axi_ms.ar.valid,
      m_axi_arready               => m_axi_sm.ar.ready,
      m_axi_rdata                 => m_axi_sm.dr.data,
      m_axi_rid                   => m_axi_sm.dr.id,
      m_axi_rresp                 => m_axi_sm.dr.resp,
      m_axi_rlast                 => m_axi_sm.dr.last,
      m_axi_rvalid                => m_axi_sm.dr.valid,
      m_axi_rready                => m_axi_ms.dr.ready
    );

end architecture rtl;
