#!/bin/bash

# set -x
# 
d=2013-01-01
while [ "$d" != 2022-03-21 ]; do 
  echo "Processing: $d"
  month=$(LC_ALL=EN_US.utf-8 date -d "$d" +%B)
  python3 location_history_json_converter.py "$PWD/source/$(date -d "$d" +%Y)/$(date -d "$d" +%Y)_${month^^}.json" "$PWD/dump/Google_timeline_${d}.gpx" -s "${d}" -e "$(date -I -d "${d} + 1 day")" -f gpxtracks -i

  d=$(date -I -d "$d + 1 day")
done
