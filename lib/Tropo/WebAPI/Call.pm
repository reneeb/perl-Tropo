package Tropo::WebAPI::Call;

# ABSTRACT: "Call" someone via Tropo API

use strict;
use warnings;

use Moo;
use Types::Standard qw(Int Str Bool ArrayRef Dict Num);
use Tropo::TypeLibrary qw(:all);

extends 'Tropo::WebAPI::Base';

Tropo::WebAPI::Base::register();

our $VERSION = 0.01;

has to              => ( is => 'ro', isa => StrOrStrArrayRef, required  => 1 );
has from            => ( is => 'ro', isa => Str,              predicate => 1 );
has answer_on_media => ( is => 'ro', isa => Bool,             predicate => 1 );
has timeout         => ( is => 'ro', isa => Num,              predicate => 1 );
has headers         => ( is => 'ro', isa => ArrayRef[Str],    predicate => 1 );  # TODO
has recording       => ( is => 'ro', isa => Recording,        predicate => 1 );
has allow_signals   => ( is => 'ro', isa => StrOrStrArrayRef, predicate => 1 );

has ['network', 'channel', 'name'] => (
    is        => 'ro',
    isa       => Str,
    predicate => 1,
);

sub BUILDARGS {
   my ( $class, @args ) = @_;
 
  unshift @args, "to" if @args % 2 == 1;
 
  return { @args };
}

1;
