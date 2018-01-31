#!/bin/bash

IMG_NAME="tensorflow-cpu"

rm -f $IMG_NAME.img
sudo singularity build $IMG_NAME.simg Singularity
