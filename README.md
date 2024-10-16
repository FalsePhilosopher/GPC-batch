# Game Preservation Compression
Game image compression for linux based machines.

chdman is part of `mame-tools`
```
git clone https://github.com/mamedev/mame
cd mame
make TOOLS=1 -j3 #-j5 if you got a beefy system
sudo cp chdman /bin
```
Check your package manager for `mame-tools`  

dolphin-tool is part of [dolphin](https://github.com/dolphin-emu/dolphin)  
gcit.exe original location can be found [here](https://wiibackupmanager.co.uk/index.php?file=gcit_Win32_Build7)

### PSX/SG bin/cue compression for emulator use
For standard options cdlz (CD LZMA), cdzl (CD Deflate), cdfl (CD FLAC)
```
mkdir CHD && for i in *.cue; do chdman createcd -i "$i" -o "$PWD/CHD/${i%.*}.chd"; done
```
For Zstd compression  
```
mkdir CHD && for i in *.cue; do chdman createcd -c "zstd,cdzs,cdflac" -i "$i" -o "$PWD/CHD/${i%.*}.chd"; done
```
### PSP/PS2 iso compression for emulator use
```
mkdir CHD && for i in *.iso; do chdman createdvd -i "$i" -o "$PWD/CHD/${i%.*}.chd"; done
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

