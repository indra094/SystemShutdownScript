#!/bin/bash

REMINDER_SENT=0

while true
do

HOUR=$(date +%H)
MINUTE=$(date +%M)


# 4:30 PM reminder
if [ "$HOUR" -eq 16 ] && [ "$MINUTE" -eq 30 ] && [ "$REMINDER_SENT" -eq 0 ]
then

osascript -e 'display notification "30 minutes remaining. Plan your next day for 4 hours before shutdown." with title "TimeGuard Reminder"'

REMINDER_SENT=1

fi


# Reset reminder after midnight
if [ "$HOUR" -eq 0 ]
then
REMINDER_SENT=0
fi


# Shutdown at 5 PM
if [ "$HOUR" -ge 17 ]
then

shutdown -h now

fi


sleep 60

done
