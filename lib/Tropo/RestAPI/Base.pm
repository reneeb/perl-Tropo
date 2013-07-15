package Tropo::RestAPI::Base;

use strict;
use warnings;

use Moo;

use HTTP::Tiny;
use Types::Standard qw(Str InstanceOf);

our $VERSION = 0.01;

has url => (
    is      => 'ro',
    isa     => Str,
    default => sub { 'https://api.tropo.com/1.0/' },
);

has ua => (
    is      => 'ro',
    isa     => InstanceOf['LWP::UserAgent'],
    default => sub { HTTP::Tiny->new( agent => 'Perl Tropo API/' . $VERSION ) },
);

has err => (
    is  => 'rw',
    isa => Str,
);

1;