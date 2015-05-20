%
% $Id: chrom-mediants-maj.ly 77 2009-06-29 20:47:13Z nicb $
%

\version "2.10.33"

\include "_setup.ly"

Pianorh = \context Voice = Pianorh  {
	\set Staff.midiInstrument = "acoustic grand"
	\key c \major
	\clef treble
  \time 2/1
	<d' b'~>1 <fis' b'>1 | <d' b'>1 <es' bes'>1 | <d'~ b'>1 <d' bes'>1 | <d' b'~>1 <gis' b'>1
}
Pianolh = \context Voice = Pianolh  {
	\set Staff.midiInstrument = "acoustic grand"
	\key c \major
	\clef bass
  \time 2/1
	g1 dis1 | g1~ g1 | g1 f1 | g1 e1
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
	\midi { }
