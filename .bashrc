# ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
export LESS="-iMFXR"
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab

# must press ctrl-D 2+1 times to exit shell
#export IGNOREEOF="2"

# allow ctrl-S for history navigation (with ctrl-R)
stty -ixon
#use extra globing features. See man bash, search extglob.
shopt -s extglob
#include .files when globbing.
shopt -s dotglob
#When a glob expands to nothing, make it an empty string instead of the literal characters.
shopt -s nullglob
# fix spelling errors for cd, only in interactive shell
shopt -s cdspell
# vi mode
set -o vi
shopt -s autocd
export HISTFILESIZE=20000
export HISTSIZE=10000
export EDITOR=nvim
shopt -s histappend
shopt -s checkwinsize
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
HISTCONTROL=ignoreboth
# commands with leading space do not get added to history
HISTCONTROL=ignorespace
export HISTIGNORE="&:ls:[bf]g:exit"
export GREP_OPTIONS='--color=auto'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border fd --type f'
alias fzfp="fzf --preview='bat --color=always --style=numbers --theme OneHalfDark {}' --preview-window=down"
# ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
## Safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias ..='cd ..'
## Modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
#lasy commands
alias nv='nvim'
alias q='exit'
alias c='clear'
#config files
alias brc='nvim ~/.bashrc'
alias nrc='cd ~/.config/nvim/'
alias reload='source ~/.bashrc'
# Git related
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'
# Git
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_SHOWUNTRACKEDFILES='y'
GIT_PS1_DESCRIBE_STYLE='contains'
GIT_PS1_SHOWUPSTREAM='auto'
source /data/data/com.termux/files/usr/etc/bash_completion.d/git-prompt.sh
#source ~/.config/bash/git-prompt.sh
rightprompt()
{
  printf "\e[38;5;141;1m%*s" $COLUMNS "¯\\_(ツ)_/¯"
}

PS1='\[$(tput sc; rightprompt; tput rc)\]'
PS1=$PS1"\e[38;5;196;1mabbas\e[0m\e[38;5;33;2m@\e[0m\e[38;5;255;1m\h\e[0m\e[38;5;203;1m"
PS1=$PS1'$(__git_ps1)'
PS1=$PS1"\e[0m\e[38;5;201;1m : \w\e[0m\n"
PS1=$PS1"°×•> "
