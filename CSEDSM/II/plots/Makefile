#
# $Id: Makefile 14 2014-02-04 22:36:30Z nicb $
#
TARGETS=infinitefir.pdf iir3.pdf inverse_fr.pdf ks_lop.pdf comb_real.pdf
MULTITARGETS=comb_1.pdf comb_2.pdf comb_3.pdf
SOURCES=$(TARGETS:.png=.m)
MATLAB=octave -q
MULTISOURCES=comb.m
SVG2PDF=inkscape 
SED=sed
CAT=cat -s

all: $(TARGETS) $(MULTITARGETS)

$(MULTITARGETS): $(MULTISOURCES)
	export print_number=`echo $@ | $(SED) -e 's/^.*_\([0-9]*\)\.pdf/\1/'`;\
  $(CAT) `echo $@ | $(SED) -e s/_$${print_number}.pdf/.m/` | $(SED) -e "s/^\%PRINT[ 	]*$${print_number}$$/print('$*.svg', '-Psvg');/" | $(MATLAB)
	$(SVG2PDF) -A $@ $*.svg
	$(RM) $*.svg

clean:
	$(RM) $(TARGETS)

.SUFFIXES: .pdf .m

%.pdf: %.m
	(cat $< ; echo "print('$*.svg', '-Psvg');") | $(MATLAB)
	$(SVG2PDF) -A $@ $*.svg
	$(RM) $*.svg
