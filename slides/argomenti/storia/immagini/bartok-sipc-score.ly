%
% $Id: bartok-sipc-score.ly 77 2009-06-29 20:47:13Z nicb $
%
\version "2.10.33"

\include "_setup.ly"

\score {
	\relative c'''  {
	  \override Score.MetronomeMark #'transparent = ##t
		\set Staff.midiInstrument = "acoustic grand"
		\key c \major
		\clef treble
	  \time 4/4
	  \tempo 4 = 162
	  r8 a8 gis4 fis8 e4( dis8) | cis8 b8 cis4 dis8 e4( fis8) | 
	  gis8 a8 b4 a8 gis4 fis8 | e8 dis8 cis4 b8 a4( b8) | a4 s2.
	}
	\midi {}
  \layout {}
}
