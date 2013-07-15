package Tropo::RestAPI::Base;

# ABSTRACT: Base class for REST-API part of Tropo

use strict;
use warnings;

use Moo;

use HTTP::Tiny;
use Types::Standard qw(Str InstanceOf);

our $VERSION = 0.02;

has url => (
    is      => 'ro',
    isa     => Str,
    default => sub { 'https://api.tropo.com/1.0/' },
);

has ua => (
    is      => 'ro',
    isa     => InstanceOf['HTTP::Tiny'],
    default => sub { HTTP::Tiny->new( agent => 'Perl Tropo API/' . $VERSION ) },
);

has err => (
    is  => 'rw',
    isa => Str,
);

1;