# ~/.config/polybar/launch.sh

#!/bin/bash

# 终端可能已经有在运行的实例
killall -q polybar

# 等待进程被终止
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 运行Polybar，使用默认的配置文件路径 ~/.config/polybar/config.ini
# polybar example &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

echo "Polybar launched..."
