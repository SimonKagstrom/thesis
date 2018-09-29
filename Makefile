######################################################################
##
## Copyright (C) 2004,  Blekinge Institute of Technology
##
## Filename:      Makefile
## Author:        Simon Kagstrom <ska@bth.se>
## Description:   Makefile
##
## $Id: Makefile 18900 2008-05-02 10:10:09Z ska $
##
######################################################################
SUBDIRS   = data/
FIGURES   = $(patsubst %.dia,%.pdf,$(wildcard figures/*/*.dia)) \
            $(patsubst %.eps,%.pdf,$(wildcard data/linux-appkern/*.eps)) \
	    $(patsubst %.eps,%.pdf,$(wildcard data/lopi/eps/*.eps))
EXTRA_CLEAN=$(wildcard papers/*/*~)
TARGET    = phd.a4.pdf phd.b5.pdf
DVIPSOPTS = -q -P cmz -G0

include ~/scripts/build/Rules-latex.mk

spikblad.pdf: spikblad.tex abstract.tex
	pdflatex $(LATEXOPTS) $<

phd.a4.pdf: phd.a4.tex phd.tex abstract.tex introduction.tex $(FIGURES) $(wildcard papers/*/*.tex)
	pdflatex $(LATEXOPTS) $<
	~/bin/tools/bibtex.sh $(subst .tex, , $<)
	pdflatex $(LATEXOPTS) $<
	pdflatex $(LATEXOPTS) $<

phd.b5.pdf: phd.b5.tex phd.tex abstract.tex introduction.tex $(FIGURES) $(wildcard papers/*/*.tex)
	pdflatex $(LATEXOPTS) $<
	~/bin/tools/bibtex.sh $(subst .tex, , $<)
	pdflatex $(LATEXOPTS) $<
	pdflatex $(LATEXOPTS) $<
