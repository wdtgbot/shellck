#!/bin/bash
/usr/bin/python3 -m pip install --upgrade pip
pip3 install  pyrogram --upgrade
pip3 install mutagen --upgrade
pip3 install nhentai --upgrade
pip3 install beautifulsoup4 --upgrade
pip3 install lxml --upgrade
apt-get install libxml2-dev libxslt-dev -y
pip3 install pyppeteer
sudo apt-get install  gconf-service libasound2 libatk1.0-0 libatk-bridge2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils -y
#RUN pyppeteer-install
service caddy start
yes "4" | bash status.sh s

#yes "4" | bash status.sh c

wget -q https://github.com/cokemine/ServerStatus-goclient/releases/latest/download/status-client_linux_amd64.tar.gz
tar xf status-client_linux_amd64.tar.gz -C /usr/local/bin
chmod +x /usr/local/bin/status-client
nohup status-client -dsn="wei666:wcy98151@localhost:35601" > /dev/null 2>&1 &

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
