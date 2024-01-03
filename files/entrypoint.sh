#!/bin/bash

echo "whoami:$(whoami)"
echo "USER:$USER"
echo "id:$(id)"

#cd && bash
cd /home/dos_games_env
dosbox -c MOUNT /home/dos_games_env/games

