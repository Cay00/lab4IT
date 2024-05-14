#!/bin/bash

if [ "$1" = "--date" ]; then
    dzis=$(date +"%Y-%m-%d")
    echo $dzis
fi
