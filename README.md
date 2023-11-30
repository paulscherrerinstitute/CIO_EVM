# CIO_EVM - Project for Instantiating the MRF EVM on CPSI CIO

     Till Straumann <till.straumann@psi.ch>, 2023.

This project provides a reproducible platform where the EVM is
instantiated. The main goal is to enable an efficient git-based
workflow for collaboration between PSI and MRF.

It is paramount that all design sources can be maintained in git
and versions may be identified unambiguously and re-built etc.

## Version Control with git

### Avoid block-designs and `.xci` files

While block designs and IP instantiations as `xci` files can - in principle -
be maintained in git there are unfortunately serious drawbacks:

 - minimal changes to IP parameters or a block design may introduce
   many differences to the files kept in VCS which makes it hard to
   identify what exactly has changed between versions.
 - sometimes it is unclear which files need to be put in VCS
 - porting to a new vivado release requires (non-backwards compatible)
   changes which makes it very cumbersome to maintain, e.g., a block-design
   for multiple vivado versions.
 - `xci` files are not easily portable, e.g., across different device
   flavors. Sometimes IP must be re-configured from scratch when changing
   devices which is time-consuming and error prone.
 - ...

Thus, while using the vivado's GUI workflow gives quick results it unfortunately
introduces long-term maintainability, collaboration (how do you merge changes
to a block design?) and other problems.

For these reasons, we tried to avoid block designs where possible and instead
use a TCL-based instantiation method for generating IP.

#### Maintaining IP Instantiations in git

Instead of keeping the instantiated IP's `xci` file under version control
(this has multiple problems as mentioned before) we use TCL scripts to
instantiate and configure IP cores.

An IP core may be added to the project using the GUI first. After configuring
the IP you go to Vivado's TCL console and see the commands that vivado used
"under the hood". Often, only few parameters are changed and appear in the TCL.

Modifying parameters is also easy:

  1. open the IP core in the vivado GUI
  2. make changes (in the GUI)
  3. after clicking OK you see the `CONFIG.xxx` parameters that have
     changed.
  4. merge the changed parameters into the TCL script associated with
     the IP.
  5. commit the TCL script to git

Changes in these TCL scripts are much easier to track than in `xci` files
and significantly reduce problems when switching vivado versions or devices.

## Structure of the Project

The code making up the project is kept in git and consists of the following
directories and files:

  - `hdl/` contains vhdl sources of the top-level entity and convenience wrappers
     for IP cores and other modules. These wrappers aggregate the many AXI signals
     into convenient records which keeps the interconnections tidy. The record
     types are defined in the `psi_common_axi_pkg` package.
  - `tcl/` contains TCL scripts
    - for instantiating various IP
    - adding source and constraint files to the project (`sources.tcl`)
    - adding the MRF EVM sources to the project (all references to MRF-provided
      code and constraints are listed in `sources_mrf_evm_dc.tcl`
    - `generateProject.tcl` creates the actual project and executes all the other
      TCL scripts to populate it.
  - `xdc/` contains constraints
  - `modules/` contains git submodules of various components; most notably, the
    MRF code is present here.
  - `py/` contain python helper scripts that can be used to generate VHDL code
    (AXI port declarations and mappings). Expert use only.

### EVM Notes

Some files of the EVM module are unused

 - `CPSI_CIO_top.vhd` is unused; the top-level entity is now part of this project
   (under `hdl/`).
 - `fifo80x2048.xci` is unused.
   The FIFO IP is generated from TCL (`tcl/sources_mrf_evm_dc.tcl`).
 - `ila_0.xci` is unused. The ILA IP is generated from TCL (`tcl/sources_mrf_evm_dc.tcl`).
 - cpsi_cio.xdc is unused. We provide our own constraints where clocks
   are defined.

Note also that `mrf-evm-dc` uses its own git submodules - albeit not for the CPSI_CIO
variant. These submodules are not part of this project and are unused but be aware that
`git submodule` operations with the `--recursive` flag may fail.

## Generating the Project

After cloning the git repository and initializing/populating the git submodules
the project can be generated from TCL. I like to do that from a `vivado` working-
directory:

  1. `mkdir vivado; cd vivado`
  2. start vivado in GUI mode
  3. in the TCL console enter `source ../tcl/generateProject.tcl`
  4. wait for the GUI to update
  5. proceed to synthesis/implementation etc.
  
## Modifications

Modifications of the project in the GUI must be properly propagated to the TCL scripts.
Observe the TCL console when changing anything in the GUI: this helps identifying
settings that have changed.

  1. Changes to project parameters (device, synthesis or implementation strategies or other
     settings) are merged into `generateProject.tcl`.
  2. Modifying IP settings are merged into the IP-generating TCL script(s). A special
     case is the AXI Crossbar which can be created from the expert python script along
     with the wrapper HDL.
  3. Changes to the set of source files or constraints are propagated into the `sources.tcl`
     (CIO environment; top-level etc.) or `sources_mrf_evm_dc.tcl` (EVM-proper) scripts.

## Differences to VME-EVM300 and Limitations

The CIO port of the EVM offers some enhancements to the VME
implementation but also has limitations.

### External Reference Clock

The MGT reference clock of the VME-EVM is programmed by HDL
in the FPGA and can be manipulated by accessing the `FracDiv`
register in VME-space.

On the CIO board access to the Si5395 reference clock(s) via the PL is
not implemented; instead, the clocks must be programmed from the
PS via i2c.

A (software) driver for these clocks with C++, python and EPICS-iocsh
bindings is
[available.](https://github.com/paulscherrerinstitute/Si53xxDrv.git)

Note that while writing the `FracDiv` register does not affect the clocks
it also has the effect of resetting (some of) the MGTs which may be necessary
depending on the change of clock rate etc. Thus, we recomment writing a
dummy value to this register after manipulating the Si5395 clocks.

More details about the clocking scheme are available in
[this dedicated document.](doc/Clocking Notes.odp)

### EVR-100 Compatibility Mode

While the basic event protocol has not changed much since the EVR-100
series the addition of the data buffer has introduced a non-backwards
compatible modification which confuses EVR-100 series devices.

In order to support these legacy devices a new feature has been added
to the CIO port which enables the user to disable/mask the data buffer
on the fanout ports. Set bit-0 in the FCT control-register 2 (at offset `0x28`
in the FCT register space) to disable the data buffer transmission.
Note that this bit affects *all* fanout ports. Note also that the EVR-100
series support only an event clock rate of 50MHz; therefore it is likely
that a fanout EVM supporting EVR-100 devices must operate in *decimating*
mode (RFSEL = 7 in the EVG ClockControl register).

### Event Clock Decimation Mode

The EVM supports decimating the event clock rate on the fanout ports (all
fanout ports use the same decimation rate). This mode is marked as
`recovered clock/2 decimate mode` [DC-manual pp. 42](http://www.mrf.fi/fw/DCManual-191127.pdf).

However, the CIO EVM with its external Si5395 clocks does not limit the decimation
rate to 1/2; in fact, arbitrary rates are supported. However, the Si5395 devices
must be properly configured and RFSEL switched to decimate mode.

### Phase Monitoring on TTL Inputs not Supported

MRF's port to the CIO/ultrascale+ platform has dropped support for this
feature mentioned in [section 2.13](http://www.mrf.fi/fw/DCManual-191127.pdf).

### Additional Fanout Ports

The VME EVM has 8 fanout ports. The CIO variant increases this number to 15
with 7 ports routed to the backplane. The number of status bits in the FCT status
register has been increased accordingly. Note, however, that it was not possible
to widen the number of control bits for clearing the violation flags
in the same straightforward way because this would have collided with
the "clear upviolation" bit which we did not want to relocate for sake
of remaining compatible with the VME register layout. Instead, the new
"clear upviolation" bits have been moved to occupy do a disjunct bit-field
in the same register. Consult the VHDL for details.

### Clear Upviolation

The "clear upviolation" flag for the embedded "downstream" EVR (this is the EVR
facing upstream receiving data from the master) is located in the FCT control
register (for unknown legacy reasons; this also applies to the VME-EVM).
Confusingly, the "clear violation" bit in the actual "downstream" embedded EVR
register space is unused.

In order to make the embedded EVR fully compatible with existing software drivers the "clear violation" bit in the EVR-registers was made to act the same
way (and in addition to) the "clear upviolation" bit from the FCT-control register. This means that this particular violation may be cleared in two different
ways: either VME-EVM compatible (from FCT-control) or EVR compatible (from EVR
registers). Note that the EVR-compatible feature is *not* present in the
VME-EVM.

### Other Missing Features

Some features documented for the DC-EVR are not implemented in the
embedded version used by CIO_EVM. This includes e.g., the DC-related
registers (measured value, target etc.; these are part of the EVG
registers but for sake of consistency it would be nice if they also
would be at least readable from the EVR register space in the standard
places).

### Backplane Distribution

Unfortunately it is currently not possible to *receive* the event stream
from the backplane fabric and thus cascading multiple fanout EVMs without
resorting to external fiber connections.

The MGT receiving the master stream is currently hardcoded and cannot
be multiplexed in firmware. There is a hard multiplexer on the board which
can route this MGT either to the front SFP or the backplane but in the latter
configuration the backplane fabric would connect it to the system-controller
slot which cannot be populated with a CIO-EVM.

In order to receive the incoming stream from the backplane some sort of
multiplexing must be implemented in firmware. Either via generics (building
a special bitstream for this case) or logic.

## Known Problems

### ILA Note

I have experienced Vivado complaining ILAs having no clock despite
the (event) clock running. It seems the ILAs can get into this state
when the event clock is stopped but later resumed. This can happen
if the event clock source is switched (e.g., from 'fractional synthesizer'
to 'Rx Recovered Clock').

I successfully used ILAs when being careful that I never connect
Vivado until the target clock setup is stable:

  1. reconfigure FPGA (e.g., with hardware manager)
  2. disconnect hw manager completely (disconnect 'server')
  3. bring up EVM software and program event clock frequency
     and -source.
  4. make sure clocking is stable.
  5. start Vivado hw manager and connect to target
  6. ILAs should be working now.

Note that once Vivado complained about stopped ILAs I could only
get away from this state by reconfiguring the fabric.

### Builtin FIFO Needs Stable Clock

I have experienced problems with the event fifo of the embedded
('downstream') EVR where no events would be seen despite 'real'
EVRs downstream of the CPSI fanout would receive them.

I tracked this down to the event fifo (in opb_evr_l.vhd). The fifo
is being written but does not store any data. When I connected
the 'reset busy' lines to an ILA I could see that these were
permanently asserted (even a reset would not help). The only
way to get it working was re-configuring the FPGA.

I found some remark (PG-057, Fifo-Generator 13.2, pp. 127) where
it says exactly that:

      IMPORTANT: The clock(s) must be available when the reset
      is applied. If for any reason, the clock(s) is/are lost at
      the time of reset, you must apply the reset again when the
      clock(s) is/are available. Violating this requirement may
      cause an unexpected behavior. Sometimes, the busy signals
      may be stuck and might need reconfiguration of FPGA.

It is therefore important to initialize the Si5395 clocks
prior to loading the bitstream (an initial reset is probably
attempted and then leads to the problematic scenario).

Note that when trying to debug this with the ILAs in combination
with a stopped event clock it may be necessary to manually
connect the Vivado debug hub to the Axi clock as by default
Vivado may pick the event clock...
