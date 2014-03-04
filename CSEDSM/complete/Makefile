#
# $Id: Makefile 14 2014-02-04 22:36:30Z nicb $
#
TARGET=dispense-CSEDSM.pdf
SOURCE=$(MAIN).tex
#DEPENDENCIES=introduction.tex complex.tex z_transform.tex FIR.tex piano_z.tex fase.tex icf.tex filter_design.tex \
#             IIR.tex comb.tex
MAIN=main
LATEX=TEXINPUTS=$(TEXINPUTS) pdflatex 
BIBTEX=bibtex
MV=mv
TOP=..
IMAGEDIR=$(TOP)/images
PLOTDIR=$(TOP)/plots
STAGE_I_DIR=$(TOP)/I
STAGE_II_DIR=$(TOP)/II
# TEXINPUT=.:$(STAGE_I_DIR):$(STAGE_II_DIR):$(STAGE_I_DIR)/images:$(STAGE_II_DIR)/images:$(STAGE_I_DIR)/plots:$(STAGE_II_DIR)/plots
TEXINPUTS=.:$(STAGE_I_DIR):$(STAGE_II_DIR):
VPATH=.:$(STAGE_I):$(STAGE_II)

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

realclean:
	$(MAKE) -$(MAKEFLAGS) clean
	$(MAKE) -C $(IMAGEDIR) -$(MAKEFLAGS) clean
	$(MAKE) -C $(PLOTDIR) -$(MAKEFLAGS)  clean

images:
	$(MAKE) -C $(IMAGEDIR) -$(MAKEFLAGS)

plots:
	$(MAKE) -C $(PLOTDIR) -$(MAKEFLAGS)

.PHONY: images plots clean realclean
