package Tropo::RestAPI::Session;

# ABSTRACT: Tropo session handling

use strict;
use warnings;

use Moo;
use XML::Simple;

extends 'Tropo::RestAPI::Base';

our $VERSION = 0.01;

sub create {
    my ($self, %param) = @_;
    
    if ( !defined $param{token} ) {
        return;
    }
    
    $param{action} = 'create';
    
    my $response = $self->ua->get(
        $self->url,
        \%param,
    );
    
    if ( $response ) {
        $self->err( 'Cannot connect to ' . $self->url );
        return;
    }
    
    if ( !$response->{success} ) {
        $self->err( $response->{reason} );
        return;
    }
    
    my $data = XMLin( $response->{content} );
    
    if ( $data->{success} ne 'true' ) {
        $self->err( 'Tropo session launch failed!' );
        return;
    }
}

=head1 SYNOPSIS

    use Tropo::RestAPI::Session;
    
    my $session_object = Tropo::RestAPI::Session->new;
    my $tropo_session  = $session_object->create(
        token => $token,
        # more optional params
    ) or die $session_object->err;

=cut

1;