#!/bin/bash

IMG_SIZE=4500
IMG_NAME="tensorflow-cpu"

rm -f $IMG_NAME.img
sudo singularity create --size $IMG_SIZE $IMG_NAME.img
sudo singularity bootstrap $IMG_NAME.img Singularity
