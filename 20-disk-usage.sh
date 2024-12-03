#!/bin/bash

DISK_USAGE=$(df -hT |grep xfs)
DISK_THRESOLD=5 #Real projects, it is usally 75



while IFS= read -r line #IFS is called internal field separator, empty it will not ignore while space. -r is for not to ignore special characters like /
do
    #USAGE=$(echo $line) #df -HT | grep xfs | awk -F " " '{print $6F}'
    echo $line
    
done <<< $DISK_USAGE