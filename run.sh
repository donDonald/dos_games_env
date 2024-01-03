#!/bin/bash

IMAGE_NAME=${1:-"dos_games_env"}
FLAGS=" $2 "

# https://github.com/mviereck/x11docker/wiki/Container-sound:-ALSA-or-Pulseaudio#pulseaudio-with-shared-socket

echo "
default-server = unix:/tmp/pulseaudio.socket
# Prevent a server running in the container
autospawn = no
daemon-binary = /bin/true
# Prevent the use of shared memory
enable-shm = false" | tee /tmp/pulseaudio.client.conf

# Create a new pulse client module
PULSE_MODULE_ID=$(pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket)
echo "Creating new pulse connection, PULSE_MODULE_ID:$PULSE_MODULE_ID"

docker run \
    -it \
    --rm \
    $FLAGS \
    --network=host \
    --env DISPLAY=$DISPLAY \
    --privileged  \
    -v "$HOME/.Xauthority:/home/dos_games_env/.Xauthority"  \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --env PULSE_SERVER=unix:/tmp/pulseaudio.socket \
    --env PULSE_COOKIE=/tmp/pulseaudio.cookie \
    --volume /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
    --volume /tmp/pulseaudio.client.conf:/etc/pulse/client.conf \
    -v "$(pwd)/games/:/home/dos_games_env/games/" \
    --name $IMAGE_NAME \
    $IMAGE_NAME

# Unloading obsolete pulse module
echo "Closing pulse connection, PULSE_MODULE_ID:$PULSE_MODULE_ID"
pactl unload-module $PULSE_MODULE_ID

