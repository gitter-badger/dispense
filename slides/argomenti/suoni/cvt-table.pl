#!	/usr/bin/perl
# vi:set nowrap ts=4:
#
# $Id: cvt-table.pl 75 2009-06-14 23:30:37Z nicb $
#

use FileHandle;

use strict;

#
# main
#
	my $conversion_table = '../../../suoni/c5-conversion.table';
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
	my ($note, $reference, $intv) = split(':', $line);

	die ("Note $note doubly defined") if defined($hr_table->{$note});

	$hr_table->{$note} = 
	{
		reference	=>	$reference,
		interval	=>	$intv,
	};
}

sub convert($$)
{
	my ($hr_table, $line) = @_;
	my ($insno, $at, $dur, $dyn, $note, @rest) = split(/\s+/, $line);
	my $note_and_ratio = undef;
	my $result = undef;

	if (defined($hr_table->{$note}))
	{
		$result = sprintf("%s %s %s %s %3s:%-2d %s", $insno, $at, $dur, $dyn,
			$hr_table->{$note}->{'reference'},
			$hr_table->{$note}->{'interval'},
			join(' ', @rest));
	}
	else
	{
		die("unknown note $note");
	}

	return $result;
}
#
# $Log$
# Revision 1.1  1999/11/23 21:01:14  nicb
# [changes by nicb@axnet.it]
#
# - added checking structure on the plan
# - modified plan structure
# - added conversion table for cheap csound sequencer preprocessor
#
