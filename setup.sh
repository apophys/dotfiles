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

echoerr "Symlinks created."

