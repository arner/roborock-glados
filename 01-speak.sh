#!/bin/bash -e
#
# Run this script to generate wav files in GLaDOS' voice based on the lines in the input csv.
# Existing files are not overwritten. Requires curl.

inputfile=audio_default.csv
outputdir=output/speech

mkdir -p $outputdir

while IFS=, read -r name quotedtext; do
  text="${quotedtext%\"}"
  text="${text#\"}"

  filename="$outputdir/$name"

  echo "Processing: $text"
  if [ ! -f "$filename" ]; then
    curl -Ls --retry 30 --get --fail \
      --data-urlencode "text=$text" \
      -o "$filename" \
      'https://glados.c-net.org/generate'
  fi
done < $inputfile
