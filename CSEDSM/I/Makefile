#
# $Id: Makefile 14 2014-02-04 22:36:30Z nicb $
#
COURSELEVEL=I
TARGET=dispense-CSEDSM-$(COURSELEVEL).pdf
SOURCE=$(MAIN).tex
DEPENDENCIES=introduction.tex complex.tex z_transform.tex FIR.tex piano_z.tex fase.tex icf.tex filter_design.tex convoluzione.tex
MAIN=main
LATEX=pdflatex
BIBTEX=bibtex
MV=mv
TOP=..
IMAGEDIR=$(TOP)/images
PLOTDIR=$(TOP)/plots

all: $(TARGET)

$(TARGET): images plots $(SOURCE) $(DEPENDENCIES)
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(RM) $(MAIN).pdf
	$(LATEX) $(MAIN)
	$(RM) $(MAIN).pdf
	$(LATEX) $(MAIN)
	$(MV) $(SOURCE:.tex=.pdf) $@

clean:
	$(RM) *.aux *.log *.toc *.blg *.bbl *.pdf $(TARGET)

images:
	$(MAKE) -C $(IMAGEDIR) -$(MAKEFLAGS)

plots:
	$(MAKE) -C $(PLOTDIR) -$(MAKEFLAGS)

.PHONY: images plots
