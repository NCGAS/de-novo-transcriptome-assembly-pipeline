#! /usr/bin/perl
use warnings;
use strict;
use Text::Wrap;

## Program Info:
#
# Name:  subset_fasta
#
# Function:  Takes a multiple fasta file and removes a set of 
#    sequences to makes a second fasta file.  Useful for pulling
#    subsets of sequences from entire genomes.
#
# Author: John Nash
#  Copyright (c) National Research Council of Canada, 2000-2003,
#  all rights reserved.
#
# Licence: This script may be used freely as long as no fee is charged
#    for use, and as long as the author/copyright attributions
#    are not removed.
#
# History:
#   Version 1.0 (June 04, 2001): first non-beta release.
#   Version 1.1 (June 05, 2001): Fixed up header of subset file to 
#     give more info
#   Version 1.2 (June 26, 2001): used stdin instead of a file from cmd line
#     Can define sequences to be retrieved on an optional command line list
#   Version 1.3 (Oct 4, 2002): Preserves gene order from incoming list
#   Version 1.4 (Oct 7, 2002); better behaved with ">" characters!
#   Version 1.5 (July 22, 2005); Take name from first word of 
#     header of input (-i) file.
#     No more dependence on Tie:IxHash 
#
##

my $title = "subset_fasta";
my $version = "1.5";
my $date = "22 July, 2005";
$Text::Wrap::columns = 65;

# Error message:
my $error_msg = "Type \"$title -h\" for help.";

# Get and process the command line params:
# Returns array of $fasta_file and $orf_file;
my (@cmd_line, $orf_file, $opt_orfs);

@cmd_line = ();
@cmd_line = process_command_line();
$orf_file = $cmd_line[0];
$opt_orfs = $cmd_line[1];

my @orf_list;
# handle the possiblilty of command-line ORFS:

if ($opt_orfs eq '')  {
# open the ORF list:
  open ORF_FILE, $orf_file or 
    die "Cannot open $orf_file: $!\n$error_msg\n";
	
# read each value into an array:
  while (<ORF_FILE>) {
    s/\r\n/\n/g;
    chomp;
# We don't like blank lines!!!
    next if (/^\s*$/);
    my @temp = split / /, $_;
    $_ = $temp[0];

# if there is a fasta header char ( > ), remove it:
    $_ = substr ($_, 1, length $_) if (/^>/);
    push @orf_list, $_;
  }
}
else  {
  @orf_list = split /:/, $opt_orfs;
}

## Read in the sequence from a multiple FASTA file:
my %sequence;
my $seq_name;

while (<>) {
  s/\r\n/\n/g;
  chomp;
# read the whole header as we display it later:
  if (/^>/)  {
# Take the header as the sequence name:
# remove the header character ( > ):
    $seq_name = substr($_, 1, length $_);
  }
  else {
    $sequence{$seq_name} .= $_;
  }
}

# if the header is in the ORF_list
# take the sequence
# print the header and sequence:
my $orf_name;
my $hit;

foreach $hit (sort keys %sequence) {

# grab the first word which is the sequence name:
  my @temp = split / /, $hit;
  my $temp_name = $temp[0];

# Compare with list
  foreach $orf_name (@orf_list) {
    if ($orf_name eq $temp_name) {

# Add the full header, not just the sequence name:
      print ">$hit\n";
      print wrap('', '', "$sequence{$hit}\n");
    }
  }
}

### end of main:

##### SUBROUTINES:
sub process_command_line {
#
# Expects: 
# Returns: @my_cmd_line = ($orf_file, $opt_orfs)
# Uses:
	
# Variables:
  my %opts = ();    # command line params, as entered by user
  my @my_cmd_line;  # returned value
  my @list;	    # %opts as an array for handling
  my $cmd_args;     # return value for getopts()
	
# Holders for command line's files:
  my $myorf_file = '';
  my $myopt_orfs = '';
	
# Scratch:
  my $item;
	
# Get the command=line parameters:
  use vars qw($opt_f $opt_i $opt_o $opt_h);
  use Getopt::Std;
  $cmd_args = getopts('i:o:h', \%opts);
	
# Die on illegal argument list:
  if ($cmd_args == 0) {
    die ("Error: Missing or incorrect command line parameter(s)!\n",
         $error_msg, "\n");
  }
	
# Check and enact each command-line argument:
  if (!%opts)  {
    die ($error_msg, "\n");
  }
	
# Make the hashes into an array:
  @list = keys %opts;
	
# Do a quick check for "help" and the compulsory parameters:
#   If the compulsory files are not there, squawk and die:
  foreach $item (@list)  {
# Help:
    if ($item eq "h")  {
      help();
    }
# ORF file:
    elsif ($item eq "i") {
      $myorf_file = $opts{$item};
    }
# optional command-line ORFs:
    elsif ($item eq "o") {
			$myopt_orfs = $opts{$item};
    }
  }
	
# Put it in an array:
	@my_cmd_line = ($myorf_file, $myopt_orfs);
	return @my_cmd_line;
	
} #end of sub process_command_line()

sub help {
	
print <<EOHelp;
$title, version $version, $date

Function:  Takes a multiple fasta file and removes a set of 
      sequences to makes a second fasta file.  Useful for pulling
      subsets of sequences from entire genomes. The input fasta file
      comes from stdin, and output is written to stdout, so $title can 
      be a filter. 

Syntax:  $title -i list_file < fasta_file > subset_file
or:   $title -o header1:header2:header3 < fasta_file > subset_file
or:   $title -h for help

Compulsory arguments:

Either:
 -i   list_file:  a list of sequences, one per line, of headers of
      sequences to be retrieved from the larger file.
or:
 -o   header1:header2:headerN which is a colon-delimited set of headers
      of sequences to be retrieved from the larger file. This parameter
      takes priority over \"-i\".  If both are supplied, \"-o\" is used
      preferentially.


Example:
 $title -i myorfs < genome.fasta > subset.fasta
      where genome.fasta is the multiple fasta file containing lots of 
      genes, and subset.fasta is the new output.

**Warning**  Make sure the headers in your list are the same as the
      headers in the fasta file !!!  The characters from the \> up to 
      the first space in each entry are used as the \"sequence name\".

EOHelp
die ("\n");
} # end of sub help
