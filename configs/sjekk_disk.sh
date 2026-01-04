#!/bin/bash

THRESHOLD=90
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    logger "ADVARSEL: Kritisk lav diskplass på filserveren. Bruk: $DISK_USAGE%"
fi