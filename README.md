# Game Preservation Compression
Game image compression for linux based machines.

### PSX bin/cue compression for emulator use
```
for i in *.cue; do chdman createcd -i "$i" -o "${i%.*}.chd"; done
```
### PSP/PS2 iso compression for emulator use
```
for i in *.iso; do chdman createdvd -i "$i" -o "${i%.*}.chd"; done
```
### GameCube conversion for use with dolphin
```
for i in *.iso; do dolphin-tool convert -i "$i" -o "${i%.*}"; done
```
### GameCube iso trimming for use with nintendont  
Add `trim.bat` to the folder, using wine gcit.exe can't rm the .tmp files. So the hacky workaround is included in the one liner. This is very storage intensive as there is two copies untill the .tmp files are removed.

```
mkdir converted && wine trim.bat && cd converted && rm *.tmp
```
---

Info from https://retropie.org.uk/forum/topic/25770/linux-script-to-batch-convert-psx-bin-cue-to-chd
