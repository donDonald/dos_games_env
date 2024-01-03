#!/bin/bash

IMAGE_NAME=${1:-"dos_games_env"}
DOCKER_FILE=${2:-"./Dockerfile"}
FLAGS=" $3 "

docker build -t $IMAGE_NAME $FLAGS -f $DOCKER_FILE  .

