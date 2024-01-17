#!/bin/bash

#if [ -f /etc/zabbix/scripts/iops.json ]; then
#    rm -rf /etc/zabbix/scripts/iops.json
#fi

proc_file="/etc/zabbix/scripts/process_name"

sudo top -b -n 1 | awk '{ print $12 }' | tail +8 | sort -u > $proc_file

#JSON_VAR='{"PROC":"%s", "KB":%s}'

#while IFS= read -r line
#do
#    proc_write=$(sudo pidstat -C "$line" -d | awk '{s += $5} END {print s}')
#    if [[ $proc_write -gt 0 ]]; then
#        printf  "$JSON_VAR"  "$line" "$proc_write" >> /etc/zabbix/scripts/iops.json
#    fi
#done < $proc_file

JSON=$(for i in `cat $proc_file`; \
	do \
	#proc_write=$(sudo pidstat -C "$i" -d | awk '{s += $5} END {print s}') \
	printf "{\"{#PROC}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/'  \
)

printf "{\"data\":["
printf $JSON
printf "]}"


#sed '1 s/^/[/' /etc/zabbix/scripts/iops.json | sponge /etc/zabbix/scripts/iops.json && sed '1 s/$/]/' /etc/zabbix/scripts/iops.json | sponge /etc/zabbix/scripts/iops.json
#printf "{\"data\":["
#sed -i 's/}{/},{/g' /etc/zabbix/scripts/iops.json
#sed -i 's/PROC/\{\#PROC\}/g' /etc/zabbix/scripts/iops.json
#sed -i 's/KBs/\{\#KBs\}/g' /etc/zabbix/scripts/iops.json
#cat /etc/zabbix/scripts/iops.json #| jq
#printf "]}"
