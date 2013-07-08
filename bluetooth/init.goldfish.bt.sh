#!/system/bin/sh

hciattach_pid=""

start_hciattach()
{
  /system/bin/hciattach -n ttyS2 any
  hciattach_pid=$!
}

kill_hciattach()
{
  kill -TERM $hciattach_pid
}

start_hciattach
wait $hciattach_pid
