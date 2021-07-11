#!/bin/bash

YELLOW="\e[33;1m";
ENDCOLOR="\e[0m";

BINLINK="/usr/bin/pomodorotimer"
OPTFOLDER="/opt/pomodorotimer"

if [[ -d "$OPTFOLDER" ]]
then
	echo -e "${YELLOW}Warning: ${ENDCOLOR}$OPTFOLDER exists. Removing..."
	sudo rm -r "$OPTFOLDER"
fi;

sudo mkdir /opt/pomodorotimer

shopt -s extglob
sudo cp -r !("install.sh") /opt/pomodorotimer
shopt -u extglob

if [[ -f "$BINLINK" ]]
then
	echo -e "${YELLOW}Warning: ${ENDCOLOR}$BINLINK exists. Removing..."
	sudo rm "$BINLINK"
fi;

sudo ln -s /opt/pomodorotimer/pomodorotimer /usr/bin/pomodorotimer
