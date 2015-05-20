%
% $Id: nono-canto-sospeso-II-row-b.ly 80 2009-07-14 05:43:41Z nicb $
%

\version "2.10.33"

\include "_setup.ly"

\score {
	{
	  \override Score.MetronomeMark #'transparent = ##t
    \override Score.TimeSignature #'transparent = ##t
		\set Staff.midiInstrument = "acoustic grand"
    \set Staff.extraNatural = ##f
		\key c \major
		\clef treble
    \time 2/1
	  \tempo 1 = 120
	  < a' bes'' aes b' g' c'' >1
    < fis cis' f' d' e'' es' >1
	}
  \midi{}
  \layout{}
}
