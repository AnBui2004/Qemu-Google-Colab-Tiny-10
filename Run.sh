wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -o ngrok-stable-linux-amd64.zip > /dev/null 2>&1
rm -rf ngrok-stable-linux-amd64.zip
./ngrok authtoken 1wyrtxUrJ6XBMVE5tE4t7RuPXdB_7XeYhawZ12NS3JXgpGdfd
nohup ./ngrok tcp --region ap 5900 &>/dev/null &
