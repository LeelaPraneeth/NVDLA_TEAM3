## ================================================================
## NVDLA Open Source Project
## 
## Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
## NVDLA Open Hardware License; Check LICENSE which comes with     
## this distribution for more information. 
## ================================================================


##======================= 										  
## Project Name Setup, multiple projects supported			  	  
##======================= 										  
PROJECTS := nv_small 
  																  
##======================= 										  
##Linux Environment Setup 										  
##======================= 										  
  																  

USE_DESIGNWARE  := 1
DESIGNWARE_DIR  := /home/tools/synopsys/syn_2011.09/dw/sim_ver
#CPP  := /home/utils/gcc-4.8.2/bin/cpp
#GCC  := /home/utils/gcc-4.8.2/bin/gcc
#CXX  := /home/utils/gcc-4.8.2/bin/g++
#PERL := /home/cegrad/lpuli012/perl-5.10/bin/perl
#JAVA := /home/utils/java/jdk1.8.0_131/bin/java
#SYSTEMC := /home/ip/shared/inf/SystemC/1.0/20151112/systemc-2.3.0/GCC472_64_DBG
#PYTHON := /home/tools/continuum/Anaconda3-5.0.1/bin/python

CPP  := /usr/bin/cpp                      # Use system cpp (if exists)
GCC  := /usr/bin/gcc                      # Use system gcc
CXX  := /usr/bin/g++                      # Use system g++
PERL := /home/cegrad/lpuli012/perl-5.10/bin/perl  # Your local Perl
#PERL := /usr/local/cadence/XCELIUM2409/tools.lnx86/perl-5.8.8/bin/perl 
JAVA := /usr/bin/java       # Update if needed
SYSTEMC := /path/to/your/systemc          # Update if needed
PYTHON := /usr/bin/python            # Update if needed

VCS_HOME := /home/tools/vcs/mx-2016.06-SP2-4
NOVAS_HOME := /home/tools/debussy/verdi3_2016.06-SP2-9
VERDI_HOME := /home/tools/debussy/verdi3_2016.06-SP2-9
VERILATOR := verilator
CLANG := /home/utils/llvm-4.0.1/bin/clang
