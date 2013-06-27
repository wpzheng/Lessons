#!/usr/bin/perl -w

use strict;

print "Enter file name :"; 
my $fastqfile=<STDIN>; chomp($fastqfile);

open(INFILE, "$fastqfile")||die "Cannot open $fastqfile, $!"; #warn
open(OUTFILE,">fasta.fasta")||die "Cannot open, $!";
my @line=(); 
while (<INFILE>){
   @line=$_; 
   if( m/@/)
   {     
  s/@/>/;
    @line=split(/ /,$_);
 	print OUTFILE $line[0]."\n";
	$_=<INFILE>;
    print OUTFILE $_;
	$_=<INFILE>;
	$_=<INFILE>;
   }
}


close (INFILE);
close (OUTFILE);
Enter file contents here
