#!/usr/bin/env fish

set idle_cpu (top -b -n 1 | grep "%Cpu" | awk -F',' '{print $4}' | awk '{print $1}')
printf  "%.2f%%" (math "100 - $idle_cpu")
