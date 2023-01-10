#! /usr/bin/env perl
use strict;
use warnings;

use HTTP::Tiny;
use JSON::PP;

my $url
    = 'https://www.jma.go.jp/bosai/forecast/data/overview_forecast/130000.json';

my $response = HTTP::Tiny->new()->get($url);
my $content = $response->{content};

# json形式のデータをperl形式のハッシュリファレンスに変換（jsonでコード）
my $decoded_content = JSON::PP->new->decode($content);
# perl形式のハッシュリファレンスをデリファレンスする
print $decoded_content->{targetArea} . "\n";