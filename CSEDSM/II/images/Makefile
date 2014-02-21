#
# $Id: Makefile 14 2014-02-04 22:36:30Z nicb $
#
TARGETS=bw.pdf piano_zeta_un_polo.pdf
CONVERTER=inkscape

all: $(TARGETS)

.SUFFIXES: .pdf .svg

%.pdf: %.svg
	$(CONVERTER) -A $@ $<
