#!/bin/bash
# install.sh

# Auhtor: BlackLeakz
# 

me=$(whoami)

if [ "$me" != "root" ]; then
    echo -n "Console > Please run this script as root!"
    exit;
fi


reset;

export a="apt-get install -y "
export g="git clone "

echo -n "Console > blackzspace.de - OS || Application installer started!! ... .. ."
echo -n "Console > Detecting Distribution!"

if [ -f /etc/os-release ]; then

    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    ...
elif [ -f /etc/redhat-release ]; then
    ...
else
    OS=$(uname -s)
    VER=$(uname -r)
fi

echo -n "Console > Detected: "
echo -n "\n$OS"

if [ "$OS" == "Ubuntu" ]; then
    echo -n "Console > Distribution is supported!"
    Ubuntu_install; 
elif [ "$OS" == "Debian" ]; then
    echo -n "Console > Distribution is supported!"
    debian_install;
elif [ "$OS" == "Arch" ]; then
    echo -n "Console > Distribution is supported!"
    arch_install;
fi



function debian_install() {
    
    while true;
    do
    read -p "Are you sure to install all applications on the current system?(Yy/Nn)" yn
    case $yn in
        [Yy]* ) echo -n "Console > Installing all applications on the current system!" && echo -n "Console > This may take a while!"; continue;;
        [Nn]* ) echo -n "Console > Aborting!"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
    echo -n "Console > Installing build-dependencies!"
    $a make cmake build-essential sof*prop*c* curl wget git python3-dev python3-pip python3-v*env*
    $a clang
    $a gcc gzip unzip tar
    $a libssl-dev libffi-dev zlib1g-dev libbz2-dev 
    echo -n "Console > Installing Security-Testing tools!"
    $a wireshark aircrack-ng whois traceroute net-tools nmap macchanger mdk3 mdk4
    $a hydra hydra-gtk john john-data johnny
    $a sqlmap sqlninja
    $a hashcat hashcat-utils
    

    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall







done

   
}


function ubuntu_install() {

}

function arch_install() {


}


function git_install() {
    while true;
    do
    echo -n "Console > Installing applications, the apt-manager dosent support. Installing all apps by using git!"
    mkdir ~/.tmp
    cd ~/.tmp
    $g https://gitlab.com/kalilinux/packages/beef-xss.git
    $g https://github.com/laramies/theHarvester.git
    $g https://github.com/opsdisk/metagoofil
    $g https://github.com/owasp-amass/amass.git




    wget https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.6.0.deb
    chmod 777 -R ./*
    dpkg --install Maltego.v4.6.0.deb

}