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
* Ctrl + Enter - Toggle full-screen mode
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
* Doom
* Doom2 (Hell on Earth)
* DUKE3D (Duke Nukem 3D)
* Heretic
* RR (Redneck Rampage)
* Full Throttle (ENG & RU)
* Gobliins2 (Gobliins2: The Prince Buffoon)
* LSL1 (Leisure Suit Larry in the Land of the Lounge Lizards) (ENG and RU)
* LSL2 (Leisure Suit Larry Goes Looking for Love (In Several Wrong Places))
* LSL3 (Leisure Suit Larry III: Passionate Patti in Pursuit of the Pulsating Pectorals)
* LSL5 (Leisure Suit Larry 5: Passionate Patti Does a Little Undercover Work)
* LSL6 (Leisure Suit Larry 6: Shape Up or Slip Out!)
* QfG1 (Quest for Glory I: So You Want to Be a Hero)
* QfG2 (Quest for Glory II: Trial by Fire)
* QfG3 (Quest for Glory III: Wages of War)
* QfG4 (Quest for Glory IV: Shadows of Darkness)
* SQ4 (Space Quest IV: Roger Wilco and the Time Rippers)
* SQ5 (Space Quest V: The Next Mutation) (ENG and RU)
* WC (WarCraft Orcs and Humans)
* WC2 EN (WarCraft\ II_\ Tides_of Darkness.v 1 3.Eng)   (here was an issue with storing audio configs, check screenshots)
* WC2 RU SPK (Warcraft 2 Tides Of Darkness Russian from СПК)
* XCOM1 (X-Com UFO Defense)
* HMM (Heroes of Might and Magic)
* HMM2 (Heroes of Might and Magic 2)
* JA (Jagged Alliance)
* PQ1 (Police Quest: In Pursuit of the Death Angel (VGA))




### Issues

