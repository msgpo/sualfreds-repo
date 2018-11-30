#!/bin/bash

if [ -e ~/.vim/colors/theme.vim ]; then
	rm ~/.vim/colors/theme.vim
	echo "Theme uninstalled"$'\n'
else
	echo "No theme installed"$'\n'
fi
