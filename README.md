## What is this

This is a little shell script that will go through and attempt to download and install some command line utilities that I like to use, as well as some basic configuration.

It will install:

- homebrew
- yarn
- npm
- eslint globally via npm
- z (https://github.com/rupa/z)
- macvim
- rbenv
- tree (http://mama.indstate.edu/users/ice/tree/)
- ag (https://github.com/ggreer/the_silver_searcher)
- vundle

It will also *destructively* copy over your existing `~/.bash_profile` and `~/.vimrc`.

## Instructions

1. Maybe go install iTerm2 if you're into that.
1. Then open that up and run `sh ./setup.sh`.

## Some other things you may want to go get or setup manually

I really like *ShiftIt*, but getting the right version that supports thirds can be a bit annoying because you want a specific fork. This is the one you'll want: https://libraries.io/github/onsi/ShiftIt

I also really like switching over my caps lock key to be my ESC key when I tap it, and my CTRL key when I hold it. Karabiner (https://pqrs.org/osx/karabiner/) is really great for this. You'll want to install it and then get the recipe for that configuration separately from within the software, which is here: karabiner://karabiner/assets/complex_modifications/import?url=https%3A%2F%2Fpqrs.org%2Fosx%2Fkarabiner%2Fcomplex_modifications%2Fjson%2Fcaps_lock.json

Setup iTerm2 to use the solarized theme manually.
