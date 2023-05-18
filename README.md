# CIO_EVM - Basic Project for Instantiating the MRF EVM on CPSI CIO

This project provides a reproducible platform where the EVM can be
instantiated. The main goal is to enable an efficient git-based
workflow for collaboration between PSI and MRF.

It is paramount that all design sources can be maintained in git
and versions may be identified unambiguously and re-built etc.

## Avoid block-designs and `.xci` files

While block designs and IP instantiations as `xci` files can - in principle -
be maintained in git there are unfortunately serious drawbacks:

 - minimal changes to IP parameters or a block design may introduce
   many differences to the files which makes it hard to identify what
   exactly has changed between versions.
 - sometimes it is unclear which files need to be put in VCS
 - porting to new vivado versions requires (non-backwards compatible)
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

### Maintaining IP Instantiations in git

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
