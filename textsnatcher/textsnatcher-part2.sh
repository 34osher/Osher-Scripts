#!/bin/bash
echo "Code written by : Eliran Ben Maor"
echo "Last update: 27/11/2023"
echo "Last time checked: 27/11/2023 by: Eliran"

echo "##################### Downloading textsnatcher ######################"
flatpak install flathub com.github.rajsolai.textsnatcher -y

echo "##################### Done ######################"
flatpak run com.github.rajsolai.textsnatcher -y


echo " The program should start  "
echo " The program is runing? "

read answer
if [ $answer == "y" ] || [ $answer == "Y" ] ; then
    echo "Great!! Enjoy :) "
else
    sudo apt install gnome-screenshot -y
    echo "now it should work!"
    flatpak run com.github.rajsolai.textsnatcher -y
fi
