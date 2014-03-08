package Tropo::WebAPI::RecordingBase;

use strict;
use warnings;

use Moo;
use Types::Standard qw(Str);

extends 'Tropo::WebAPI::Base';

Tropo::WebAPI::Base::register();

has url => ( is => 'ro', isa => Str, required 1);

has [qw/format method username password transcriptionEmailFormat transcriptionID transcriptionOutURI/] => (
    is  => 'ro',
    isa => Str,
);

sub BUILDARGS {
   my ( $class, @args ) = @_;

  unshift @args, "url" if @args % 2;

  return { @args };
}

1;
