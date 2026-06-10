#!/bin/bash

echo "--Total CPU Usage--"
top -bn1 | grep "%CPU" | awk '{print "Usage: "100-$1 "%"}'

echo 

echo "--Total Memory Usage--"
free | grep "Mem" -w | awk '{printf "Total: %.2fGi / Used: %.2fGi (%.2f%%) / Free: %.2fGi (%.2f%%)\n", $2/1024^2, $3/1024^2, $3/$2*100, $4/1024^2, $4/$2*100}'

echo 

echo "--Total Disk Usage--"
df -h --total| grep "/" -w | awk '{printf "Total: %s / Used: %s (%.2f%%) / Free: %s (%.2f%%)\n" , $2, $3, $5, $4, $5}'

echo

echo "--Top 5 Processes by CPU--"
ps -eo pid,user,%cpu,%mem --sort=-%cpu | head -6

echo

echo "--Top 5 Processes by MEM--"
ps -eo pid,user,%cpu,%mem --sort=-%mem | head -6