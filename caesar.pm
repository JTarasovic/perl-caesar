#!/usr/bin/perl
package Caesar;

require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(caesar);

sub caesar{
	my $string = shift;
	my $off = shift;
	
	# create a array of ASCII character values from the line
	my @char_arr = unpack ('C*',$string);

	# for each value in the array replace with decrypted value
	foreach my $x (@char_arr) {
		# if the character is a capital letter, offset to the one before
		if ($x >= 65 && $x <= 90) {
			$x = &do_offset($x,65,$off);
		} 
		# if the character is a lower case letter, offset to the one before
		elsif($x >= 97 && $x <=122) {
			$x = &do_offset($x,97,$off);
		}
		# else just replace with the character that the ASCII value represents
		else{
			$x = chr($x);
		}
	}

	return join('',@char_arr);
}

sub do_offset {
	my ($char, $start, $off) = @_;
	$char = ($char - $start);
	$char = ($char + $off) % 26;
	return chr($char + $start);
}

1;