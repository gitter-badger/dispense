%
% $Id: chrom-mediants-min.ly 76 2009-06-26 22:44:04Z nicb $
%

\version "2.10.33"

\include "_setup.ly"

Pianorh = \context Voice = Pianorh  {
	\set Staff.midiInstrument = "acoustic grand"
	\key c \major
	\clef treble
  \time 2/1
	<d'~ bes'>1 <d' b'>1 | <d' bes'>1 <es' bes'>1 | <d'~ bes'~>1 <d' bes'>1 | <d' bes'>1 <g' b'>1
}
Pianolh = \context Voice = Pianolh  {
	\set Staff.midiInstrument = "acoustic grand"
	\key c \major
	\clef bass
  \time 2/1
	g1 fis1 | g1 ges1 | g1 f1 | g1 e1
}
\new Score \with {
  \override TimeSignature #'transparent = ##t
}
 << 
	 \new PianoStaff <<
 		\Pianorh
		\Pianolh
 >> 
	>>
	\layout {
  }
	\midi {
		%\tempo 4 = 60
	}
