weather() {
  local CITY=${1:-DaNang}
  curl -4 "wttr.in/$CITY"
}

# shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ce="cd ~/enviroments"
alias cmp="cd ~/my-projects"
alias cdl="cd ~/Downloads"


# normalize open to OSX-style
alias open="xdg-open"

# git
alias gr="git remote"
alias gra="git remote add"
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
alias gf="git fetch"

# sudo
alias s="sudo "
alias ss="sudo service "
