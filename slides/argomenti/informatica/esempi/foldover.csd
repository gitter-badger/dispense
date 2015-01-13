<CsoundSynthesizer>
;
; $Id: foldover.csd,v 0.0 2004/12/14 22:22:54 nicb Exp $
;
<CsOptions>
</CsOptions>
<CsInstruments>
	sr=44100
	kr=11025
	ksmps=4
	nchnls=2

	instr 1
	istart=p4
	iend=p5
kfreq	line	istart,p3,iend

aleft	oscil	6000,kfreq,p6		; to hear the foldover better ;)
kright	oscil	10000,kfreq,p6

aright	=	kright
	outs	aleft, aright
	endin
</CsInstruments>
<CsScore>
f1 0 8192 10 1
f2 0 8192 10 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2

i1 0 10 4500 6500 1

i1 12 10 500 2000 2
</CsScore>
;
; $Log: foldover.csd,v $
; Revision 0.0  2004/12/14 22:22:54  nicb
; [added by nicb@sme-ccppd.org]
;
; Revision 1.2  1999/12/26 19:09:41  nicb
; [changes by nicb@axnet.it]
;
; - minor additions in several spots
;
; Revision 1.1  1999/11/30 17:26:39  nicb
; Added lesson 5
;
;
</CsoundSynthesizer>
