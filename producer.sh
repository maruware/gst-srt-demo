#!/bin/sh

gst-launch-1.0 -v \
  videotestsrc is-live=true \
! video/x-raw,width=640,height=360,framerate=30/1 \
! x264enc tune=zerolatency speed-preset=superfast key-int-max=60 \
! mpegtsmux \
! srtserversink  uri="srt://:7002" latency=500