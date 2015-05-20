%
% $Id: octatonic-scales.ly 77 2009-06-29 20:47:13Z nicb $
%

\version "2.10.33"

\include "_setup.ly"

\score {
	\relative c' {
	  \override Score.MetronomeMark #'transparent = ##t
    \override Score.TimeSignature #'transparent = ##t
		\set Staff.midiInstrument = "acoustic grand"
		\key c \major
		\clef treble
	  \time 9/1
	  \tempo 1 = 120
	  c1 d1 es1 f1 fis1 gis1 a1 b1 c1 |
	  c,1 cis1 dis1 e1 fis1 g1 a1 bes1 c1 
	}
  \midi{}
  \layout{}
}
