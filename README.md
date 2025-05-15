# Game Preservation Compression
Game image compression for linux based machines.

chdman and dolphin-tools can be download from the release section or the automated monthly build artifact.

chdman is part of [mame-tools](https://github.com/mamedev/mame), Compilation [instructions](https://docs.mamedev.org/initialsetup/compilingmame.html)
```
git clone https://github.com/mamedev/mame
cd mame
make TOOLS=1 EMULATOR=0 -j3 #-j5-8 if you got a beefy system
sudo cp chdman /bin
```

dolphin-tool is part of [dolphin](https://github.com/dolphin-emu/dolphin), Compilation [instructions](https://github.com/dolphin-emu/dolphin/wiki/Building-for-Linux)

gcit.exe original location can be found [here](https://wiibackupmanager.co.uk/index.php?file=gcit_Win32_Build7)

### PSX/Sega CD bin/cue compression for emulator use
For standard options cdlz (CD LZMA), cdzl (CD Deflate), cdfl (CD FLAC)
```
mkdir CHD && for i in *.cue; do chdman createcd -i "$i" -o "$PWD/CHD/${i%.*}.chd"; done
```
For Zstd compression  
```
mkdir CHD && for i in *.cue; do chdman createcd -c "zstd,cdzs,flac" -i "$i" -o "$PWD/CHD/${i%.*}.chd"; done
```
For extraction
```
mkdir CUE && for i in *.chd; do chdman extractcd -sb -i "$i" -o "$PWD/CUE/${i%.*}.cue"; done
```
For playback on PS3 you can concatenate the .bin files in the order they appear in the .cue.
```
cat track1.bin track2.bin track3.bin > merged.bin
```
### PSP/PS2 iso compression for emulator use
```
mkdir CHD && for i in *.iso; do chdman createdvd -i "$i" -o "$PWD/CHD/${i%.*}.chd"; done
```
For Zstd compression
```
mkdir CHD && for i in *.iso; do chdman createdvd -c "zstd" -i "$i" -o "$PWD/CHD/${i%.*}.chd"; done
```
For extraction
```
mkdir ISO && for i in *.chd; do chdman extractdvd -i "$i" -o "$PWD/ISO/${i%.*}.iso"; done
```
### GameCube conversion for use with dolphin
```
mkdir RVZ && for i in *.iso; do echo "converting '$i'"; dolphin-tool convert -i "$i" -f rvz -b 131072 -c zstd -l 5 -o "$PWD/RVZ/${i%.*}.rvz"; done
```
### GameCube conversion for use with dolphin with progress
Drop the [GC-Convert.sh](https://github.com/FalsePhilosopher/GPC-batch/raw/main/GC-Convert.sh) into the dir and run it.
```
wget https://github.com/FalsePhilosopher/GPC-batch/raw/main/GC-Convert.sh && chmod +x GC-Convert.sh && ./GC-Convert
```
### GameCube iso trimming for use with nintendont  
Add [trim.bat](https://github.com/FalsePhilosopher/GPC-batch/raw/main/trim.bat) to the dir and run it with wine.
```
mkdir Trimmed && wget https://github.com/FalsePhilosopher/GPC-batch/raw/main/trim.bat && wine trim.bat
```

