#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => "ia_hints";
zci is_cached   => 1;

ddg_goodie_test(
    [qw( DDG::Goodie::IaHints )],
    # At a minimum, be sure to include tests for all:
    # - primary_example_queries
    # - secondary_example_queries
    'how do I base64 encode something' => test_zci(
        'See what happens when you search for "base64 encode foo"',
        structured_answer => {

            id => 'ia_hints',

            name => 'Productivity',

            data => {
                sample_query => "base64 encode foo"
            },

            templates => {
                group => "text",
                options => {
                    title_content => "DDH.ia_hints.title"
                }
            }
        }
    ),
    'gifs' => test_zci(
        'See what happens when you search for "cat gifs"',
        structured_answer => {

            id => 'ia_hints',

            name => 'Productivity',

            data => {
                sample_query => "cat gifs"
            },

            templates => {
                group => "text",
                options => {
                    title_content => "DDH.ia_hints.title"
                }
            }
        }
    ),
    'cat gifs' => undef,
);

done_testing;
