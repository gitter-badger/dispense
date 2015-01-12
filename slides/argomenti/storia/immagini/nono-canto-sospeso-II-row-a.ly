%
% $Id: nono-canto-sospeso-II-row-a.ly 80 2009-07-14 05:43:41Z nicb $
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
	  a'1 bes1 aes1 b1 g1 c1 fis,1 cis'1 f,1 d'1 e,1 es'1
	}
  \midi{}
  \layout{}
}
