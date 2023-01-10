#! usr/bin/env perl
use strict;
use warnings;

use HTTP::Tiny;
use JSON::PP;

my $code = shift @ARGV;

my $url =
    "https://www.jma.go.jp/bosai/forecast/data/overview_forecast/$code.json";

my $response = HTTP::Tiny->new()->get($url);
my $content = $response->{content};

my $decoded_content = JSON::PP->new->decode($content);

my @keys = keys %{$decoded_content};
for my $key (@keys) {
    print "$key" . " : ";
    print "$decoded_content->{$key}" . "\n";
}