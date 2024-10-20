#!/usr/bin/env sh

set -o errexit

RELDIR=$(dirname "$0")
BASEDIR=$(readlink -f "$RELDIR")

ln -fs "$BASEDIR/.bash_aliases" "$HOME/.bash_aliases"
ln -fs "$BASEDIR/.tmux.conf" "$HOME/.tmux.conf"
ln -fs "$BASEDIR/.xsession" "$HOME/.xsession"
