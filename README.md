# QemuDroid
A script-set that let's you create and run virtual machines on Termux with QEMU


Run this to install it:
```
curl -s -o install https://raw.githubusercontent.com/alexdvn/QemuDroid/refs/heads/main/install && chmod +x install && ./install && rm install
```

then type
```
qemu-new-machine
```
to configure it

then type
```
termux-x11 -ac :0 -xstartup "start-qemu [VMname]"
```
if using X11 or just
```
start-qemu [VMname]
```
if using VNC
