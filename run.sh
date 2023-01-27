#!/bin/bash

IMAGE_NAME=${1:-"dos_games_env"}
FLAGS=" $2 "
if [ -z $IMAGE_NAME ]; then
    echo "Where is mage name to run dude? Exiting" 1>&2
    exit
fi




docker run  -it --rm $FLAGS --network=host --env DISPLAY=$DISPLAY --privileged  \
 -v "$HOME/.Xauthority:/home/dos_games_env/.Xauthority"  \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -v "$(pwd)/games/:/home/dos_games_env/games/" \
 $IMAGE_NAME

