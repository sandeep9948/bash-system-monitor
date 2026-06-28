#!/bin/bash

LOG_FILE="system_health.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "============================" >> "$LOG_FILE"
echo "Health Check: $DATE" >> "$LOG_FILE"
echo "============================" >> "$LOG_FILE"

CPU=$(wmic cpu get loadpercentage | awk 'NR==2 {print $1}')
echo "CPU Usage: $CPU%" >> "$LOG_FILE"

FREE_MEM=$(wmic OS get FreePhysicalMemory | awk 'NR==2 {print $1}')
TOTAL_MEM=$(wmic OS get TotalVisibleMemorySize | awk 'NR==2 {print $1}')

echo "Free Memory (KB): $FREE_MEM" >> "$LOG_FILE"
echo "Total Memory (KB): $TOTAL_MEM" >> "$LOG_FILE"

DISK=$(wmic logicaldisk get size,freespace,caption)
echo "$DISK" >> "$LOG_FILE"

echo "" >> "$LOG_FILE"
echo "Health check complete. Log saved to $LOG_FILE"