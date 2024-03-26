#!/bin/bash


echo "This is your memory usage: "
totalMem=$(free -g | grep Mem: | awk '{print $2}')
usedMem=$(free -g | grep Mem: | awk '{print $3}')
percentUsed=$(awk "BEGIN {printf \"%.2f\",(${usedMem}/${totalMem})*100}")
echo "Memory Usage: $usedMem GB / $totalMem GB ($percentUsed%)"

if (( $(echo "$percentUsed > 80" | bc -l) )); then
    echo "Warning, high usage detected."
fi
