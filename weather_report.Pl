#! /usr/bin/env perl
use strict;
use warnings;

use Data::Dumper;
use HTTP::Tiny;

my $url
    = 'https://www.jma.go.jp/bosai/forecast/data/overview_forecast/130000.json';

my $response = HTTP::Tiny->new()->get($url);

print Dumper $response;