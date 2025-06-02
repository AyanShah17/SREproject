#!/bin/bash

PORT=8000

log_file="./logs/metrics.log"

check_port() {
    netstat -an | grep ":8000" | grep LISTEN > /dev/null
}

trap 'echo "Script started at $(date)" | tee -a "$log_file"'

on_start() {
    echo "Script started at $(date)" >> "$log_file"
    echo "Performing startup tasks..." >> "$log_file"
}

on_start

log_stop_time() {
    stop_time=$(date)
    echo "Script Stop Time : $stop_time" >> "$log_file"
    exit 0
}

trap log_stop_time EXIT


while true; do

  metrics=$(curl -s http://localhost:8000/metrics)

  if check_port; then

    echo "========== API Request Metrics ==========" > "$log_file"
    echo "" >> "$log_file"

    echo "API Requests Stats" >> "$log_file"
    echo "-------------------" >> "$log_file"
    echo "$metrics" | grep "api_request_total" >> "$log_file"
    echo "" >> "$log_file"

    echo "=======================================" >> "$log_file"
    echo "" >> "$log_file"
    
  else
    echo "❌ Service DOWN! Triggering alert..." >> "$log_file"
    echo "ALERT: Service on port $PORT is DOWN!"

  fi

  echo "----" >> "$log_file"
  sleep 10

done