#!/bin/bash

LOG_FILE="system_health.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "============================" >> "$LOG_FILE"
echo "Health Check: $DATE" >> "$LOG_FILE"
echo "============================" >> "$LOG_FILE"

CPU=$(wmic cpu get loadpercentage | awk 'NR==2 {print $1}')
echo "CPU Usage: $CPU%" >> "$LOG_FILE"

MEMORY=$(wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /Value)
echo "$MEMORY" >> "$LOG_FILE"

DISK=$(wmic logicaldisk where "DeviceID='C:'" get Size,FreeSpace)
echo "$DISK" >> "$LOG_FILE"

echo "" >> "$LOG_FILE"
echo "Health check complete. Log saved to $LOG_FILE"