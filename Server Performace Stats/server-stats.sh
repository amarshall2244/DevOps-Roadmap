#!/bin/bash

echo "--Total CPU Usage--"
top -bn1 | grep "%CPU" | awk '{print "Usage: "100-$1 "%"}'

echo 

echo "--Total Memory Usage--"
free | grep "Mem" -w | awk '{printf "Total: %.2fGi / Used: %.2fGi (%.2f%%) / Free: %.2fGi (%.2f%%)\n", $2/1024^2, $3/1024^2, $3/$2*100, $4/1024^2, $4/$2*100}'