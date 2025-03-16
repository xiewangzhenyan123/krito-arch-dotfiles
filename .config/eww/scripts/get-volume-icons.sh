# 获取默认音频设备的名称
default_sink=$(pactl info | grep 'Default Sink:' | awk '{print $3}')

# 获取默认音频设备的静音状态
muted=$(pactl list sinks | grep -E "Name: $default_sink|Mute:" | awk -v sink="$default_sink" '
  /Name:/ {current_sink=$2}
  /Mute:/ && current_sink == sink {print $2; exit}
')
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')
if [[ $muted == "no" ]]; then
  if (( volume > 50 )); then
    echo ""
  elif (( volume > 0 )); then
    echo ""
  else
    echo ""
  fi
else 
  echo ""
fi
