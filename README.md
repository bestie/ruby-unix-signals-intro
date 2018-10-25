# An Introduction to Unix signals for Ruby

## What is this?

A few code samples with commentary from a short talk I did at
[Malmö Ruby User Group](http://malmorb.se) in October 2018.

The code samples should be read in sequence, starting with `0_default_behavior.rb`.

They explain the evolution of a simple Ruby program that handles signals.

The intention is for the reader to gain an understanding of the basics of
handing signals with Ruby.

If you have ideas about making this a more useful resource please send PRs and
open issues.

## What's covered

- How send signals
- How to receive and handle signals
- Some testing tips
- SIGINT
- SIGTERM
- SIGHUP
