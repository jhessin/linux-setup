#!/usr/bin/env bash

sudo apt install build-essential libreadline-dev unzip -y

dir=$(mktemp -d)

pushd "$dir" || exit

# install lua
curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
tar -zxf lua-5.3.5.tar.gz
cd lua-5.3.5 || exit
make linux test
sudo make install

# install luarocks
wget https://luarocks.org/releases/luarocks-3.9.2.tar.gz
tar zxpf luarocks-3.9.2.tar.gz
cd luarocks-3.9.2 || exit
sh configure --with-lua-include=/usr/local/include && make && sudo make install

popd || exit
rm -rf "$dir"

sudo luarocks install tl
sudo luarocks install cyan