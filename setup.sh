#!/bin/bash

# Echoing each step
echo "Starting setup..."

# Check for and install Homebrew
if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed. Skipping..."
fi

# Install Hack Nerd Font
echo "Installing Hack Nerd Font..."
FONT_DIR="$HOME/Library/Fonts"
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip -o "$FONT_DIR/Hack.zip"
unzip -o "$FONT_DIR/Hack.zip" -d "$FONT_DIR"
rm "$FONT_DIR/Hack.zip"

# Update Homebrew and install packages
echo "Updating Homebrew and installing packages..."
brew update
brew install yarn npm nvim rbenv tree the_silver_searcher fzf z python nvm openssl@1.1 libpq ripgrep
$(brew --prefix)/opt/fzf/install # Install shell extensions for fzf

# Copy .zshrc, .zshenv, and init.lua from your dotfiles repository
echo "Configuring zsh..."
for file in .zshrc .zshenv; do
    if [ -f "${HOME}/${file}" ]; then
        echo "Found existing ${file}, moving to ${file}.old"
        mv "${HOME}/${file}" "${HOME}/${file}.old"
    fi
    cp "./${file}" "${HOME}/${file}"
done

echo "Installing Karabiner-Elements..."

brew install --cask karabiner-elements
KARABINER_CONFIG_DIR="${HOME}/.config/karabiner"
KARABINER_CONFIG_FILE="${KARABINER_CONFIG_DIR}/karabiner.json"

mkdir -p "${KARABINER_CONFIG_DIR}"

# Check if Karabiner config file exists
if [ ! -f "${KARABINER_CONFIG_FILE}" ]; then
    echo "Karabiner-Elements config not found. Creating a default config file..."
    # Create a new default config file if it doesn't exist
    cp "./karabiner/karabiner.json" "${KARABINER_CONFIG_FILE}"
else
    echo "Karabiner-Elements config found, moving to karabiner.json.old"
    mv "${KARABINER_CONFIG_FILE}" "${KARABINER_CONFIG_FILE}.old"
    cp "./karabiner/karabiner.json" "${KARABINER_CONFIG_FILE}"
fi

echo "Karabiner-Elements setup complete."

echo "Configuring NVM & installing LTS Node..."
mkdir -p "${HOME}/.nvm"
nvm install --lts

echo "Installing Rosetta 2..."
softwareupdate --install-rosetta --agree-to-license

# Install global npm packages
echo "Installing eslint globally..."
npm install -g eslint

echo "Configuring nvim..."
echo "Creating virtual environment for nvim's python dependencies..."
/opt/homebrew/bin/python3 -m venv "${HOME}/.config/nvim/env"

echo "Installing pynvim..."
~/.config/nvim/env/bin/pip install pynvim

if [ -d "${HOME}/.config/nvim" ]; then
		echo "Found existing nvim directory, moving to nvim.old"
		mv "${HOME}/.config/nvim" "${HOME}/.config/nvim.old"
fi
cp -r "./nvim" "${HOME}/.config/nvim"

echo "Installing Rails environment..."
gem install bundler

# install all latest stable versions of ruby from rbenv install -l
LATEST_RUBY_VERSION=$(rbenv install -l | grep -v - | tail -1)
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)" rbenv install $LATEST_RUBY_VERSION
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)" rbenv install 3.3.0
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)" rbenv install 3.2.3
rbenv global 3.3.0
gem install bundler

# install rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Setup complete\!"
echo " "
echo "Be sure to configure iTerm2:"
echo "\u2022 Appearance settings"
echo "  \u2514\u2500 Windows: enable 'Hide scrollbars'"
echo "  \u2514\u2500 Tabs: enable 'Preserve window size when tab bar shows or hides' and 'Support basic HTML tags in tab titles'"
echo "  \u2514\u2500 Dimming: change dimming amount to 15 and enable 'Dim only text, not background'"
echo "\u2022 Profile settings"
echo "  \u2514\u2500 Colors: select 'Solarized Dark' in color presets"
echo "  \u2514\u2500 Text: use the Hack Nerd Font with regular weight, 13pt, letter spacing 100, line spacing 101 and enable 'Use ligatures'"
