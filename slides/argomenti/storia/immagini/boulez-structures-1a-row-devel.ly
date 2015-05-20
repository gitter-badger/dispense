%
% $Id: boulez-structures-1a-row-devel.ly 80 2009-07-14 05:43:41Z nicb $
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
	  es'1 d1 a1 aes1 g1 fis1 e1 cis'1 c1 bes1 f1 b1 \bar ""
    \time 12/1 d1^"T-11" cis1 gis1 g1 fis1 f1 es'1 c1 b1 a1 e'1 bes1 \bar ""
    \time 12/1 a1^"T-6" aes1 es'1 d1 cis1 c1 bes1 g1 fis1 e'1 b1 f1 \bar ""
	}
  \addlyrics {"1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12"   "2" "8" "4" "5" "6" "11" "1" "9" "12" "3" "7" "10"   "3" "4" "1" "2" "8" "9" "10" "5" "6" "7" "12" "11"}
  >>
  \midi{}
  \layout{}
}
