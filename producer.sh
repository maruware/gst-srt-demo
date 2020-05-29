#!/bin/sh

gst-launch-1.0 -v \
  mpegtsmux name=mux \
  videotestsrc is-live=true \
  ! video/x-raw,width=640,height=360,framerate=30/1 \
  ! x264enc tune=zerolatency speed-preset=superfast key-int-max=60 \
  ! queue \
  ! mux. \
  audiotestsrc is-live=true wave=8 \
  ! audioconvert \
  ! voaacenc bitrate=64000 \
  ! queue \
  ! mux. \
  mux. \
  ! srtserversink  uri="srt://:7002" latency=200