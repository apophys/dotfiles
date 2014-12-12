#!/bin/bash

function echoerr()
{
    local input="$@"
    cat 1>&2 <<< "$input";
}

DIR=$(pwd)

echoerr "Starting to create symlinks to directory [$HOME]."

echoerr "Installing .tmux.conf."
if [ -f $HOME/.tmux.conf ]; then
    rm $HOME/.tmux.conf
fi
ln -s $DIR/tmux.conf $HOME/.tmux.conf

echoerr "Installing .vimrc."
if [ -f $HOME/.vimrc ]; then
    rm $HOME/.vimrc
fi
ln -s $DIR/vimrc $HOME/.vimrc

echoerr "Installing .gitconfig."
if [ -f $HOME/.gitconfig ]; then
    rm $HOME/.gitconfig
fi
ln -s $DIR/gitconfig $HOME/.gitconfig

echoerr "Installing .zshrc."
if [ -f $HOME/.zshrc ]; then
    rm $HOME/.zshrc
fi
ln -s $DIR/zshrc $HOME/.zshrc

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

echoerr "Installing .ldapvirc."
if [ -f $HOME/.ldapvirc ]; then
    rm $HOME/.ldapvirc
fi
ln -s $DIR/ldapvirc $HOME/.ldapvirc

echoerr "Symlinks created."

