
# Authenticate the session
sudo echo > /dev/null

# initialize home directory first, as this includes installing brew/cask, which
# in turn

bash $(dirname $BASH_SOURCE)/home.sh
bash $(dirname $BASH_SOURCE)/applications.sh
bash $(dirname $BASH_SOURCE)/macos.sh
# bash $(dirname $BASH_SOURCE)/sublime.sh
bash $(dirname $BASH_SOURCE)/terminal.sh
