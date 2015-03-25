#!/system/bin/sh

src_config_fname=/system/etc/streaming/streamingserver.xml
dst_config_fname=/data/misc/streaming/streamingserver.xml


cat $src_config_fname > $dst_config_fname

for media_fname in $(ls /system/media/streaming); do
	cat /system/media/streaming/$media_fname > /data/misc/streaming/media/$media_fname
done
