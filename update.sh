#!/data/data/com.termux/files/usr/bin/bash
echo "QemuDroid updater"

yes | pkg up

rm $PATH/qemu-new-machine
curl -s -o $PATH/qemu-new-machine https://raw.githubusercontent.com/alexdvn/QemuDroid/refs/heads/main/new-machine.sh
chmod +x $PATH/qemu-new-machine
rm $PATH/qemu-start
curl -s -o $PATH/qemu-start https://raw.githubusercontent.com/alexdvn/QemuDroid/refs/heads/main/start.sh
chmod +x $PATH/qemu-start
rm $PATH/qemu-update
curl -s -o $PATH/qemu-update https://raw.githubusercontent.com/alexdvn/QemuDroid/refs/heads/main/update.sh
chmod +x $PATH/qemu-update
echo "Update complete!"
