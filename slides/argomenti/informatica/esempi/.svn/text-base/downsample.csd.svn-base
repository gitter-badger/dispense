<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
	sr=44100
	kr=44100
	ksmps=1
	nchnls=2

	instr	1
	isamples=kr/p4
al,ar	soundin	"webern-op1-theme.wav"
ktime	timeinstk
kflag	=	ktime % isamples

	if	kflag != 0 	kgoto	zeroit
aleft	=	al
aright	=	ar
	goto	output

zeroit:
aleft	=	0
aright	=	0

output:
	outs	aleft,aright
	endin
</CsInstruments>
<CsScore>
i1 0	9	1
i1 10	9	10	
i1 20	9	100	
i1 30	9	980
i1 40	9	5512.5
i1 50	9	11025
i1 60	9	22050
i1 70	15	44100
</CsScore>
</CsoundSynthesizer>
