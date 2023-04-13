#!/usr/bin/env bash

python3 installers/get-pip.py

if ! grep -q PythonPip ~/.profile; then
{
	echo "# PythonPip"
	echo "export PATH=$HOME/.local/bin:$PATH"
} >> ~/.profile
fi

echo "Be sure to run: . ~/.profile "