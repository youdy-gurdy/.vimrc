#!/bin/sh

alias ls='ls -alFG'
function cdls() {
    \cd $1;   #avoid recursion
    ls;
}
alias cd=cdls

alias nviminit='nvim ~/dotfiles/.config/nvim/init.vim'

alias gb='git branch'
alias gdh='git diff HEAD'
alias gdnh='git diff --name-only HEAD'
alias glog='git log --pretty=oneline --abbrev-commit'
alias gcom='git checkout master'


alias nvimtex='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'
alias lstex='ls *.{tex,pdf}'

alias python='python3'
