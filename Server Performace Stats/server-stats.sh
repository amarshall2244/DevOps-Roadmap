#!/bin/bash

echo "--Total CPU Usage--"
top -bn1 | grep "%CPU" | awk '{print "Usage: "100-$1 "%"}'

echo 