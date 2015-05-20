%
% $Id: nondia-7note-scales.ly 77 2009-06-29 20:47:13Z nicb $
%

\version "2.10.33"

\include "_setup.ly"

#(define (make-text-script x) 
   (make-music 'TextScriptEvent
               'direction DOWN
               'text (make-simple-markup x)))

#(define (add-text-script m x)
   (if (equal? (ly:music-property m 'name) 'EventChord)
       (set! (ly:music-property m 'elements)
             (cons (make-text-script x)
                  (ly:music-property m 'elements)))       
       (let ((es (ly:music-property m 'elements))
	     (e (ly:music-property m 'element)))
	 (map (lambda (y) (add-text-script y x)) es)
	 (if (ly:music? e)
	     (add-text-script e x))))
   m)

addScript =
#(define-music-function (parser location script music )
					( string? ly:music? )
		(add-text-script music script))

\score {
	\relative c' {
	  \override Score.MetronomeMark #'transparent = ##t
    \override Score.TimeSignature #'transparent = ##t
		\set Staff.midiInstrument = "acoustic grand"
		\key c \major
		\clef treble
	  \time 8/1
	  \tempo 1 = 120
	  \addScript "(Do Lidio/Misolidio)"
	  c1 d1 e1 fis1 g1 a1 bes1 c1 |
	  c,1 d1 e1 fis1 gis1 a1 bes1 c1 |
	}
  \midi{}
  \layout{}
}
