package App::Beeminder::Hook;
use Dancer ':syntax';
use JSON::Any;

# ABSTRACT: Integrate Github and Beeminder

our $VERSION = '0.1';

# inspired by https://github.com/solgenomics/sgn-devtools/blob/master/git/github_post_receive

# This will eventually use WWW::Beeminder when that is ready, but for now, curl saves the day
any '/hook' => sub {
    my $p = param('payload');
    $p = JSON::Any->new->decode( $p );
};

true;
