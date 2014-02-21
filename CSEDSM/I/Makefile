#
# $Id: Makefile 14 2014-02-04 22:36:30Z nicb $
#
COURSELEVEL=I
TARGET=dispense-CSEDSM-$(COURSELEVEL).pdf
SOURCES=$(MAIN)
DEPENDENCIES=introduction.tex complex.tex z_transform.tex FIR.tex piano_z.tex fase.tex icf.tex filter_design.tex
MAIN=main.tex
LATEX=pdflatex
BIBTEX=bibtex
MV=mv
IMAGEDIR=./images
PLOTDIR=./plots

all: $(TARGET)

$(TARGET): images plots $(SOURCES) $(DEPENDENCIES)
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN:.tex=)
	$(RM) $@
	$(LATEX) $(MAIN)
	$(RM) $@
	$(LATEX) $(MAIN)
	$(MV) $(MAIN:.tex=.pdf) $@

clean:
	$(RM) *.aux *.log *.toc *.blg *.bbl *.pdf $(TARGET)

images:
	$(MAKE) -C $(IMAGEDIR) -$(MAKEFLAGS)

plots:
	$(MAKE) -C $(PLOTDIR) -$(MAKEFLAGS)

.PHONY: images plots
