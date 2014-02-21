#
# $Id: Makefile 14 2014-02-04 22:36:30Z nicb $
#
TARGETS=fir2.pdf fir3.pdf zplane.pdf fase_3.pdf
MULTITARGETS=ICF2_1.pdf ICF2_2.pdf ICF2_3.pdf
SOURCES=$(TARGETS:.pdf=.m)
MULTISOURCES=ICF2.m
MATLAB=octave -q
SVG2PDF=inkscape -d 150
SED=sed
CAT=cat

all: $(TARGETS) $(MULTITARGETS)

$(TARGETS): $(SOURCES)

$(MULTITARGETS): $(MULTISOURCES)
	export print_number=`echo $@ | $(SED) -e 's/^.*_\([0-9]*\)\.pdf/\1/'`;\
  $(CAT) `echo $@ | $(SED) -e s/_$${print_number}.pdf/.m/` | $(SED) -e "s/^\%PRINT[ 	]*$${print_number}$$/print('$*.svg', '-Psvg');/" | $(MATLAB)
	$(SVG2PDF) -A $@ $*.svg
	$(RM) $*.svg

clean:
	$(RM) $(TARGETS) $(MULTITARGETS)

.SUFFIXES: .pdf .m

%.pdf: %.m
	(cat $< ; echo "print('$*.svg', '-Psvg');") | $(MATLAB)
	$(SVG2PDF) -A $@ $*.svg
	$(RM) $*.svg
