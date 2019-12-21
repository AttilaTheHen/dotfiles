#!/usr/bin/env bash

source $(dirname $BASH_SOURCE)/logging.sh

info "› Running softwareupdate..."
sudo softwareupdate -i -a


if hash brew 2> /dev/null; then
    info "› Homebrew is already installed. Updating..."
    brew update
    brew upgrade
else
    info "› Homebrew is not installed. Installing..."
    yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

info "› Updating homebrew applications..."
cd && brew bundle
brew bundle cleanup
