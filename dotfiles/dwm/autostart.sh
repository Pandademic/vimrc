bash ~/.fehbg &

#while true
#do
#  VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
#  LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
#  OTHERTIME=$(TZ=Europe/London date +%Z\=%H:%M)
#  IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
#  TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

#  if acpi -a | grep off-line > /dev/null
#  then
#    BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
#    xsetroot -name "$IP $BAT $VOL $TEMP $LOCALTIME $OTHERTIME"
#  else
#    xsetroot -name "$IP $VOL $TEMP $LOCALTIME $OTHERTIME"
#  fi
#  sleep 20s
#done &

#dwmstatus 2>&1 >/dev/null &
dwmstatus &
