# exported variables, such as $PATH
# for aliases, functions, options, key bindings, etc use ~/.zshrc

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

################
# PATH exports #
################

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Homebrew sqlite3
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# For rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# PostgreSQL
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# NVM
export PATH="/opt/homebrew/opt/nvm:$PATH"

#################
# Configuration #
#################

# For compilers to find sqlite you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

# For pkg-config to find sqlite you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"

# Hide Homebrew hints
export HOMEBREW_NO_ENV_HINTS=1

# Recommended NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# for node
export NODE_OPTIONS="--max-old-space-size=4096"

# Ruby & Rails related
export GEM_HOME="$HOME/.gem"

# Rust
. "$HOME/.cargo/env"

# Use ag for fzf
export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.gitignore --nocolor -g ""'