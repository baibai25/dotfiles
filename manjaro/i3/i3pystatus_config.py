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
    format=" %a %d-%m-%Y ",
    color='#61AEEE',
    interval=1,
    on_leftclick="/usr/bin/gsimplecal"
)

status.register(
        "mem",
        format = " {avail_mem} MiB",
)

status.register(
    "cpu_usage",
    format = " {usage:02}%"
)

status.run()
