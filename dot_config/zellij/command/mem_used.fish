#!/usr/bin/env fish

set mem_used (free -h | awk '/^Mem:/ {print $3}')
set mem_total (free -h | awk '/^Mem:/ {print $2}')

printf "%s/%s" $mem_used $mem_total
