#!/usr/bin/env bash

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

# Install node via nvm, then check to make sure it's the right version
nvm install node
which node