#!/bin/bash
BIN=$(pwd)/build
if [ "${1}" == "clean" ]; then
    rm -rvf "${BIN}" out
else
    if [ ! -d "${BIN}" ]; then
        mkdir "${BIN}"
    fi
    cd "${BIN}"
    cmake ..
    make $1
fi
