#!/bin/bash -e
#
# Package wav files in a directory to embed in a dustcloud image or upload to Valetudo for xiaomi gen1 and gen2.
# Requires ccrypt.

dir=output/result
sound_password="r0ckrobo#23456"

mkdir -p $dir

cd $dir
tar zc *.wav | ccrypt -e -K "$sound_password" > voicepack.pkg
