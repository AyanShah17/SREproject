#!/bin/bash

PORT=8080
LOGFILE=./logs/monitor.log
mkdir -p logs

check_port() {
    netstat -an | grep ":$PORT" | grep LISTEN > /dev/null
}

ask_to_truncate() {
    read -p "Do you want to truncate the data in the log file? (y/n): " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
        truncate -s 0 "$LOGFILE"
        echo "File has been truncated."
    else
        echo "File has not been truncated."
    fi
}

trap ask_to_truncate EXIT

while true; do
  date >> "$LOGFILE"

  if check_port; then
    echo "✅ Service is running on port $PORT" >> "$LOGFILE"

  else
    echo "❌ Service DOWN! Triggering alert..." >> "$LOGFILE"
    echo "ALERT: Service on port $PORT is DOWN!"

  fi

  echo "----" >> "$LOGFILE"
  sleep 10

done