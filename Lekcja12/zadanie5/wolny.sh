#!/bin/bash
exec 9>/home/mateuszg/locki/wolny.lock
flock -n 9 || exit 4
echo "start $(date '+%H:%M:%S')" >> /home/mateuszg/locki/wolny.log
sleep 15
echo "koniec $(date '+%H:%M:%S')" >> /home/mateuszg/locki/wolny.log
