#!/bin/bash

function echoerr()
{
    local input="$@"
    cat 1>&2 <<< "$input";
}

DIR=$(pwd)
BACKUP_DIR=$HOME/.dotfiles_backup


DOTFILES="tmux.conf vimrc gitconfig zshrc ldapvirc Xdefaults"


if [[ ! -d $BACKUP_DIR ]] ; then
    mkdir $BACKUP_DIR
fi



echoerr "Starting to create symlinks to directory [$HOME]."

for CONFIG_FILE in $DOTFILES; do
    echoerr "Installing [$CONFIG_FILE]"

    CURRENT_FILE="$HOME/.${CONFIG_FILE}"
    if [[ -f "$CURRENT_FILE" ]] ; then
        # this should work even for symlinks
        mv "$CURRENT_FILE" "$BACKUP_DIR/$CONFIG_FILE"
    fi
   ln -s "$DIR/$CONFIG_FILE" "$CURRENT_FILE"
done


if [ ! -d $HOME/.oh-my-zsh ]; then
    echoerr "Cloning oh-my-zsh"
    pushd ~
    git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
    popd

    echoerr "============================================================================"
    echoerr "Please, clone oh-my-zsh and modify it to contain submodules to used plugins."
    echoerr "Also, use symlinks in the home directory."
    echoerr "============================================================================"
fi
# TODO: submodule + symlink

echoerr "Symlinks created."

