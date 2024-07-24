#! /bin/bash
# Written by FalsePhilosopher with inspiration from https://retropie.org.uk/forum/topic/25770/linux-script-to-batch-convert-psx-bin-cue-to-chd
for cueFile in *.cue; do

gameName="$(basename "$cueFile" .cue)"
chdman createcd -i "${gameName}.cue" -o "${gameName}.chd"
done
