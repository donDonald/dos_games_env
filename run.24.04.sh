#!/bin/bash

IMAGE_NAME=${1:-"dos_games_env.24.04"}
FLAGS=" $2 "

docker run \
    -it \
    --rm \
    $FLAGS \
    --network=host \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    --env DISPLAY=$DISPLAY \
    -e XDG_RUNTIME_DIR=/tmp \
    -v /run/user/$(id -u):/run/user/$(id -u) \
    -v /run/user/$(id -u)/pipewire-0:/tmp/pipewire-0 \
    -v "$(pwd)/games/:/home/dos_games_env/games/" \
    --name $IMAGE_NAME \
    $IMAGE_NAME
