#!/bin/bash

installedPackages=()

which -s brew
if [[ $? != 0 ]] ; then
	echo "Installing Homebrew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	installedPackages+=(`brew`)
else
	echo "Updating Homebrew."
	brew update
fi

which -s yarn
if [[ $? != 0 ]] ; then
  echo "Installing yarn..."
  brew install yarn
  installedPackages+=(`yarn`)
else
  echo "yarn already installed."
fi

which -s npm
if [[ $? != 0 ]] ; then
  echo "Installing npm..."
  brew install npm
  installedPackages+=(`npm`)
else
  echo "npm already installed."
fi

npm i eslint --global

which -s z
if [[ $? != 0 ]] ; then
	echo "Installing z..."
	brew install z
	installedPackages+=(`z`)
else
	echo "z already installed."
fi

which -s mvim
if [[ $? != 0 ]] ; then
	echo "Installing mvim..."
	brew install macvim
	brew link macvim
	installedPackages+=(`mvim`)
else
	echo "mvim already installed."
fi

which -s tree
if [[ $? != 0 ]] ; then
	echo "Installing tree..."
	brew install tree
	installedPackages+=(`tree`)
else
	echo "tree already installed."
fi

which -s ag
if [[ $? != 0 ]] ; then
	echo "Installing ag..."
	brew install the_silver_searcher
	installedPackages+=(`ag`)
else
	echo "ag already installed."
fi

if [ ! -f ~/.vim/bundles/Vundle.vim ] ; then
	echo "Installing vundle..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	installedPackages+=(`vundle`)
else
	echo "vundle already installed."
fi

if [ ! -f ~/.vimrc ] ; then
	echo "Coping over .vimrc file..."
	cp ./local.vimrc ~/.vimrc
  vim +PluginInstall +qall
  mkdir ~/.vim/colors
  cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
	installedPackages+=(`.vimrc file`)
else
	echo "~/.vimrc already exists, skipping."
fi

if [ ! -f ~/.git-completion.bash ] ; then
	echo "Enabling git branch autocompletion..."
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
	cp ./local.vimrc ~/.vimrc
	chmod -X ~/.git-completion.bash
	installedPackages+=(`git branch autocomplete`)
else
	echo "git branch autocomplete already installed."
fi

if [ ! -f ~/.bash_profile ] ; then
	echo "Coping over .bash_profile file..."
	cp ./local.bash_profile ~/.bash_profile
	installedPackages+=(`.bash_profile file`)
else
	echo "~/.bash_profile already exists, skipping."
fi

echo "Installed:"
for update in "${installedPackages[@]}"
do
	echo $update
done

echo "Have a great day!"
