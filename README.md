# dos_games_env
dosbox for running dos games




### To build DOSBOX image
```
$bash ./build.sh
```




### To run DOSBOX image
```
bash ./run.sh
```




### To run bash in case you want to see what's going on in DOSBOX container
```
bash ./run.sh dos_games_env --entrypoint="/home/dos_games_env/bash.sh"
```




### Dosbox hotkeys
* Ctrl + F1    - Show the keymapper configuration screen
* Ctrl + ENter - Toggle full-screen mode
* Ctrl + F10   - Capture/Release the mouse (if you need to use the mouse within DOSBox)
* Ctrl + F9    - Kill (close) DOSBox




### Video setup
Current solution is tested with Ubuntu 20.04 and expectes that host system has X11.
To test that X11 forwarding works as expected, run this:

```
bash ./run.sh dos_games_env --entrypoint="/home/dos_games_env/xeyes"
```
You shall see xeyes popping up on the screen.




### Sound setup
Current solution is tested with Ubuntu 20.04 and expectes that host system has pulseaudio.
For other host types this solution might not work.
To test that sound forwarding works as expected, run this:

```
bash ./run.sh dos_games_env --entrypoint="/home/dos_games_env/test_sound.sh"
```
You shall see some traces and hear some sounds being played actually by docker container.




##### Ordinary game sound setup
I found these setting in www:
```
    https://www.dosbox.com/faq.php
    The game doesn't detect the soundbaster.
        Does the game have some setup/soundset/install or similar tool to setup your sound? Use that.
        The default settings for the ***soundblaster are, port 220, irq 7, dma 1***.
        Some games may also require you to slow down cpu emulation to detect the sound blaster correctly. 
```

and tested the next setup with Blood[https://en.wikipedia.org/wiki/Blood_(video_game)] game for DOS from 1997

    Sound Card
        - card: Sound Blaster
        - port: 0x220
        - irq:  7
        - 8-bit DMA: 1
        - 16-bit DMA: 5

    Music Card {
        - card: Sound Blaster

And ***Blood*** was running with both sound and music.
Btw, ***Blood*** uses (Voxels)[https://en.wikipedia.org/wiki/Voxel] for drawing keys and other stuff, while Maincraft usws voxwls for drawing the entire Universe.




### List of tested and working games
* Blood
* Heretic
* Goblins
* goblin2rus
* RR(Redneck Rampage)
* QfG1(Quest for Glory1 VGA)
* sq4rus(Space Quest 4 RUS) - ! this one is stuck !
* sq5rus(SPace Quest 5 RUS)

