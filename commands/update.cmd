#!/usr/bin/env bash
[[ ! ${DOTFILES_DIR} ]] && >&2 echo -e "\033[31mThis script is not intended to be run directly!\033[0m" && exit 1

export ZSH="${DOTFILES_DIR}/files"

cd $ZSH

source "${DOTFILES_DIR}/utils/install.sh"

:: Configuring MacOS defaults
$ZSH/macos/set-defaults.sh

:: Updating Homebrew
brew update

:: Installing homebrew packages
brew bundle --force || true

:: Running topic install scripts
find $ZSH -name install.sh | while read installer ; do sh -c "${installer}" ; done