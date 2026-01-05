#!/data/data/com.termux/files/usr/bin/bash

VMNAME="$@"

source "$PREFIX/etc/$VMNAME"
command="qemu-system-x86_64 -M pc -m $RAM -cpu $CPU -hda $QCOW2PATH -full-screen"

if [[ -n "$NET" ]]; then
  command+=" -nic user,model=$NET"
fi

if [[ -n "$ISOPATH" ]]; then
  command+=" -cdrom $ISOPATH"
fi

if [[ -n "$SOUND" ]]; then
  command+=" -device $SOUND"
fi

if [[ -n "$VNC" ]]; then
  command+=" -vnc $VMC"
fi

eval "$command"


