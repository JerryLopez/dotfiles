#!/usr/bin/env bash
[[ ! ${DOTFILES_DIR} ]] && >&2 echo -e "\033[31mThis script is not intended to be run directly!\033[0m" && exit 1

## load usage info for the given command falling back on default usage text
if [[ -f "${DOTFILES_DIR}/commands/${DOTFILES_COMMAND}.help" ]]; then
  source "${DOTFILES_DIR}/commands/${DOTFILES_COMMAND}.help"
else
  source "${DOTFILES_DIR}/commands/usage.help"
fi

echo -e "${DOTFILES_USAGE}"
exit 1