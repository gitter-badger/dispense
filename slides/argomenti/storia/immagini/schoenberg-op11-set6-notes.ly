%
% $Id: schoenberg-op11-set6-notes.ly 79 2009-07-10 10:51:47Z nicb $
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
	  \time 4/1
	  \tempo 1 = 120
	  a1 c1 gis'1 cis1
	}
  \midi{}
  \layout{}
}
