package App::Beeminder::Hook;
use Dancer ':syntax';
use JSON::Any;
use feature 'say';
use autodie;
use Data::Dumper;

# ABSTRACT: Integrate Github and Beeminder

our $VERSION = '0.1';

# inspired by https://github.com/solgenomics/sgn-devtools/blob/master/git/github_post_receive

# This will eventually use WWW::Beeminder when that is ready, but for now, curl saves the day
any '/hook' => sub {
    my $p = param('payload');

    unless ($p) {
        my $response = JSON::Any->encode( { success => 0 } );
        return $response;
    }

    $p = JSON::Any->new->decode( $p );

    debug(Dumper($p));

    my $repo_name   = $p->{repository}{name};
    my $num_commits = @{$p->{commits}};

    my $day_of_month = (localtime(time))[3];

    my $cmd=<<CMD;
curl -d 'origin=%s&datapoints_text=%s %s "%s"&sendmail=0' %s/%s/goals/%s/datapoints/create_all
CMD

    $cmd = sprintf($cmd, config->{beeminder_username},
        $day_of_month,
        $num_commits,
        $repo_name, # optional comment
        config->{beeminder_api_url},
        config->{beeminder_username},
        config->{beeminder_goal},
    );
    debug "Running: $cmd";
    system $cmd;

    my $response = JSON::Any->encode( { success => 1 } );
};

get '/' => sub {
    'This is App::Beeminder::Hook';
};

true;
