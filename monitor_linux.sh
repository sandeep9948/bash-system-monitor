#!/bin/bash

LOG_FILE="system_health.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "============================" >> $LOG_FILE
echo "Health Check: $DATE" >> $LOG_FILE
echo "============================" >> $LOG_FILE

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $CPU%" >> $LOG_FILE

MEMORY=$(free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)", $3, $2, $3*100/$2 }')
echo "Memory - $MEMORY" >> $LOG_FILE

DISK=$(df -h / | awk 'NR==2{print "Used: "$3" / Total: "$2" ("$5")"}')
echo "Disk - $DISK" >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Health check complete. Log saved to $LOG_FILE"