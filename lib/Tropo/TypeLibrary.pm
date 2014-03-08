package Tropo::TypeLibrary;

# ABSTRACT: All (non-standard) types needed for the Tropo client

use strict;
use warnings;

use Type::Library
    -base,
    -declare => qw/
        OptionalStr OptionalInt
    /;
use Type::Tiny;
use Types::Standard -types;
use Type::Utils -all;

use Tropo::WebAPI::RecordingBase;

our $VERSION = '0.01';

class_type Recording => { class => "Tropo::WebAPI::RecordingBase" };

# create some basic types
{
    declare OptionalStr => as union[ Undef, Str ];
    declare OptionalInt => as union[ Undef, Int ];
}

{
    declare StrOrStrArrayRef => as union[ Str, ArrayRef[Str] ];
}

declare RecordingHash => as Dict[
    url                      => Str,
    method                   => Optional[Str],
    format                   => Optional[Str],
    username                 => Optional[Str],
    password                 => Optional[Str],
    transcriptionEmailFormat => Optional[Str],
    transcriptionId          => Optional[Str],
    transcriptionOutURI      => Optional[Str],
];

coerce Recording =>
    from RecordingHash => via { Tropo::WebAPI::RecordingBase->new( %{$_} );

1;
