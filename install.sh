#!/usr/bin/env bash

echo -e "\e[1;36mUpdating packages\e[0m"
sudo apt-get update -y

echo -e "\e[1;36mInstalling dependencies\e[0m"
sudo apt-get install libreadline-dev libssl-dev lua5.2 luarocks liblua5.2-dev git make unzip redis-server curl libcurl4-gnutls-dev -y
    
echo -e "\e[1;36mInstalling rocks\e[0m"
sudo luarocks install luasocket
sudo luarocks install luasec
sudo luarocks install redis-lua
sudo luarocks install lua-term
sudo luarocks install serpent
sudo luarocks install dkjson
sudo luarocks install lanes
sudo luarocks install Lua-cURL
    
echo -e "\e[1;32mSuccessfully installed!, change values in config file and run ./launch.sh\e[0m"
