#!/bin/bash
BIN=$(pwd)/build
if [ "${1}" == "clean" ]; then
    rm -rvf "${BIN}"
else
    if [ ! -d "${BIN}" ]; then
        mkdir "${BIN}"
    fi
    g++ main.cpp -o "${BIN}/gn" -std=c++11 -lpthread
fi
