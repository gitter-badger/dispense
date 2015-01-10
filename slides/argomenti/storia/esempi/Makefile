#
# $Id: Makefile 8 2014-02-04 21:01:21Z nicb $
#
#
TOP=../..
LISZT_NG=liszt-nuages_gris
OBJS=chrom-mediants-maj.wav chrom-mediants-min.wav \
     $(LISZT_NG).wav $(LISZT_NG)-in.wav $(LISZT_NG)-up.wav \
     siegfried.wav siegfried-rs.wav \
     petruschka.wav petruschka-hi.wav petruschka-low.wav \
     gotterdammerung.wav
REMOVABLE_CSDS=chrom-mediants-maj.csd chrom-mediants-min.csd \
     $(LISZT_NG).csd siegfried.csd petruschka.csd
SOUNDDIR_BASE=$(TOP)/suoni
SOUNDDIR=$(SOUNDDIR_BASE)/Yamaha
CONVERT=$(SOUNDDIR_BASE)/convert.pl
CSOUND=csound

all:	$(OBJS)

$(LISZT_NG)-in.wav:	$(LISZT_NG).csd
	echo 'i 1 2 from 1:0 to 5:20' > x.xtr
	SSDIR=$(SOUNDDIR) $(CSOUND) -x x.xtr -dWo ./$@ $(LISZT_NG).csd
	$(RM) x.xtr

$(LISZT_NG)-up.wav:	$(LISZT_NG).csd
	echo 'i 2 3 from 1:0 to 5:20' > x.xtr
	SSDIR=$(SOUNDDIR) $(CSOUND) -x x.xtr -dWo ./$@ $(LISZT_NG).csd
	$(RM) x.xtr

siegfried-rs.wav:	siegfried.csd
	echo 'i 1 from 1:0' > x.xtr
	SSDIR=$(SOUNDDIR) $(CSOUND) -x x.xtr -dWo ./$@ siegfried.csd
	$(RM) x.xtr

petruschka-low.wav:	petruschka.csd
	echo 'i 1 from 1:0' > x.xtr
	SSDIR=$(SOUNDDIR) $(CSOUND) -x x.xtr -dWo ./$@ petruschka.csd
	$(RM) x.xtr

petruschka-hi.wav:	petruschka.csd
	echo 'i 2 from 1:0' > x.xtr
	SSDIR=$(SOUNDDIR) $(CSOUND) -x x.xtr -dWo ./$@ petruschka.csd
	$(RM) x.xtr

clean:
	$(RM) $(OBJS) $(REMOVABLE_CSDS) score.srt score.xtr

.SUFFIXES: .wav .csd .csd.proto

%.wav:	%.csd.proto
	$(CONVERT) < $< > $*.csd
	SSDIR=$(SOUNDDIR) $(CSOUND) -dWo ./$@ $*.csd
	$(RM) $*.csd

%.csd:	%.csd.proto
	$(CONVERT) < $< > $*.csd

%.wav:	%.csd
	SSDIR=$(SOUNDDIR) $(CSOUND) -dWo ./$@ $*.csd
#
# $Log$
# Revision 1.1  1999/11/03 07:17:13  nicb
# [changes by nicb@axnet.it]
#
# - Initial Revision of lesson 1
#
