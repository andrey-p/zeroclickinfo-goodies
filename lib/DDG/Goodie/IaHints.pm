package DDG::Goodie::IaHints;

# ABSTRACT: Write an abstract here

use DDG::Goodie;
use strict;

zci answer_type => 'ia_hints';

zci is_cached => 1;

# Define a regex that matches for each query hint
# For plain strings it must match the entire query unless explicitly 
my %iahints = (
    'news' => 'obama news',
    
    '.*air quality.*' => 'air quality 33434',
    '.*air pollution.*' => 'air pollution 33434',
    
    '(iphone|ipad|android) apps' => 'productivity apps',
    
    'gifs' => 'cat gifs',
    
    'bitcoin rate' => 'bitcoin usd',
    
    '.*base64.*' => 'base64 encode foo',
    
    '(english )?dictionary' => 'define obsequious',
    
    'fedex' => 'Fedex 9241990100130206401644',
    'fedex.com' => 'Fedex 9241990100130206401644',
    'fedex tracking' => 'Fedex 9241990100130206401644',
    
    'ups' => 'UPS 1Z2807700371226497',
    'ups.com' => 'UPS 1Z2807700371226497',
    'ups tracking' => 'UPS 1Z2807700371226497',
);

# join them into a massive regex that we use for triggers
my $re = '^('.join('|', keys(%iahints)).')$';

triggers query_lc => qr/$re/;

# Handle statement
handle matches => sub {
    my $match = $_;
    my $suggestion;

    # check which of the regexes we matched to get the query hint
    while (my ($key, $val) = each %iahints) {
        if ($match =~ /$key/) {
            $suggestion = $val;
        }
    }

    return unless $suggestion;

    return "See what happens when you search for \"$suggestion\"",
        structured_answer => {

            id => 'ia_hints',

            name => 'Productivity',

            data => {
                sample_query => $suggestion
            },

            templates => {
                group => "text",
                options => {
                    title_content => "DDH.ia_hints.title"
                }
            }
        };
};

1;
