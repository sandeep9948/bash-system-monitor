# Bash System Health Monitor

A Bash script that collects CPU, memory, and disk usage from a Linux system and logs it to a file. Built to practice shell scripting and Linux system monitoring — common tasks in DevOps operational workflows.

## Why I Built This
Monitoring system health is a foundational DevOps task. This script simulates what you'd run on a server before setting up a full tool like Prometheus or CloudWatch.

## What It Does
- Captures CPU usage percentage
- Reports memory used vs total available
- Reports disk usage on the root partition
- Appends all results with a timestamp to `system_health.log`

## How to Run

```bash
chmod +x monitor.sh
./monitor.sh
```

## Schedule It with Cron (run every hour automatically)

```bash
crontab -e
```

## Sample Output

============================

Health Check: 2025-04-10 14:00:01
CPU Usage: 12.5%
Memory - Used: 1024MB / Total: 4096MB (25.00%)
Disk - Used: 8.1G / Total: 20G (41%)

## Skills Shown
`Bash` `Linux` `Cron` `System Monitoring` `Log Management`
