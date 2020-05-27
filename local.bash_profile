# source ~/.profile
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# for arrow key up/down history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# for node
export NODE_OPTIONS="--max-old-space-size=4096"

# For rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Show dirty state in prompt when in Git repos
export GIT_PS1_SHOWDIRTYSTATE=1

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[95m\]\$(parse_git_branch)\[\033[00m\] $ "

# For z to work
. /usr/local/etc/profile.d/z.sh

# aliases!
alias als='vim ~/.bash_profile'
alias src='source ~/.bash_profile'
alias ls='ls -ahlG'
alias rs='rails s'
alias rc='rails c'

# docker aliases
alias dockerboom='docker system prune -a; docker rmi $(docker images -a -q); docker volume prune'
alias dcr='docker-compose restart'

# git aliases
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
alias accio='git pull'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias brb='git add -A && gcm "WIP" && gco develop'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias mstr='git checkout develop'
alias grm='git rebase develop'
alias shit='!CURRENT=$(git rev-parse --abbrev-ref HEAD) && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
alias pull='git pull'

export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.gitignore --nocolor -g ""'

fbr() {
  git fetch
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf +s +m -e) &&
  git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}

# # usertesting aliases
alias goodmorning="git checkout master; git pull --prune; bundle install && yarn install --pure-lockfile && yarn install --check-files && yarn postinstall && bundle exec rake db:migrate db:test:prepare && git checkout db/structure.sql"
alias yo="goodmorning"
alias sk="bundle exec sidekiq -C config/sidekiq.yml"
alias dbreset="bundle exec rake db:reset && bundle exec rake db:seed_convenience"
alias webpack="bin/webpack-dev-server"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
