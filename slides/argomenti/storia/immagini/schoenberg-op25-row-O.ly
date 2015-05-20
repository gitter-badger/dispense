%
% $Id: schoenberg-op25-row-O.ly 79 2009-07-10 10:51:47Z nicb $
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
	  \time 12/1
	  \tempo 1 = 120
	  e1 f1 g1 cis1 fis,1 dis'1 gis,1 d1 b'1 c1 a1 bes1
	}
  \midi{}
  \layout{}
}
