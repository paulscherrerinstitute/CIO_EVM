# CIO_EVM - Basic Project for Instantiating the MRF EVM on CPSI CIO

This project provides a reproducible platform where the EVM can be
instantiated. The main goal is to enable an efficient git-based
workflow for collaboration between PSI and MRF.

It is paramount that all design sources can be maintained in git
and versions may be identified unambiguously and re-built etc.

## Version Control with git

### Avoid block-designs and `.xci` files

While block designs and IP instantiations as `xci` files can - in principle -
be maintained in git there are unfortunately serious drawbacks:

 - minimal changes to IP parameters or a block design may introduce
   many differences to the files kept in VCS which makes it hard to identify what
   exactly has changed between versions.
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

For these reasons, we tried to avoid block designs where possible and we
use a TCL-based instantiation method for generating IP.

#### Maintaining IP Instantiations in git

Instead of keeping the instantiated IP's `xci` file under version control
(this as multiple problems as mentioned before) we use TCL scripts to
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
      code and generics are listed in `sources_mrf_evm_dc.tcl`
    - `generateProject.tcl` creates the actual project and executes all the other
      TCL scripts to populate it.
  - `xdc/` contains constraints
  - `modules/` contains git submodules of various components; most notably, the
    MRF code is present here.
  - `py/` contain python helper scripts that can be used to generate VHDL code
    (AXI port declarations and mappings). Expert use only.

### EVM Notes

Some top-level files of the EVM module are unused

 - `CPSI_CIO_top.vhd` is unused; the top-level entity is now part of the project.

Note also that `mrf-evm-dc` uses its own git submodules - albeit not for the CPSI_CIO
variant. These submodules are not part of this project and are unused but be aware that
`git submodule` operations with the `--recursive` flag may fail.

## Generating the Project

After cloning the git repository and initializing/populating the git submodules
the project can be generated from TCL. I like to do that from a `vivado` working-
directory:

  1. `mkdir vivado; chdir vivado`
  2. start vivado in GUI mode
  3. in the TCL console enter `source ../tcl/generateProject.tcl`
  4. wait for the GUI to update
  5. proceed to synthesis/implementation etc.
  
