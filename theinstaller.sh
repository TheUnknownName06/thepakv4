#!/bin/bash

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

#JALUR EXTERNAL
down=/storage/emulated/0/Download
dpak=/storage/emulated/0/Download/pak

#JALUR QUICKBMS
quickbms=$PREFIX/share/quickbms
rawdatf=$PREFIX/share/

#JALUR THEPAK
datfsu=$PREFIX/share/thepakv4/etc/SU
TOOLS=$PREFIX/share/thepakv4/etc
datf=$PREFIX/share/thepakv4
tx=$HOME/thepakv4

spinner=( thepak... ThepakT.. tHepak.U. thEpak..N thePakTUN thepAkTUN "thepaK")


spin(){
while true
 do
  for g in "${spinner[@]}"
   do
     echo -ne "\r$g"
     sleep 0.2
   done
 done
}


apt upgrade
apt update 
pkg upgrade
pkg update

  cd $PREFIX/share
  if [ -d "quickbms" ]; then
      echo "ok wait"

  else 
      mkdir quickbms
      mkdir quickbms/translate
      
  fi
  if [ -d "thepakv4" ]; then
     echo ""
  else 
      mkdir thepakv4
      mkdir thepakv4/etc
      mkdir thepakv4/etc/SU
      
  fi
  cd $tx
  if [ -d "etc" ]; then
     rm -rf etc
  else 
     echo ""
      
  fi


function thescript_thepak {
    clear
   echo "PLEASE WAIT WRITING A SCRIPT SETUP"
   spin & pid=$!
   sleep 2
   cd $datf
   mv etc/setup $tx
   cd $tx
   sleep 2.9
   kill $pid
   rm -rf etc
   echo "Now You Can RUN the file with BASH SETUP"
   exit
}

function checkport {
    
    thepak_check
}

file_export(){
    cd $tx
    echo "PLEASE WAIT INSTALLING DATA..."
    spin & 
    pid=$!
    
    
    
    
    cd $tx
    mv setup.sh $datf 
    mv thepakv4.sh $datf 
    mv B@EG0@ $datf 
    
    
    
    cd $datf
    mkdir etc 
    
    
    
    
    cd $tx/etc
    mv tools.bms $datf/etc 
    mv banner $datf/etc 
    mv spinner.sh $datf/etc 
    
    
    
    
    cd $tx
    mv exec_sh.sh $datf 
    
    
    cd $datf/etc
    mkdir SU 
    clear
    sleep 0.5
    
    
    kill $pid
    checkport
}

loading_down(){
    echo "DOWNLOAD A PROGRAM EXECUTOR"
    echo "PLEASE WAIT..."
    spin &
    pid=$!
    cd $tx
    wget -q https://download1595.mediafire.com/9rt3hclc7yng/6bq7gl5tcwr8q6g/thepakv4-non-enc.zip
    echo "EXTRACTING..."
    unzip -qq thepakv4-non-enc.zip
    sleep 1
    rm -rf *enc.zip
    kill $pid
    cd $tx
    file_export
}

thepak_INSTALLER(){
    loading_down
}


function thepak_check {
  echo -e "${YELLOW}Checking required program..${NOCOLOR}"
  cd $datf
  FILE=B@EG0@
  if [ -f "$FILE" ]; then
      echo -e "${LIGHTGREEN}Program has been installed.${NOCOLOR}"
      thescript_thepak
  else 
      thepak_INSTALLER
  fi
}

echo -e "${YELLOW}Checking Required packages${NOCOLOR}"

packages=("wget" "unzip" "curl" "x11-repo" "qemu-system-i386" "qemu-user-i386" "qemu-system-x86_64" "qemu-system-x86-64" "openssl-tool"
"shc")

for pkg in ${packages[@]}; do

    is_pkg_installed=$(dpkg-query -W --showformat='${Status}\n' ${pkg} | grep "install ok installed")

    if [ "${is_pkg_installed}" == "install ok installed" ]; then
        echo -e ${GREEN}${pkg}${NOCOLOR} is installed.
    else [ "" = "${is_pkg_installed}" ];
     echo -e "${RED}No ${pkg}. Setting up ${pkg}.${NOCOLOR}" 
    pkg install ${pkg} -y
    fi
done
thepak_check
