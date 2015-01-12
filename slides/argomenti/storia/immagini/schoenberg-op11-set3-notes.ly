%
% $Id: schoenberg-op11-set3-notes.ly 79 2009-07-10 10:51:47Z nicb $
%

\version "2.10.33"

\paper{
  indent=0\mm
  line-width=50\mm
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
	  \time 4/1
	  \tempo 1 = 120
	  bes1 e1 fis1 a1
	}
  \midi{}
  \layout{}
}
