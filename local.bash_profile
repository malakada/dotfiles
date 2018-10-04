# source ~/.profile
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# for arrow key up/down history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# For rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Show dirty state in prompt when in Git repos
export GIT_PS1_SHOWDIRTYSTATE=1

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# export PS1="\[\033[39m\]\u | \d \A \[\033[32m\]\w\[\033[95m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\[\033[32m\]\w\[\033[95m\]\$(parse_git_branch)\[\033[00m\] $ "

# For z to work
. /usr/local/etc/profile.d/z.sh

# aliases!
alias als='vim ~/.bash_profile'
alias src='source ~/.bash_profile'
alias ls='ls -ahlG'
alias rs='rails s'
alias rc='rails c'

# # docker aliases
alias dockerboom='docker system prune -a; docker rmi $(docker images -a -q); docker volume prune'
alias dcr='docker-compose restart'

# # git aliases
alias gs='git status'
alias gl='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gap='git add -p'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias psh='git push'
alias pshf='git push -f'
alias pll='git pull'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias brb='git add -A && gcm "WIP" && gco master'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias mstr='git checkout master'
