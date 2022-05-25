sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
qemu-img create -f raw Tiny10.img 64G
wget -O RTL8139F.iso 'https://drive.google.com/uc?export=download&id=1wDL8vo9mmYKw1HKXZzaYHoKmzSt_wXai'
wget -O Tiny10.iso 'https://dl.malwarewatch.org/windows/mods/Tiny%2010.iso'

curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 8G \
  -cpu EPYC \
  -boot order=d \
  -drive file=Tiny10.iso,media=cdrom \
  -drive file=Tiny10.img,format=raw \
  -drive file=RTL8139F.iso,media=cdrom \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -cpu core2duo \
  -smp cores=2 \
  -device rtl8139,netdev=n0 -netdev user,id=n0 \
  -accel tcg,thread=multi \
