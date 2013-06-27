#!/usr/bin/perl -w

use strict;

print "Enter file name :"; 
my $fastqfile=<STDIN>; chomp($fastqfile);

if (open (INFILE, "$fastqfile")){
    
} else {
  print "Cannot open $fastqfile!\n";
  exit 1;
}

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
