#
# $Id: bw.gnuplot 16 2013-01-21 05:10:47Z nicb $
#
# This produces the transfer function of a bandpass filter (fake)
# along with a constant at 1/sqrt(2)
#

set term svg
set output "bw-gnuplot-template.svg"

plot [0:10][0:1.2] ((erf(x-4) + erfc(x-7)) - 1) * 0.5 w lines title 'Risposta in freq.', 1/sqrt(2) w lines
