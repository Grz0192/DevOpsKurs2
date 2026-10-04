#!/bin/bash
exec 9>/home/mateuszg/locki/wolny-czekaj.lock
flock -w 5 9 || exit 4
echo "start $(date '+%H:%M:%S')" >> /home/mateuszg/locki/wolny-czekaj.log
sleep 15
echo "koniec $(date '+%H:%M:%S')" >> /home/mateuszg/locki/wolny-czekaj.log
