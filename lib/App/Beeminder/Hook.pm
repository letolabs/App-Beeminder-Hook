package App::Beeminder::Hook;
use Dancer ':syntax';
use JSON::Any;

# ABSTRACT: Integrate Github and Beeminder

our $VERSION = '0.1';

# inspired by https://github.com/solgenomics/sgn-devtools/blob/master/git/github_post_receive

any '/hook' => sub {
    my $payload = param('payload');
};

true;
