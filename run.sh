#!/bin/bash
# /opt/panel/run.sh

cd /opt/panel2
log_file="panel.log"

start_app() {
    local script="$1"
    shift
    local label="$script"
    echo "$(date) ${label} launch initiated." >>"$log_file"
    if [ "$#" -gt 0 ]; then
        env "$@" /usr/bin/python3 "$script" >>"$log_file" 2>&1
    else
        /usr/bin/python3 "$script" >>"$log_file" 2>&1
    fi
}

start_app "app.py" PORT=8080
