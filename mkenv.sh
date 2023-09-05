#!/bin/sh
ENV="$HOME/.mkenv"

case $1 in
"reset") 
        if rm -rf "$ENV" 2> /dev/null; then 
            echo "reset all entries"
        else 
            echo "$ENv was never created"
        fi
    ;;
"add")
        if mkdir "$ENV/$2" 2> /dev/null; then 
            cp -r "$3/." "$HOME/.mkenv/$2/." 2> /dev/null
            echo "created environment for $2 from $3"
        else 
            echo "entry already exists"
        fi
    ;;
"remove")
        if rm -rf "$ENV/$2"; then
            echo "removed $2 entry"
        else 
            echo "no entry exists for $2"
        fi    
    ;;
"init")
        if cp -r "$ENV/$2/." "$3/." ; then 
            echo "created environment for $2 in $3"
        else 
            echo "entry doesn't exist"
        fi
    ;;
"help")
        echo "mkenv - creates environment"
        echo "help - displays this message"
        echo "reset - resets the entire .mkenv"
        echo "add - adds a directory"
        echo "\tmkenv add <lang> <reference>"
        echo "remove - removes entry"
        echo "\tmkenv remove <lang>"
        echo "init - created the environment in the directory specified"
        echo "\tmkenv init <lang> <directory>"
        echo "Copyright 2023 xyve. 3-Clause BSD License."
    ;;
*) 
    if mkdir "$ENV" 2> /dev/null ; then 
        echo "created .mkenv directory in $HOME"
    else
        echo "found .mkenv directory in $HOME"
    fi
    ;;
esac
