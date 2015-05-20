%
% $Id: whole-tone.ly 77 2009-06-29 20:47:13Z nicb $
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
	  \time 7/1
	  \tempo 1 = 120
	  \addScript "WT-0"
	  c1 d1 e1 fis1 gis1 ais1 c1 |
	  \addScript "WT-1"
	  des,1 es,1 f1 g1 a1 b1 des1 |
	}
  \midi{}
  \layout{}
}
