#!/bin/bash
# Written by FalsePhilosopher with inspiration from https://bash.cyberciti.biz/guide/A_progress_bar_(gauge_box)

DIRS=(*.iso)
dialog --title "rvz conversion" --gauge "Converting File" 10 75 < <(
   # Get total number of files in array
   n=${#DIRS[*]};
   # set counter - it will increase every time a file is converted
   i=0
   for f in "${DIRS[@]}"
   do
      PCT=$(( 100*(++i)/n ))
cat <<EOF
XXX
$PCT
Converting File $f
XXX
EOF
dolphin-tool convert -i "$f" -f rvz -b 131072 -c zstd -l 5 -o "${f%.*}.rsv"
done
)
