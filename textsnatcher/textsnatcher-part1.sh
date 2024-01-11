#!/bin/bash
echo "Code written by : Eliran Ben Maor"
ehco "Last update: 04/09/2023"
echo "Last time checked: 04/09/2023 by: Eliran"

echo "########## Downloading flatpak #############"
sudo apt install -y flatpak

echo "########## Downloading gnome-software and other plugins #############"
sudo apt install -y gnome-software
sudo apt install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "################ Need to reboot the system ##################"
echo "############# Do you want to reboot now? ###############"
echo " y for Yes and n for No"
read answer

if [ $answer == "y" ] || [ $answer == "Y" ] ; then
    echo "############### Don't forget to run the part 2 after reboot ##########################"
    echo "############### Don't forget to run the part 2 after reboot ##########################"
    echo "############### Don't forget to run the part 2 after reboot ##########################"
    echo "############### Don't forget to run the part 2 after reboot ##########################"
    sleep 8
    sudo reboot now
else
    echo "Don't forget to reboot system to continue to part 2"
fi 