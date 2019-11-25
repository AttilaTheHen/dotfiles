#!/usr/bin/env bash

# Enable nvm
source /usr/local/opt/nvm/nvm.sh

# Install node via nvm, then check to make sure it's the right version
nvm install node
which node