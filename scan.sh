#!/bin/bash

echo -e "\e[32mAutoRecon+ - Advanced Network Scanner\e[0m"

read -p "Enter target IP or domain: " target
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="logs/scan_${timestamp}.log"
report_file="reports/${target}_${timestamp}.html"

mkdir -p logs reports

# Basic scan and output to XML for transformation
echo "Running scan on $target..."
nmap -A $target -oX "${report_file%.html}.xml" | tee -a "$log_file"

# Transform XML to HTML
xsltproc "${report_file%.html}.xml" -o "$report_file"

# Check for critical ports and send alert (example for SSH)
if grep -q "22/open" "$log_file"; then
  echo "Alert: SSH port open on $target" | mailx -s "Nmap Alert: SSH Detected" you@example.com
fi

echo "Scan complete. Log: $log_file | Report: $report_file"
