#!/usr/bin/env bash
THEMES=$(dirname $(dirname "${BASH_SOURCE}"))/terminal
THEMES=$(cd $THEMES && pwd)

cwd=$(pwd)
cd $THEMES
for theme in *.terminal; do
    theme="${theme%.*}" # Strip extension
    theme="${theme// /\\ }" # Add backslash before spaces
    /usr/libexec/PlistBuddy -c "Delete :Window\ Settings:$theme" ~/Library/Preferences/com.apple.Terminal.plist 2> /dev/null
    /usr/libexec/PlistBuddy -c "Add :Window\ Settings:$theme dict" ~/Library/Preferences/com.apple.Terminal.plist
    /usr/libexec/PlistBuddy -c "Merge $theme.terminal :Window\ Settings:$theme" ~/Library/Preferences/com.apple.Terminal.plist
done
cd $cwd

defaults write com.apple.Terminal "Default Window Settings" -string "Dracula"
defaults write com.apple.Terminal "Startup Window Settings" -string "Dracula"
