#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper;
use HTTP::Tiny;
use JSON::PP;

my $target_area = get_weather_report() . "\n";
post_discord($target_area);

# 天気予報の取得
sub get_weather_report {
  my $url = 
    'https://www.jma.go.jp/bosai/forecast/data/overview_forecast/140000.json';

  my $response = HTTP::Tiny->new()->get($url);
  my $content = $response->{content};

  my $decorded_content = JSON::PP->new->decode($content);

  my $target_area = $decorded_content->{targetArea};

  return $target_area
}

# Discord Webhook部分
sub post_discord {
  my $text = shift @_;
  my $webhook_url = 'https://discord.com/api/webhooks/1062339671415341116/868ZyYHu1HlmThosNcIh7QKCwopSoBvs4Sz65N-d_lLcEO86dOESq9LoDfmLwvFJZIW_';

  my $options = {
    headers => { 'Content-Type' => 'application/json'},
    content => JSON::PP->new()->encode({ content => $text }),
  };
  my $discode_response = HTTP::Tiny->new()->post( $webhook_url, $options );
};
