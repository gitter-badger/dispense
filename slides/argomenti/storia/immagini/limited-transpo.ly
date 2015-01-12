%
% $Id: limited-transpo.ly 77 2009-06-29 20:47:13Z nicb $
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
	  \time 10/1
	  \tempo 1 = 120
	  \addScript "(2 trasposizioni)"
	  c1 cis1 d1 dis1 e1 fis1 g1 gis1 a1 ais1 |
    \time 6/1
	  \addScript "(tre trasposizioni)"
	  c,1 cis,1 e1 f1 gis1 a1 |
	}
  \midi{}
  \layout{}
}
