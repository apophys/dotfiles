#!/bin/bash

function echoerr()
{
    local input="$@"
    cat 1>&2 <<< "$input";
}

DIR=$(pwd)
BACKUP_DIR=$HOME/.dotfiles_backup


DOTFILES="tmux.conf vimrc gitconfig zshrc ldapvirc Xdefaults"

function i3setup {
    echoerr "Installing i3 configuration files"

    I3CONF="$HOME/.config/i3/config"
    I3STATUS="$HOME/.config/i3status/config"

    if [ -e "$I3CONF" ] ; then
        mv $I3CONF "$BACKUP_DIR/i3-conf-backup"
    else
        mkdir -p "$HOME/.config/i3"
    fi
    ln -sf $(realpath i3-config) "$I3CONF"

    if [ -e "$I3STATUS" ] ; then
        mv $I3STATUS "$BACKUP_DIR/i3-status-backup"
    else
        mkdir -p "$HOME/.config/i3status"
    fi
    ln -sf $(realpath i3-status-config) "$I3STATUS"
}

function setup_wallpaper_scripts {
    echoerr "Installing wallpaper scripts"
    ln -sf $(realpath scripts/feh-wrapper) $HOME/.local/bin/feh-wrapper 
    ln -sf $(realpath scripts/reload-wallpaper) $HOME/.local/bin/reload-wallpaper 
}

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

i3setup
setup_wallpaper_scripts

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

