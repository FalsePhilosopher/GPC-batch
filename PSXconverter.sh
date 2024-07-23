#! /bin/bash
for cueFile in *.cue; do

gameName="$(basename "$cueFile" .cue)"
chdman createcd -i "${gameName}.cue" -o "/mnt/Expansion/Roms/PSX/${gameName}.chd"
done
