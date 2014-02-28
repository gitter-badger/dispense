#
# $Id: Makefile 14 2014-02-04 22:36:30Z nicb $
#
TARGET=dispense-CSEDSM-II.pdf
SOURCE=$(MAIN).tex
DEPENDENCIES=ripasso_FIR.tex IIR.tex comb.tex
MAIN=main
LATEX=pdflatex
BIBTEX=bibtex
MV=mv
IMAGEDIR=./images
PLOTDIR=./plots

all: $(TARGET)

$(TARGET): images plots $(SOURCE) $(DEPENDENCIES)
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN:.tex=)
	$(RM) $(MAIN).pdf
	$(LATEX) $(MAIN)
	$(RM) $(MAIN).pdf
	$(LATEX) $(MAIN)
	$(MV) $(MAIN).pdf $@

clean:
	$(RM) *.aux *.log *.toc *.blg *.bbl *.pdf $(TARGET)

images:
	$(MAKE) -C $(IMAGEDIR) -$(MAKEFLAGS)

plots:
	$(MAKE) -C $(PLOTDIR) -$(MAKEFLAGS)

.PHONY: images plots
