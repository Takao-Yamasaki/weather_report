#! usr/bin/env perl

use strict;
use warnings;

use HTTP::Tiny;
use JSON::PP;

my $webhook_url = 'xxxxxxxxxxxxxxxx';

my $options = {
    headers => { 'Content-Type' => 'application/json' },
    content => JSON::PP->new()->encode({ content =>  }),
};

my $response = HTTP::Tiny->new()->post( $webhook_url, $options );