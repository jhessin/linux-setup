#!/usr/bin/env bash
#
NODE_PATH=$(find /usr/local/lib/ -maxdepth 2 -name "node-*" -type d)

if [ ! -d "$NODE_PATH" ]; then
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf installers/node-*.tar.xz -C /usr/local/lib/nodejs
fi

if ! grep -q Nodejs ~/.profile; then
{
	NODE_PATH=$(find /usr/local/lib/ -maxdepth 2 -name "node-*" -type d)
	echo "# Nodejs"
	echo "export PATH=${NODE_PATH}/bin:$PATH"
} >> ~/.profile
fi

echo "Be sure to run: . ~/.profile "