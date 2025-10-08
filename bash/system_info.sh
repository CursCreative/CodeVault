#!/usr/bin/env bash
# System Information Script
# Author: GitHub Copilot
# Description: Displays basic system information including OS, hostname, user, and uptime

echo "==================================="
echo "    SYSTEM INFORMATION SCRIPT"
echo "==================================="
echo ""

# Display hostname
echo "Hostname: $(hostname)"

# Display current user
echo "Current User: $(whoami)"

# Display operating system
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    echo "Operating System: $NAME $VERSION"
else
    echo "Operating System: $(uname -s)"
fi

# Display kernel version
echo "Kernel Version: $(uname -r)"

# Display system uptime
echo "System Uptime: $(uptime -p 2>/dev/null || uptime)"

# Display current date and time
echo "Current Date/Time: $(date)"

# Display disk usage of root partition
echo ""
echo "Disk Usage (/):"
df -h / | tail -1 | awk '{print "  Used: "$3" / "$2" ("$5")"}'

# Display memory usage (if free command is available)
if command -v free &> /dev/null; then
    echo ""
    echo "Memory Usage:"
    free -h | grep Mem | awk '{print "  Used: "$3" / "$2}'
fi

echo ""
echo "==================================="
