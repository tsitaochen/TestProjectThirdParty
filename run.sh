#!/bin/sh

InstallProtobuf()
{
    cd protobuf
    ./autogen.sh
    ./configure
    make
    make check
    sudo make install
    sudo ldconfig
}



git submodule update --init --recursive
if [ $# -eq 1 ]
then
    $1
elif [ $# -eq 0 ]
then
    InstallProtobuf
fi
