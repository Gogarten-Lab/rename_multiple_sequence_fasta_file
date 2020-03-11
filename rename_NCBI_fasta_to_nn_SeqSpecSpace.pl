#!usr/bin/perl
#
### this script is used to rename all sequences in a general NCBI formatted multiple fasta file to be in
### the format ">nnn_speciesname_strain " followed by the original annotation line NewLine followed by the sequence on
### the following line (in a single line).

### note this is an improved version that removes (,),: from the species name and follows the species name by a white space (leading to shorter species names
# the file is seaview compatible
# not elegant, but it works 

#use strict;
#use warnings;
my$dummy=0;

unless(@ARGV==1) {die "please provide name of the file in the command line!!\n";}

open ( IN , "<$ARGV[0]");
my@temp= split ( /\./ , $ARGV[0] );
my$outname=$temp[0]."\.namesonly\.seq";
open (OUT , ">$outname");

while ( my $line = <IN> ) {
	
	chomp $line;
	
	if ( $line =~ s/^>/_/ ) {
	    $count += 1;
	   # $line =~ s/^_\s/_/;
		
		
		# match only the species name and save it
		# into the variable $1
		
		$line =~ /\[(.*?)\]/;			 
		
		my $species_strain = $1;
		#print "$1\n";
		
		# replace all whitespace with "_" characters
		$species_strain =~ s/\s/_/g;
		$species_strain =~ s/\(/_/g;
		$species_strain =~ s/\)/_/g;
		$species_strain =~ s/\:/_/g;
		 # $species_strain =~ s/\./_/g;
       
		
		#print OUT (">"."$count"."_"."$species_strain"." "."$line\n"); #this guaranties unique names
		if ($dummy == 0)
        {print OUT (">"."$count"."_"."$species_strain"." "."$line\n")}
            else
        {print OUT ("\n>"."$count"."_"."$species_strain"." "."$line\n")};
    
		$dummy=1;
		print (">"."$species_strain"." "."\n");
		
	}
	
	else {print OUT ("$line"); #prints to file without newlines.  
		print ("$line\n")}#prints to screen with newlines
		
}
		
		
