#!/bin/sh
case $1 in
    period-changed)
        exec notify-send -i redshift -a "Redshift" "Redshift" "Period changed to $3"
#        exec notify-send "Redshift" "Period changed to $3"
esac
