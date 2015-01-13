#
# $Id: Makefile 8 2014-02-04 21:01:21Z nicb $
#
OBJS=downsample.wav foldover.wav quantize.wav
CSOUND=csound -m0 -d

all: 	$(OBJS)

clean:
	$(RM) $(OBJS)

.PHONY: 		clean

.SUFFIXES: 	.wav .csd

%.wav: 	%.csd
	$(CSOUND) -Wo ./$@ $<
