#!/bin/bash

sh /register_start.sh
nginx -g "daemon off;" &
./cronscript.sh -D

