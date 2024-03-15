# exported variables, such as $PATH
# for aliases, functions, options, key bindings, etc use ~/.zshrc

# Homebrew sqlite3
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# For compilers to find sqlite you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

# For pkg-config to find sqlite you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"

# Hide Homebrew hints
export HOMEBREW_NO_ENV_HINTS=1

# For pynvim

# Hide that we're in a python virtualenv since we're automatically activating it for nvim
# export VIRTUAL_ENV_DISABLE_PROMPT=1
# source ~/.config/nvim/venv/bin/activate
