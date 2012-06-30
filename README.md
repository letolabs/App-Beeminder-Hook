# App::Beeminder::Hook - Hook up Github to Beeminder

This is a dead-simple Dancer app that eats Github post-receive hook JSON and
submits it to the awesome [Beeminder](http://beeminder.com) API.

# Why the hell would I want to use this?

There is an interesting movement called the "quantified self". Basically:
measure everything! Everybody is interested in measuring different things.

# How Do I use this?

 * Go to [Beeminder](http://beeminder.com) and create a free account
 * Create a new goal with a type of "Do More"
 * Change the beeminder* config values in config.yml to match your username and goal name. Set your origin to "$username_api"

    git clone git://github.com/letolabs/App-Beeminder-Hook.git
    cd App-Beeminder-Hook

 * Install dependencies with cpan or better yet, cpanm:

    cpanm Dancer YAML JSON::Any

 * Or with Dist::Zilla

    dzil listdeps | cpanm

 * Start this dancer app via

    perl bin/app.pl --port 5000

 * (Port 5000 is just an example. Run it on any port you want).
 * Add a post-receive hook to any Github repo you want to keep track of. For instance, if the hostname of your app is "foo.com", set you post receive URL to:

    http://foo.com:5000/hook

# Requirements

 * Perl 5.10 or higher
 * [Dancer](http://perldancer.org)
 * curl

# Thanks

Thanks to Daniel Reeves and Bethany Soule for making Beeminder! It rocks.

# Author

Jonathan "Duke" Leto
