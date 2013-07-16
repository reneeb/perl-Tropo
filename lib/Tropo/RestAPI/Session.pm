package Tropo::RestAPI::Session;

# ABSTRACT: Tropo session handling

use strict;
use warnings;

use Moo;
use XML::Simple;

extends 'Tropo::RestAPI::Base';

our $VERSION = 0.04;

sub create {
    my ($self, %param) = @_;
    
    if ( !defined $param{token} ) {
        return;
    }
    
    $param{action} = 'create';
    
    my $session_url = $self->url . 'sessions';
    my $response    = $self->get(
        $session_url,
        \%param,
    );
    
    if ( !$response ) {
        $self->err( 'Cannot connect to ' . $session_url );
        return;
    }
    
    if ( !$response->{success} ) {
        $self->err( $response->{reason} . ': ' . $response->{content} );
        return;
    }
    
    my $data = XMLin( $response->{content} );
    
    if ( $data->{success} ne 'true' ) {
        $self->err( 'Tropo session launch failed!' );
        return;
    }
    
    return $data;
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