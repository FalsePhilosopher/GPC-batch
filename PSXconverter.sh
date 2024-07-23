#! /bin/bash
for cueFile in *.cue; do

gameName="$(basename "$cueFile" .cue)"
chdman createcd -i "${gameName}.cue" -o "${gameName}.chd"
done
