#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use IO::Socket::SSL;

use_ok( 'Tropo::RestAPI::Session' );

my $token = '1234';

my $session = Tropo::RestAPI::Session->new;
isa_ok $session, 'Tropo::RestAPI::Session';

my $result = $session->create;
ok !$result, 'Cannot create session - token missing';

BAIL_OUT( 'Need support of client-side SNI (openssl >= 1.0.0)' )
    if IO::Socket::SSL->can_client_sni();

$result = $session->create( token => $token );
ok !$result, 'Cannot create session - invalid token';
is $session->err, 'Tropo session launch failed!';

done_testing();
