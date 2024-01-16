#!/bin/bash                                                                                                     

PROC="$1"

proc_write=$(sudo pidstat -C "$PROC" -d | awk '{s += $5} END {print s}')

#answer="$(curl -Is $DOMAIN | head -1 | awk '{print $2}')"

if [ -z "${proc_write}" ];
then
    echo 0
    exit
else
echo $proc_write
fi
