#
# $Id
#
# You should set the INCLUDED_MAKE_PATH variable to wherever you have
# downloaded the templates module.
#
TARGET=slides.pdf 
DVI=$(TARGET:.pdf=.dvi)
SRC=$(TARGET):.pdf=.dvi)
AUX=$(TARGET):.pdf=.aux)
ARGDIR=../../argomenti
IMAGEDIR1=$(ARGDIR)/storia/immagini
EXAMPLEDIR1=$(ARGDIR)/storia/esempi
IMAGEDIRS=$(IMAGEDIR1)
EXAMPLEDIRS=$(EXAMPLEDIR1)
BEAMERDIR=../../../Elettroacustica/latex/beamer/sme-ccppd
TEXINPUTS=".:$(BEAMERDIR):$(IMAGEDIRS):"
PDFLATEX=TEXINPUTS=$(TEXINPUTS) pdflatex
PDFLATEXINPUT='\newcommand{\printmode}{$(PRINTMODE)}\input{$<}'
SLIDESVERSION=$$(svn info slides.tex | grep Revision: | cut -d ' ' -f 2)
SLIDESDATE=$$(date +%Y%m%d)
DISTNAME=Storia_III-Bernardini-v.$(SLIDESVERSION)-$(SLIDESDATE)-$(PRINTMODES)$(LECTNOS).pdf
DATADIR=.
LECTURES=01 02 03 04 05 06
ALL_LECTURES=lecture-all.tex
CUR_LECTURE=$(DATADIR)/lecturenumber.tex
COPY=cp
MOVE=mv
BIBTEX=bibtex
LN=ln -sf
ECHO=/bin/echo -e

all: target

target:	examples images
	$(LN) $(ALL_LECTURES) $(CUR_LECTURE)
	$(MAKE) -$(MAKEFLAGS) PRINTMODE='' PRINTMODES=beamer realtarget

onelecture: examples images
	$(MAKE) -$(MAKEFLAGS) $(CUR_LECTURE)
	$(MAKE) -$(MAKEFLAGS) PRINTMODE='' PRINTMODES=beamer realtarget

$(CUR_LECTURE):
	$(RM) $@
	@$(ECHO) '\\includeonlylecture{$(LECTURE)}\n\\newcommand{\\lectnum}{($(LECTURE))}' > $@

alldist: distlectures dist

dist: images
	$(LN) $(ALL_LECTURES) $(CUR_LECTURE)
	$(MAKE) -$(MAKEFLAGS) PRINTMODE=handout PRINTMODES=handout realtarget

distlectures: images
	for i in $(LECTURES);\
  do\
		$(MAKE) -$(MAKEFLAGS) LECTURE="$$i" $(CUR_LECTURE);\
		$(MAKE) -$(MAKEFLAGS) PRINTMODE=handout PRINTMODES=handout LECTNOS="-$$i" realtarget;\
	done

realtarget:
	$(MAKE) -$(MAKEFLAGS) $(TARGET)
	$(MOVE) $(TARGET) $(DISTNAME)

%.pdf:	%.tex
	$(PDFLATEX) $(PDFLATEXINPUT)
#	$(BIBTEX) $* 
	$(RM) $@
	$(PDFLATEX) $(PDFLATEXINPUT)

images:
	  idirs=`echo $(IMAGEDIRS) | sed 's/:/ /'g`;\
		for i in $$idirs;\
		do\
				$(MAKE) -C $$i -$(MAKEFLAGS);\
		done

examples:
	  edirs=`echo $(EXAMPLEDIRS) | sed 's/:/ /'g`;\
		for i in $$edirs;\
		do\
				$(MAKE) -C $$i -$(MAKEFLAGS);\
		done

distclean:
	$(RM) *~ *.aux *.dvi *.out *.log *.bbl *.blg *.toc *.nav *.snm *.pdf

clean: distclean
	$(RM) $(TARGET)

.PHONY:	distclean images realtarget $(CUR_LECTURE)

.SUFFIXES:	.pdf .ps .dvi .aux .tex
