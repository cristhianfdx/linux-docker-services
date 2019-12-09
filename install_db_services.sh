# !/bin/bash
# Program to install database services with docker
# Author: Cristhian Forero

echo "Install database services"

if [ ! -f "~/.bash_aliases" ]; then
	sudo touch ~/.bash_aliases
fi

if [ ! -d "~/docker-services" ]; then
    sudo mkdir ~/docker-services
    sudo cp -r * ~/docker-services
fi

sudo chmod +x  ~/docker-services/databases_services.sh
echo "Installing..."
sleep 1
echo "alias db='cd ~/docker-services/ && ./databases_services.sh && cd'" >> ~/.bash_aliases
echo "alias cdb='cd ~/docker-services/'" >> ~/.bash_aliases
sleep 1
reset
