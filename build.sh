#!/bin/bash

cdrom_gid=$(getent group cdrom | cut -d: -f3) uid=$(id -u) docker build --build-arg cdrom_gid --build-arg uid -t abcde .