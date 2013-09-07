package Tropo::WebAPI::On;

# ABSTRACT: "On" something with Tropo

use strict;
use warnings;

use Moo;
use Types::Standard qw(Num Int Str Bool ArrayRef Dict);
use Type::Tiny;

extends 'Tropo::WebAPI::Base';

Tropo::WebAPI::Base::register();

our $VERSION = 0.01;

has event => (is => 'ro', isa => Str, required => 1);
has next  => (is => 'ro', isa => Str);

sub BUILDARGS {
   my ( $class, @args ) = @_;
 
  unshift @args, "event" if @args % 2 == 1;
 
  return { @args };
}

1;
