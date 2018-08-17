#!/bin/bash
DISPLAY=:0;xdotool mousemove 0 300
sudo forever stop /home/pi/apps/dashboard-node/server.js
sudo forever stop /home/pi/apps/dashboard-angular/server.js
sudo killall node
cd /home/pi/apps/dashboard-node/
sudo forever server.js &> /home/pi/logs/node_log.txt &
echo "node server started"
cd /home/pi/apps/dashboard-angular/
sudo forever server.js &> /home/pi/logs/angular_log.txt &
echo "angular server started"
sleep 5s
chromium-browser --disable-infobars --start-fullscreen --noerrdialogs --user-data-dir --disable-session-restore --disable-session-crashed-bubble --disable-web-security --restore-last-session http://localhost:80 &
echo "display started"
sleep 10s
DISPLAY=:0;xdotool mousemove 1905 14 click 1


