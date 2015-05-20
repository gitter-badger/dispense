%
% $Id: schoenberg-op11-set7-notes.ly 79 2009-07-10 10:51:47Z nicb $
%

\version "2.10.33"

\include "_setup.ly"

\score {
	\relative c {
	  \override Score.MetronomeMark #'transparent = ##t
    \override Score.TimeSignature #'transparent = ##t
		\set Staff.midiInstrument = "acoustic grand"
		\key c \major
		\clef bass
	  \time 5/1
	  \tempo 1 = 120
	  f,1 d1 des'1 a'1 es1
	}
  \midi{}
  \layout{}
}
