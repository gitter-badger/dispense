%
% $Id: schoenberg-op25-row-R.ly 79 2009-07-10 10:51:47Z nicb $
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
    <<
	\relative c' {
	  \override Score.MetronomeMark #'transparent = ##t
    \override Score.TimeSignature #'transparent = ##t
		\set Staff.midiInstrument = "acoustic grand"
		\key c \major
		\clef treble
	  \time 12/1
	  \tempo 1 = 120
	  bes'1 a1 c1 b1 d1 gis,1 dis'1 fis,1 cis'1 g1 f1 e1
	}
  \addlyrics { B A C H }
  >>
  \midi{}
  \layout{}
}
