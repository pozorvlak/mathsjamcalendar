#!/usr/bin/perl

use strict;
use warnings;
use Data::ICal;
use Data::ICal::Entry::Event;
use Data::ICal::DateTime;
use DateTime::Event::Recurrence;

my $start = DateTime->new( year => 2011, month => 6, day => 20 );
my $end = DateTime->new( year => 2013 );

our $timezone = DateTime::TimeZone->new( name => "Europe/London" );
my $calendar = Data::ICal->new();
my $recurrence = DateTime::Event::Recurrence->monthly(
        weeks => -2, days => "tu"
);
$recurrence->set_time_zone($timezone);

for my $dt ($recurrence->as_list( start => $start, end => $end)) {
    my $vevent = Data::ICal::Entry::Event->new();
    $vevent->add_properties(
        summary => "Glasgow MathsJam meeting",
        description => "Go to the pub and talk about maths.",
        location => "The Counting House, St Vincent's Place, Glasgow"
    );
    $dt->set_time_zone( "floating" );
    $dt->add( hours => 19 );
    $vevent->start($dt);
    $dt->add( hours => 4 );
    $vevent->end($dt);
    $calendar->add_entry($vevent);
}
print $calendar->as_string;
