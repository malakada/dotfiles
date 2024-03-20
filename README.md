# dotfiles

These dotfiles are hyper-specific to my personal dev environment. If it's helpful for you to copy/modify then awesome, but if not no worries. :)

It installs essential tools and applications such as:

* Hack Nerd Font Mono
* Homebrew
* Karabiner-Elements
* Neovim
* Yarn
* ag (the_silver_searcher)
* eslint
* fd
* fzf
* npm
* pynvim
* rbenv
* ripgrep
* Rosetta 2 (for M1 Macs)
* tree
* z

Additionally, it configures zsh and nvim by copying pre-defined configuration files from this repository (non-destructively).

When you set up Rust, just use the default settings. You may need to remove an extraneous path value that it adds to `./zshenv`.

## Prerequisites

- macOS operating system
- Command Line Tools for Xcode: Install by running `xcode-select --install` in your terminal if you haven't already.

## Installation

1. **Clone the Repository**: First, clone this repository to your local machine:

    ```bash
    git clone git@github.com:malakada/dotfiles.git
    cd dotfiles
    ```

2. **Run the Setup Script**: Execute the setup script with:

    ```bash
    ./setup.sh
    ```

    It'll tell you what it's doing along the way. :)

## Manual Configuration Steps

Some configurations cannot be automated through the script and require manual steps. Helper text is included in the script output to guide you through these steps.

### iTerm2

- **Font Configuration**: Manually set iTerm2 to use Hack Nerd Font Mono, weight Regular, size 13, and line height value of 101 through iTerm2's preferences (`iTerm2 > Preferences > Profiles > Text > Font`).

- **Color Scheme**: Set iTerm2's color preset to Solarized Dark via `iTerm2 > Preferences > Profiles > Colors > Color Presets`.

- **Appearance options**: Enable 'Hide scrollbars' in `iTerm2 > Preferences > Appearance > Windows`. Also, enable 'Preserve window size when tab bar shows or hides' and 'Support basic HTML tags in tab titles' in `iTerm2 > Preferences > Appearance > Tabs`.
