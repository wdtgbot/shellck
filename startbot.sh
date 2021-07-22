#!/bin/bash
/usr/bin/python3 -m pip install --upgrade pip
pip3 install  pyrogram --upgrade
pip3 install mutagen --upgrade
pip3 install nhentai --upgrade
pip3 install beautifulsoup4 --upgrade
service caddy start
yes "4" | bash status.sh s

yes "4" | bash status.sh c


touch /root/.aria2/aria2.session
chmod 0777 /root/.aria2/ -R

nohup filebrowser -r /  -p 9184 >> /dev/null 2>&1 &
#nohup ./FolderMagic -aria "http://127.0.0.1:6800/jsonrpc" -auth root:$Aria2_secret -bind :9184 -root / -wd /webdav >> /dev/null 2>&1 & 

mkdir /.config/
mkdir /.config/rclone
touch /.config/rclone/rclone.conf
echo "$Rclone" >>/.config/rclone/rclone.conf
#wget git.io/tracker.sh
#chmod 0777 /tracker.sh
#/bin/bash tracker.sh "/root/.aria2/aria2.conf"



git clone "https://github.com/wdtgbot/abot"  >> /dev/null 2>&1
mkdir /bot/
mv /abot/bot/* /bot/
cp /abot/config/* /root/.aria2/
cp /abot/nginx.conf /etc/nginx/
cp /abot/config/upload.sh /
chmod 0777 /upload.sh
chmod 0777 /root/.aria2/delete.sh
chmod 0777 /root/.aria2/upload.sh
chmod 0777 /root/.aria2/clean.sh
tracker_list=`curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',' | cat`
echo "bt-tracker=$tracker_list" >> /root/.aria2/aria2.conf
mkdir /index/
cp /abot/index.html /index/
chmod 0777 /index/index.html
chmod 0777 /bot/ -R
rm -rf /abot
python3 /bot/nginx.py
nginx -c /etc/nginx/nginx.conf
nginx -s reload
#nohup rclone rcd --rc-user=root --rc-pass=$Aria2_secret --rc-allow-origin="https://elonh.github.io"
nohup aria2c --conf-path=/root/.aria2/aria2.conf --rpc-listen-port=8080 --rpc-secret=$Aria2_secret &
#nohup python3 /bot/web.py &

python3 /bot/main.py
