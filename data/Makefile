######################################################################
##
## Copyright (C) 2004,  Blekinge Institute of Technology
##
## Filename:      Makefile
## Author:        Simon Kagstrom <ska@bth.se>
## Description:   Makefile
##
## $Id: Makefile 16432 2007-10-23 04:46:17Z ska $
##
######################################################################
SUBDIRS   = introduction smp-survey
EXTRA_CLEAN = cibyl-performance/.generated

all: cibyl-performance/.generated

include ~/scripts/build/Rules-latex.mk

cibyl-performance/.generated:
	cd cibyl-performance && ./build-all-plots.sh
	touch $@
