#!/bin/bash
# Script de instalacion de geth y dependencias en Ubuntu base distros
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum
