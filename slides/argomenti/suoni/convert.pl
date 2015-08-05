#!	/usr/bin/perl
# vi:set nowrap ts=4:
#
# $Id: convert.pl 75 2009-06-14 23:30:37Z nicb $
#

use FileHandle;

use strict;

#
# main
#
	my $conversion_table = '../../suoni/yamaha-c5.table';
	my $hr_table = create_table($conversion_table);

	my $fh = \*STDIN;

	while (my $line = <$fh>)
	{
		chop($line);

		$line = convert($hr_table, $line) if ($line =~ /^i\d+/);

		print "$line\n";
	}
#
# end of main
#

sub create_table($)
{
	my $filename = shift;
	my $fh = new FileHandle;
	my %table = ();

	if ($fh->open($filename, 'r'))
	{
		while (my $line = <$fh>)
		{
			chop($line);
			add(\%table, $line) unless $line =~ /^#/;
		}
	}
	else
	{
		die("open $filename for reading failed");
	}

	return \%table;
}

sub add($$)
{
	my ($hr_table, $line) = @_;
	my ($soundno, $basenote, $dyn) = split(':', $line);

	$hr_table->{$dyn} = {} unless defined($hr_table->{$dyn});

	$hr_table->{$dyn}->{$basenote} = $soundno;
}

sub convert($$)
{
	my ($hr_table, $line) = @_;
	my ($insno, $at, $dur, $dyn, $note_and_ratio, @rest) = split(/\s+/, $line);
	my ($note, $ratio) = split(':', $note_and_ratio);
	my $rratio = convert_ratio($ratio);

	die("unknown dynamic mark $dyn") unless defined($hr_table->{$dyn});
	die("unknown note $note") unless defined($hr_table->{$dyn}->{$note});

	return sprintf("%s %s %s %d %8.5f %s", $insno, $at, $dur,
		$hr_table->{$dyn}->{$note}, $rratio);
}

sub convert_ratio($)
{
	my $semitones = shift;

	return 2**($semitones/12);
}
#
# $Log$
# Revision 1.1  1999/11/03 07:19:01  nicb
# [changes by nicb@axnet.it]
#
# - freeze before lesson 1
#
