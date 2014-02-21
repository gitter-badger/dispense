#
# $Id: Makefile 14 2014-02-04 22:36:30Z nicb $
#
TARGETS=cc.pdf frequency_axis_z_plane.pdf mag_response.pdf ideal_vs_real.pdf
CONVERTER=inkscape

all: $(TARGETS)

.SUFFIXES: .pdf .svg

%.pdf: %.svg
	$(CONVERTER) -A $@ $<
