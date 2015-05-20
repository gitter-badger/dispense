%
% $Id: boulez-structures-1a-row.ly 80 2009-07-14 05:43:41Z nicb $
%

\version "2.10.33"

\include "_setup.ly"

\score {
    <<
	\relative c' {
	  \override Score.MetronomeMark #'transparent = ##t
    \override Score.TimeSignature #'transparent = ##t
		\set Staff.midiInstrument = "acoustic grand"
		\key c \major
		\clef treble
    \time 12/1
	  \tempo 1 = 120
	  es'1^"O-0" d1 a1 aes1 g1 fis1 e1 cis'1 c1 bes1 f1 b1
	}
  \addlyrics {"1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" }
  >>
  \midi{}
  \layout{}
}
