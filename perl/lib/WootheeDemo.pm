package WootheeDemo;

use strict;
use warnings;

use JSON;
use Woothee;

use Kossy;

get '/' => sub {
    my ( $self, $c ) = @_;
    $c->redirect( $c->req->uri_for('/index.html') );
};

get '/parse' => sub {
    my ( $self, $c ) = @_;
    my $result = $c->req->validator([
        'ua' => { default => $c->req->user_agent, }
      ]);
    $c->render_json( Woothee->parse( $result->valid->get('ua') ) );
};

get '/api' => sub {
    my ( $self, $c ) = @_;
    my $result = $c->req->validator([
        'ua' => { default => $c->req->user_agent, }
      ]);
    my $data = +{
        version => $Woothee::VERSION,
        result => Woothee->parse( $result->valid->get('ua') )
      };
    $c->render_json($data);
};

1;
