#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper;
use HTTP::Tiny;
use JSON::PP;

my $webhook_url = 'https://discord.com/api/webhooks/1062339671415341116/868ZyYHu1HlmThosNcIh7QKCwopSoBvs4Sz65N-d_lLcEO86dOESq9LoDfmLwvFJZIW_';

my $options = {
    headers => { 'Content-Type' => 'application/json'},
    content => JSON::PP->new()->encode({ content => 'こんにちは!' }),
    # content => JSON::PP->new()->encode({ content => 'Perl Entrance :+1:' }),
};

my $response = HTTP::Tiny->new()->post( $webhook_url, $options );
print Dumper $response;
