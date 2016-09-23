#!/usr/bin/perl

use strict;
use warnings;
use v5.10;
use FindBin qw/$Bin/;
use lib "$Bin/../lib";
use MojoX::Twitter;

my $twitter = MojoX::Twitter->new(
    consumer_key    => 'z',
    consumer_secret => 'x',
    access_token        => '1-z',
    access_token_secret => 'x',
);
$twitter->streaming('https://userstream.twitter.com/1.1/user.json', { with => 'followings' }, sub {
    # do the streaming
    my ($content, $bytes) = @_;
    say "Got $bytes";
});