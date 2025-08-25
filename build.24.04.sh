#!/bin/bash

IMAGE_NAME=${1:-"dos_games_env.24.04"}
DOCKER_FILE=${2:-"./Dockerfile.24.04"}
FLAGS=" $3 "

docker build \
    -t $IMAGE_NAME $FLAGS \
    -f $DOCKER_FILE .
