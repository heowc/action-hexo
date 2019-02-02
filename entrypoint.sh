#!/bin/sh

set -e

git config --global user.name "$NAME"
git config --global user.email "$EMAIL"

sh -c "hexo $*"