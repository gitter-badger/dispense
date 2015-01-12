%
% $Id: schoenberg-op25-row-I.ly 79 2009-07-10 10:51:47Z nicb $
%

\version "2.10.33"

\paper{
  indent=0\mm
  line-width=140\mm
  oddFooterMarkup=##f
  oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  scoreTitleMarkup = ##f
}

\score {
	\relative c' {
	  \override Score.MetronomeMark #'transparent = ##t
    \override Score.TimeSignature #'transparent = ##t
		\set Staff.midiInstrument = "acoustic grand"
		\key c \major
		\clef treble
	  \time 12/1
	  \tempo 1 = 120
	  e'1 dis1 cis1 g1 d1 f1 c'1 fis,1 a1 gis1 b1 ais1
	}
  \midi{}
  \layout{}
}
