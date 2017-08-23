#!/bin/zsh
# adds a file to all folder in pwd
# filestofolders.sh test.txt


for f in *;
  do
    [ -d $f ] && cd "$f" && touch "$1"
  done;
