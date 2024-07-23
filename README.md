# chdman-batch

For a one line conversion of PSX
```
for i in *.cue; do chdman createcd -i "$i" -o "${i%.*}.chd"; done
```
Info from https://retropie.org.uk/forum/topic/25770/linux-script-to-batch-convert-psx-bin-cue-to-chd
