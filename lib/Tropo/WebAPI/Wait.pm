package Tropo::WebAPI::Wait;

# ABSTRACT: "Wait" with Tropo

use strict;
use warnings;

use Moo;
use Types::Standard qw(Num Int Str Bool ArrayRef Dict);
use Type::Tiny;

extends 'Tropo::WebAPI::Base';

Tropo::WebAPI::Base::register();

our $VERSION = 0.01;

has milliseconds  => (is => 'ro', isa => Int, required => 1);
has on_signals    => (is => 'ro', isa => Str);
has allow_signals => (is => 'ro', isa => ArrayRef[]);

sub BUILDARGS {
   my ( $class, @args ) = @_;
 
  unshift @args, "milliseconds" if @args % 2 == 1;
 
  return { @args };
}

1;
