# For ENV variables such as $PATH, use ~/.zshenv
# Everything else can go in here.

source ~/.zshenv
source ~/.zshenv.secrets

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(git zsh-syntax-highlighting)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# for arrow key up/down history search
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# For z to work
. /opt/homebrew/etc/profile.d/z.sh

# aliases!
alias als='nvim ~/.zshrc'
alias src='source ~/.zshrc && source ~/.zshenv'
alias ls='ls -ahlG'
alias rs='rails s'
alias rc='rails c'
alias k3000='kill -9 $(lsof -ti:3000)'

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

# Workplace-specific workflows
alias goodmorningut="git checkout main; git pull --prune; bundle install && yarn install --pure-lockfile && yarn install --check-files && yarn postinstall && bundle exec rake db:migrate db:test:prepare && git checkout db/structure.sql"
alias yout="goodmorningut"
alias sk="bundle exec sidekiq -C config/sidekiq.yml"
alias dbreset="bundle exec rake db:reset && bundle exec rake db:seed_convenience"
alias webpack="bin/webpack-dev-server"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(/opt/homebrew/bin/brew --prefix openssl@1.1)"
eval "$(/opt/homebrew/bin/brew shellenv)"

. "$HOME/.cargo/env"

# For ngrok
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh # Or run `brew info chruby` to find out installed directory
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh

# libpq is keg-only, which means it was not symlinked into /opt/homebrew,
# because conflicts with postgres formula.
# 
# If you need to have libpq first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc
# 
# For compilers to find libpq you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
# 
# For pkg-config to find libpq you may need to set:
#   export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"
