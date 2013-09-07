package Tropo::WebAPI::Ask;

# ABSTRACT: "Ask" something with Tropo

use strict;
use warnings;

use Moo;
use Types::Standard qw(Num Int Str Bool ArrayRef Dict);
use Type::Tiny;

extends 'Tropo::WebAPI::Base';

Tropo::WebAPI::Base::register();

our $VERSION = 0.01;

has say           => (is => 'ro', isa => Str, required => 1);
has attempts      => (is => 'ro', isa => Int);
has choices       => (is => 'ro', isa => Str);
has voice         => (is => 'ro', isa => Str);
has allow_signals => (is => 'ro', isa => ArrayRef[]);

sub BUILDARGS {
   my ( $class, @args ) = @_;
 
  unshift @args, "say" if @args % 2 == 1;

  my %param = @args;
  $param{say} = $param{text} if $param{text};
 
  return \%param;
}

1;
