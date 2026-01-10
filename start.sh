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
  command+=" -vnc $VNC"
fi

# use the "QEMU_EXTRA_ARGS" envar
if [[ -n "$QEMU_EXTRA_ARGS" ]]; then
  command+=" $QEMU_EXTRA_ARGS"
fi

eval "$command"


