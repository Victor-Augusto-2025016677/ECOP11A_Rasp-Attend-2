#!/bin/bash

LOCKFILE="/tmp/parser_nmap.lockfile"

flock -n "$LOCKFILE" -c '
while true; do
    python3 /home/victo/parser_nmap.py && python3 /home/victo/timestamps.py
    sleep 30
done
'
