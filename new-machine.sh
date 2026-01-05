#!/data/data/com.termux/files/bash
#this command can sometimes cause issues, I will uncomment if I feel like it's needed
#set -euo pipefail

#color Definitions to make it flash for "echo -e"
RED='\e[31m'
GREEN='\e[32m'
NC='\e[0m' 

clear

echo -e "$GREEN ------------------------------- $NC"
echo -e "$GREEN QEMU machine creator script $NC"
echo -e "$GREEN ------------------------------- $NC"

echo "This script will create a machine with a script and a few iso CD/DVDs and QCow2 droves"
sleep 5
clear

echo "Currently, there is only support for legacy x86 VMs"
echo "Please pick a CPU..."
echo "1.) Intel CoreDuo"
echo "2.) Intel Pentium"
echo "3.) AMD Athlon"
echo "4.) Intel Pentium II"
echo "5.) Intel Pentium III"
echo "6.) Intel i486"
if [[ "$(uname -m)" = "x86_64" ]]; then
  echo "7.) Use Native CPU (Not Recommended for Legacy OSes)"
fi

read -p "What is your choice?" cpuchoice

case $cpuchoice in
  1)
    CPU="coreduo"
    ;;
  2)
    CPU="pentium"
    ;;
  3)
    CPU="athlon"
    ;;
  4)
    CPU="pentium2"
    ;;
  5)
    CPU="pentium3"
    ;;
  6)
    CPU="486"
    ;;
  7)
    if [[ "$(uname -m)" != "x86_64" ]]; then
      echo -e "$RED Cannot use native CPU on non x86 devices $NC"
      exit 1
    else
      CPU="native"
    fi
    ;;
esac

export CPU

echo -e "$GREEN CPU is $CPU $NC"
sleep 5
clear

read -p "Pick an amount of RAM (MB):" RAM

read -p "Are you using a Virtual CD/DVD? (y/n)" ISOCHOICE

if [[ "$ISOCHOICE" = "Y" || "$ISOCHOICE" = "y" ]]; then
  read -p "Where is your ISO?:" ISOPATH
  if ! ls "$ISOPATH" >> /dev/null 2>&1; then
    echo -e "$RED ERROR: '$ISOPATH' not found: No such file or directory"
    exit 1
  fi
fi

read -p "Where is you QCow2 file?:" QCOW2PATH
if ! ls "$QCOW2PATH" >> /dev/null 2>&1; then
  read -p "$QCOW2PATH not found, would you like to create it? (y/n):" QCOW2CHOICE
  if [[ "$QCOW2CHOICE" = "Y" || "$QCOW2CHOICE" = "y" ]]; then
    read -p "Pick a Disk size, M for MESGABITES and G for GIGABYTES..." QCOW2SIZE
    qemu-img create -f qcow2 "$TMPDIR/Deb.qcow2" "$QCOW2SIZE"
    qemu-img convert -c -O qcow2 "$TMPDIR/Deb.qcow2" "$QCOW2PATH"
    rm "$TMPDIR/Deb.qcow2"
  fi
fi

# More to add, just testing now though.



  
