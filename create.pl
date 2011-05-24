#!/usr/bin/perl

use strict;
use warnings;
use Data::ICal;
use Data::ICal::Entry::Event;
use Date::ICal;
use Data::ICal::DateTime;
use DateTime::Event::Recurrence;
use 5.010;

# my $calendar = Data::ICal->new();
# my $vevent = Data::ICal::Entry::Event->new();
# $vevent->add_properties(
#     summary => "Glasgow MathsJam meeting",
#     description => "Go to the pub and talk about maths.",
#     dtstart => Date::ICal->new(
#         year => 2011, month => 6, day => 21, hour => 19
#     )->ical,
#     dtend => Date::ICal->new(
#         year => 2011, month => 6, day => 21, hour => 23
#     )->ical,
#     location => "The Counting House, St Vincent's Place, Glasgow"
# );
# $vevent->recurrence(
my $start = DateTime->new( year => 2011, month => 6, day => 20 );
my $end = DateTime->new( year => 2013 );
my $recurrence = DateTime::Event::Recurrence->monthly(
        weeks => -2, days => "tu"
#    )
);
$recurrence->next($start);
# $calendar->add_entry($vevent);
# print $calendar->as_string;

for my $dt ($recurrence->as_list( start => $start, end => $end)) {
    $dt->add( hours => 19 );
    print $dt->iso8601;
    $dt->add( hours => 4 );
    say " - " . $dt->iso8601;
}
