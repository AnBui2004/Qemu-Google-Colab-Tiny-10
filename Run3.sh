curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 8G \
  -cpu EPYC \
  -boot order=d \
  -drive file=Tiny10.qcow2,format=raw \
  -drive file=RTL8139F.iso,media=cdrom \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -cpu n270 \
  -smp sockets=1,cores=4,threads=2 \
  -vga std \
  -device e1000,netdev=n0 -netdev user,id=n0 \
  -accel tcg,thread=multi \
