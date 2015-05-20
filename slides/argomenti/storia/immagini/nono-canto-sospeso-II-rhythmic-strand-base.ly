%
% $Id: nono-canto-sospeso-II-rhythmic-strand-base.ly 80 2009-07-14 05:43:41Z nicb $
%

\version "2.10.33"

\include "_setup.ly"

\score {
  <<
    <<
		  \relative b' {
				  \override Score.MetronomeMark #'transparent = ##t
				  \override Score.TimeSignature #'transparent = ##t
					\set Staff.midiInstrument = "acoustic grand"
				  \override Staff.StaffSymbol #'line-count = 1
					\key c \major
				  \time 2/4
					\tempo 1 = 120
		      b8 b4.~ | b2~ | b8 s4. \bar ""
	    }
      \addlyrics { "x1" "x8" __ __ }
    >>
    <<
      \relative b' {
				  \override Score.MetronomeMark #'transparent = ##t
				  \override Score.TimeSignature #'transparent = ##t
					\set Staff.midiInstrument = "acoustic grand"
				  \override Staff.StaffSymbol #'line-count = 1
					\key c \major
				  \time 2/4
					\tempo 1 = 120
          \times 2/3 { b4 b8~ } b4~ | b2~ | b8 s4. \bar ""
      }
      \addlyrics { "x3" "x13" __ __ __ }
    >>
    <<
      \relative b' {
				  \override Score.MetronomeMark #'transparent = ##t
				  \override Score.TimeSignature #'transparent = ##t
					\set Staff.midiInstrument = "acoustic grand"
				  \override Staff.StaffSymbol #'line-count = 1
					\key c \major
				  \time 2/4
					\tempo 1 = 120
          b8. b16~ b4~ | b2 | b8 s4. \bar ""
      }
      \addlyrics { "x3" "x13" __ __ "x2" }
    >>
    <<
      \relative b' {
				  \override Score.MetronomeMark #'transparent = ##t
				  \override Score.TimeSignature #'transparent = ##t
					\set Staff.midiInstrument = "acoustic grand"
				  \override Staff.StaffSymbol #'line-count = 1
					\key c \major
				  \time 2/4
					\tempo 1 = 120
          b4 b4~ | \times 4/5 { b8. b8~ } \times 4/5 { b8. b8~ } | \times 4/5 { b16 b16 b8. } s4 \bar ""
      }
      \addlyrics { "x5" "x8" __ "x5" __ "x3" __ "x1" __ __ }
    >>
  >>
  \midi{}
  \layout{}
}
