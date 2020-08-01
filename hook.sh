#! /bin/sh
if [ "$#" -ne 2 ]
then
    printf "Usage: $0 [Process] [JS File]\n"
else
    frida -U "$1" -l "$2"
fi