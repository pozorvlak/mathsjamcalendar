#!/usr/bin/perl

use strict;
use warnings;
use Data::ICal;

my $calendar = Data::ICal->new(filename => "mathsjam.ics");
print $calendar->as_string;
