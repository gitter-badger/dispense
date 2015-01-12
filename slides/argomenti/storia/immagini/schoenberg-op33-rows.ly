%
% $Id: schoenberg-op33-rows.ly 79 2009-07-10 10:51:47Z nicb $
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
	  \time 13/1
	  \tempo 1 = 120
	  bes1 f'1 c'1 b1 a1 fis1 s1 cis'1 dis1 g,1 aes1 d1 e,1 |
    es1 aes1 des1 d1 e,1 g1 s1 c1 bes1 ges1 f1 b1 a1
	}
  \midi{}
  \layout{}
}
