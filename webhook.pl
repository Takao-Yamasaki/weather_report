#!/use/bin/env perl
use strict;
use warnings;

use HTTP::Tiny;
use JSON::PP;

my $url = 
  'https://www.jma.go.jp/bosai/forecast/data/overview_forecast/130000.json';

# $responseの中身は、ハッシュリファレンス
# HASH(0x7f79c9a36a48)
my $response = HTTP::Tiny->new()->get($url);
print $response;

# $contentの中身は、JSON
my $content = $response->{content};
print $content;
