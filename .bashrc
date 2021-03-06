# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH="$PATH:~/.local/bin"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
. ~/.bash_aliases

# Using 'sudo' whith an alias
# The space following "sudo" tells bash to check if the command that follows the space is also an alias.
alias sudo='sudo '

# correction automatique des noms de fichiers et de répertoires
shopt -s cdspell

# $EDITOR
if which vim > /dev/null 2>&1; then
    export EDITOR="vim"
else
    if which nano > /dev/null 2>&1; then
        export EDITOR=nano
    fi
fi

# LESS F: quitte si le contenu fait moins d'un écran
# R: pour autoriser les séquences ANSI
# X: ne nettoie pas l'écran à la sortie
# I: insensible à la casse
LESS="-FRXI"

man ()
# some colors in man pages
{
    env \
    LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
    LESS_TERMCAP_md="$(printf "\e[1;31m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[1;32m")" man "$@"
}

# Gestion de l'historique    ~~~~~~~~~~~~~~~~~~~~~~~~

# the number of commands to remember in the command history
export HISTSIZE=-1

# the maximum number of lines contained in the history file
export HISTFILESIZE=100000

# append commands to the history file
shopt -s histappend

# Store Bash History Immediately
PROMPT_COMMAND='history -a'

# use both 'ignorespace' and 'ignoredups'
# eliminate duplicates across the whole history
HISTCONTROL="ignoreboth:erasedups"

# Ignore Specific Commands
HISTIGNORE="ls:history:alf:cd:fg"

# supprimer les doublons
# sort -u ~/.bash_history > ~/.bash_history.tmp ; mv ~/.bash_history.tmp ~/.bash_history

# Store multi-line commands in one history entry
shopt -s cmdhist

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# readline settings    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ignore case for auto completion
bind "set completion-ignore-case on"
# show directly completion results after first TAB
bind "set show-all-if-unmodified on"
# limit what is shown for completion (hide prefix bigger than 2 char)
#bind "set completion-prefix-display-length 2"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

############# Perso #############

# ranger
RANGER_LOAD_DEFAULT_RC=false

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# liquidprompt
source liquidprompt/liquidprompt
export TERM=rxvt-256color
