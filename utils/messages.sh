#!/usr/bin/env bash
[[ ! ${DOTFILES_DIR} ]] && >&2 echo -e "\033[31mThis script is not intended to be run directly!\033[0m" && exit 1


function warning {
  >&2 printf "\033[33mWARNING\033[0m: $@\n" 
}

function error {
  >&2 printf "\033[31mERROR\033[0m: $@\n"
}

function fatal {
  error "$@"
  exit -1
}

function success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

function :: {
  echo
  echo "==> [$(date +%H:%M:%S)] $@"
}