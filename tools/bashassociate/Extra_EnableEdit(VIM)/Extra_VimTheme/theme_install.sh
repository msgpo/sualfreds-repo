#!/bin/bash

mkdir -p ~/.vim/colors/
if [ ! -e ~/.vim/colors/theme.vim ]; then
	message_success="Theme installed"
else
	message_success="Theme replaced"
fi

if [ -e ./theme.vim ]; then
	cp theme.vim ~/.vim/colors/
	echo $message_success$'\n'
else
	echo "File 'theme.vim' not found"$'\n'
fi
