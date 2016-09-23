#!/usr/bin/perl

use strict;
use warnings;
use v5.10;
use FindBin qw/$Bin/;
use lib "$Bin/../lib";
use MojoX::Twitter;

my $twitter = MojoX::Twitter->new(
    user => $ENV{MOJOX_TWITTER_USER} || 'x',
    pass => $ENV{MOJOX_TWITTER_PASS} || 'z'
);
$twitter->streaming('https://userstream.twitter.com/1.1/user.json', sub {
    # do the streaming
    my ($content, $bytes) = @_;
    say "Got $bytes";
});