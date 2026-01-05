#!/data/data/com.termux/files/usr/bin/bash

source "$VMNAME/config"
command="qemu-system-x86_64 -M pc -m $RAM -cpu $CPU -hda $QCOW2PATH"

if [[ -n "$NET" ]]; then
  command+=" -nic user,model=$NET"
fi

if [[ -n "$ISOPATH" ]]; then
  command+=" -cdrom $ISOPATH"
fi

if [[ -n "$SOUND" ]]; then
  command+=" -device $SOUND"
fi

if [[ -n "$@" ]]; then
  command+=" $@"
fi

eval "$command"


