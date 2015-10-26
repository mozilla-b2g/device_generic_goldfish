#!/system/bin/sh

src_config_fname=/system/etc/streaming/streamingserver.xml
dst_config_fname=/data/misc/streaming/streamingserver.xml

src_media_fname=/system/media/streaming/sample_h264_100kbit.mp4
dst_media_fname=/data/misc/streaming/media/sample_h264_100kbit.mp4

cat $src_config_fname > $dst_config_fname
cat $src_media_fname > $dst_media_fname
