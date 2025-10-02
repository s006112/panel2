#!/bin/bash
# /opt/panel2/run.sh

cd /opt/panel2
log_file="panel.log"

while true; do
    /usr/bin/python3 app.py >>panel.log 2>&1
    echo "$(date) app.py crashed, restarting..." >>panel.log
    sleep 3
done

start_app "app.py" PORT=8080
