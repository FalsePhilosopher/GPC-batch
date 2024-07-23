# Game Preservation Compression

PSX bin/cue compression for emulator use
```
for i in *.cue; do chdman createcd -i "$i" -o "${i%.*}.chd"; done
```
PSP/PS2 iso compression for emulator use
```
for i in *.iso; do chdman createdvd -i "$i" -o "${i%.*}.chd"; done
```
GameCube conversion for use with dolphin
```
for i in *.iso; do dolphin-tool convert -i "$i" -o "${i%.*}"; done
```
GameCube iso trimming for use with nintendont
```
for i in *.iso; do exec wine 'Z:\PathtoFolder\gcit.exe convert -i "$i" -d "${i%.*}"'; done
```

Info from https://retropie.org.uk/forum/topic/25770/linux-script-to-batch-convert-psx-bin-cue-to-chd
