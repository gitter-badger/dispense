#
# $Id: Makefile 8 2014-02-04 21:01:21Z nicb $
#
TIME_LINES=time_line-1800-1900.pdf time_line-1900-2009.pdf
SCHONBERG_SETS= schoenberg-op11-set1.pdf\
		schoenberg-op11-set2.pdf schoenberg-op11-set3.pdf schoenberg-op11-set4.pdf\
		schoenberg-op11-set5.pdf schoenberg-op11-set6.pdf schoenberg-op11-set7.pdf
SCHONBERG_NOTES=$(SCHONBERG_SETS:.pdf=-notes.jpg)
OBJS=flat.eps chrom-mediants-maj.pdf chrom-mediants-min.pdf \
     major-regions.pdf minor-regions.pdf \
     liszt-nuages_gris.pdf siegfried.pdf gotterdammerung.pdf \
     petruschka.pdf \
		 bartok-sipc-score.pdf hindemith-sonata-score.pdf \
		 diatonic-modes.pdf limited-transpo.pdf whole-tone.pdf \
		 nondia-7note-scales.pdf octatonic-scales.pdf \
		 golden-mean.pdf $(SCHONBERG_SETS)\
		schoenberg-op11-sat.pdf schoenberg-op11-seg.pdf\
		schoenberg-op25-n1-display.pdf schoenberg-op25-rowmatrix.pdf schoenberg-op33-1-display.pdf\
		schoenberg-op33-rows-display.pdf\
		schoenberg-op25-row-O.pdf schoenberg-op25-row-I.pdf schoenberg-op25-row-RI.pdf schoenberg-op25-row-R.pdf\
		schoenberg-op25-rowmatrix.pdf\
		boulez-structures-1a-row.pdf boulez-structures-1a-row-devel.pdf\
		nono-canto-sospeso-II-row-a.pdf nono-canto-sospeso-II-row-b.pdf\
		nono-canto-sospeso-II-rhythmic-strand.pdf \
		 $(TIME_LINES)
MIDIOBJS=$(OBJS:.eps=.mid)
MUP=mup
LILY=lilypond --pdf -dno-gs-load-fonts -dinclude-eps-fonts
GS=gs
FIG2DEV=fig2dev
GNUPLOT=gnuplot
PIC=groff -p -mpic -P -l
CONVERT=convert -density 300x300
TROFF=groff

all: $(OBJS)

clean:
	$(RM) $(OBJS) $(MIDIOBJS) *.bak

minor-regions.eps major-regions.eps: flat.eps

$(TIME_LINES): time_line.macros time_line.colors

$(SCHONBERG_SETS) schoenberg-op33-rows.pdf: $(SCHONBERG_NOTES) schoenberg-op33-rows.jpg

schoenberg-op25-rowmatrix.pdf: schoenberg-op25-rowmatrix-table.jpg

schoenberg-op25-rowmatrix-table.jpg: schoenberg-op25-rowmatrix-table.tbl
	$(TROFF) -t $< | ps2eps --ignoreBB > $*.eps
	$(CONVERT) $*.eps $@

nono-canto-sospeso-II-rhythmic-strand.pdf: nono-canto-sospeso-II-rhythmic-strand-base.jpg

.SUFFIXES: .pdf .jpg .eps .pic .mid .mup .xfig .fig .gplot

%.eps:	%.mup
	$(MUP) $< | $(GS) -sDEVICE=epswrite -sOutputFile=- -dNOPAUSE -q - > $@

%.mid:	%.mup
	$(MUP) $< -m $@

%.pdf:	%.xfig
	$(FIG2DEV) -L pdf $< > $@	

%.pdf:	%.fig
	$(FIG2DEV) -L pdf $< > $@	

%.pdf: %.ly
	$(LILY) $<
	$(RM) $*-1.* $*-systems.tex* $*.eps

%.jpg: %.ly
	$(LILY) $<
	$(CONVERT) $*.pdf $*.jpg
	$(RM) $*-1.* $*-systems.tex* $*.eps $*.pdf

%.pdf: %.pic
	$(PIC) $< | ps2pdf - > $@

%.eps: %.fig
	$(FIG2DEV) -L eps $< > $@
