
# Get my Bash prompt
source ~/.bash/prompt

source ~/.bash/paths
source ~/.bash/aliases
source ~/.bash/exports
source ~/.bash/functions

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Install direnv hook
if which direnv &> /dev/null; then
    eval "$(direnv hook bash)"
fi

# Enable PS1 modification for virtualenv+direnv
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV)) "
  fi
}
export -f show_virtual_env
# export DIRENV_LOG_FORMAT=
PS1='$(show_virtual_env)'$PS1

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add update_terminal_cwd method to bash profile to stop VS Code terminal from yelling
# from https://github.com/platformio/platformio-atom-ide-terminal/issues/196#issuecomment-391707383 and https://apple.stackexchange.com/a/139808
# Since this is defined in /etc/bashrc/, it won't be defined when running a shell in other apps, like VS Code - hence why we need it here
update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
}