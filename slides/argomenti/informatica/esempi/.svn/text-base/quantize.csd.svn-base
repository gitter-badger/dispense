<CsoundSynthesizer>
;
; $Id: quantize.csd,v 0.0 2004/12/14 22:22:54 nicb Exp $
;
<CsOptions>
</CsOptions>
<CsInstruments>
	sr=44100
	kr=44100
	ksmps=1
	nchnls=2

	instr	1
	iresbits=16
	iquant=powoftwo(iresbits-p4)
	iquanthalf=iquant/2
al,ar	soundin	"webern-op1-theme.wav"
kleft	downsamp	al
kright	downsamp	ar
;
; attempting to do a rounding on different quantization steps
;
kleft	=	(kleft >= 0 ? kleft+iquanthalf : kleft-iquanthalf)
kright	=	(kright >= 0 ? kright+iquanthalf : kright-iquanthalf)
kleft	=	(int(kleft/iquant)*iquant)
kright	=	(int(kright/iquant)*iquant)
;
; subtracting one to avoid 16-bit overflows
;
kleft	=	kleft+(kleft >= 0 ? -1 : +1)
kright	=	kright+(kright >= 0 ? -1 : +1)

print p4,iquant

aleft	upsamp	kleft
aright	upsamp	kright

	outs	aleft,aright
	endin
</CsInstruments>
<CsScore>
i1 0	9	1
i1 10	9	2
i1 20	9	4
i1 30	9	5
i1 40	9	8
i1 50	15	16
</CsScore>
;
; $Log: quantize.csd,v $
; Revision 0.0  2004/12/14 22:22:54  nicb
; [added by nicb@sme-ccppd.org]
;
; Revision 1.2  1999/12/26 19:09:41  nicb
; [changes by nicb@axnet.it]
;
; - minor additions in several spots
;
; Revision 1.1  1999/11/30 17:26:40  nicb
; Added lesson 5
;
;
</CsoundSynthesizer>
