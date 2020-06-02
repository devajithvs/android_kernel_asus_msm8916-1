#!/bin/bash

#Devajith
#Compile kernel with a build script to make things simple

mkdir -p out

#Change toolchain path before using build script!
export CROSS_COMPILE=~/aarch64-linux-android-4.9/bin/aarch64-linux-android-
#Using toolchain in Travis

#Enable when needed:
export USE_CCACHE=1

export ARCH=arm64 && export SUBARCH=arm64 

#Enable only when needed:
#make clean
#make mrproper
#Or simply delete out directory to clean source

make -C $PWD O=$PWD/out ARCH=arm64 zc550kl_defconfig

#Edit the number according to the number of CPUs you have in your PC:
make -j4 -C $PWD O=$PWD/out ARCH=arm64
