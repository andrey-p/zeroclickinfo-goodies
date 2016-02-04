package DDG::Goodie::HintsFrontend;

use DDG::Goodie;
use strict;

zci answer_type => 'hints_frontend';

zci is_cached => 1;

triggers any => 'hintsfrontend';

# Handle statement
handle remainder => sub {

    my $remainder = $_;

    return "See what happens when you search for \"" . "air quality 33434" . "\"", # Will be dynamic/mapped to the corresponding hint,
        structured_answer => {

            id => 'hints_frontend',

            # Name - Used for Answer Bar Tab
            # Value should be chosen from existing Instant Answer topics
            # see http://docs.duckduckhack.com/frontend-reference/display-reference.html#name-string-required
            name => 'Productivity',

            data => {
                sample_query => "air quality 33434", # Will be dynamic/mapped to the corresponding hint
            },
            
            templates => {
                group => "text",
                options => {
                    title_content => "DDH.hints_frontend.title"
                }

            }
        };
};

1;
