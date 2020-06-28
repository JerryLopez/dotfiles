#!/usr/bin/env bash
[[ ! ${DOTFILES_DIR} ]] && >&2 echo -e "\033[31mThis script is not intended to be run directly!\033[0m" && exit 1

DOTFILES_ROOT="$DOTFILES_DIR/files"

cd "${DOTFILES_ROOT}"

source "${DOTFILES_DIR}/utils/install.sh"
source "${DOTFILES_DIR}/utils/messages.sh"

if ! [ -f "${DOTFILES_ROOT}/git/gitconfig.local.symlink" ]
then
  :: 'Setting up git configuration'

  git_credential='cache'
  if [ "$(uname -s)" == "Darwin" ]
  then
    git_credential='osxkeychain'
  fi

  :: ' - What is your github author name?'
  read -e git_authorname
  
  :: ' - What is your github author email?'
  read -e git_authoremail

  sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" $DOTFILES_ROOT/git/gitconfig.local.symlink.example > $DOTFILES_ROOT/git/gitconfig.local.symlink

  success 'gitconfig'
fi

if test ! $(which brew)
then
    :: "Installing Homebrew for you."
    
    # Install the correct homebrew for each OS type
    if test "$(uname)" = "Darwin"
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    fi
fi

installDotfiles
dotfiles update
