#!/bin/bash

UPTIME=$(uptime -p | sed 's/up //g')
UPTIME=$(echo $UPTIME | sed 's/minutes/min/g')
UPTIME=$(echo $UPTIME | sed 's/hours/hr/g')
UPTIME=$(echo $UPTIME | sed 's/days/d/g')
echo $UPTIME
