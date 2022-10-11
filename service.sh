#!/system/bin/sh

(
    # Wait until boot completed
    while [ "$(getprop sys.boot_completed)" != "1" ]
    do
        sleep 1
    done
    chmod 755 /data/adb/JeelsBypasser/start
    /data/adb/JeelsBypasser/start
)&
