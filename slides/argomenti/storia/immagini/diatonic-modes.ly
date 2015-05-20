%
% $Id: diatonic-modes.ly 77 2009-06-29 20:47:13Z nicb $
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
		\set Staff.midiInstrument = "acoustic grand"
		\key c \major
		\clef treble
	  \time 8/1
	  \tempo 1 = 120
	  \addScript "do ionico"
	  c1 d1 e1 f1 g1 a1 b1 c1 |
	  \addScript "do dorico"
	  c,1 d,1 es1 f1 g1 a1 bes1 c1 |
	  \addScript "do frigio"
	  c,1 des,1 es1 f1 g1 aes1 bes1 c1 |
	  \addScript "do lidio"
	  c,1 d,1 e1 fis1 g1 a1 b1 c1 |
	  \addScript "do misolidio"
	  c,1 d,1 e1 f1 g1 a1 bes1 c1 |
	  \addScript "do eolico"
	  c,1 d,1 es1 f1 g1 aes1 bes1 c1 |
	  \addScript "do locrio"
	  c,1 des,1 es1 f1 ges1 aes1 bes1 c1 |
	}
  \midi {}
  \layout {}
}
