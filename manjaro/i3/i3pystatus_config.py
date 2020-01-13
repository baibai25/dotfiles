from i3pystatus import Status

status = Status()

status.register(
    "clock",
    format=" %H:%M:%S",
    color='#C678DD',
    interval=1
)

status.register(
    "clock",
    format=" %a %Y-%m-%d",
    color='#61AEEE',
    interval=1,
    on_leftclick="/usr/bin/gsimplecal"
)

status.register(
    "mem",
    #format = " {percent_used_mem}%",
    format = " {used_mem} / {total_mem} GB",
    divisor = 1024**3,
    interval = 1
)

status.register(
    "cpu_usage",
    format = " {usage:02}%"
)

status.run()
