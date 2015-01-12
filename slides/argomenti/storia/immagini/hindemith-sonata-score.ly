%
% $Id: hindemith-sonata-score.ly 77 2009-06-29 20:47:13Z nicb $
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
	\relative f  {
		\set Staff.midiInstrument = "trombone"
	  \override Score.MetronomeMark #'transparent = ##t
		\key c \major
		\clef bass
	  \time 3/2
    \tempo 4 = 106
	  f2. c4 g'2 |
	  c,4 bes'2 c,4 des'2 |
	  ces4 bes4 es,4 des8 aes'8 ges4 f4 |
	  e2 a2 e2 |
	  a,1.
	}
  \midi {}
  \layout {}
}
