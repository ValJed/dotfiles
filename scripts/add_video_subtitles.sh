#!/usr/bin/env bash

# Check if a directory path was provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide a directory path as an argument."
    exit 1
fi

directory_path=$1
subtitle_path=$2

function encode_vid() {
  vid_path=$1
  sub_path=$2

  if [ ! -f "$path" ]; then
    return
  fi

  # Get file extension
  ext="${path##*.}"
  file=$(basename "$path" ".$ext")
  dir=$(dirname "$path")
  
  # Set subtitle codec based on format
  if [ "$ext" = "mkv" ]; then
    subtitle_codec="srt"
  else
    subtitle_codec="mov_text"
  fi
  
  ffmpeg -i "$path" -f srt -i "$dir/subtitles/$file.srt" \
  -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy \
  -c:s "$subtitle_codec" "${dir}/${file}_fr.$ext" &&
  rm "$path" &&
  mv "${dir}/${file}_fr.$ext" "$path"
}

echo $directory_path
for path in "$directory_path"/*.{mkv,mp4}; do
    if [ -f "$path" ]; then
      # Get file extension
      ext="${path##*.}"
      file=$(basename "$path" ".$ext")
      dir=$(dirname "$path")
      
      # Set subtitle codec based on format
      if [ "$ext" = "mkv" ]; then
        subtitle_codec="srt"
      else
        subtitle_codec="mov_text"
      fi
      
      ffmpeg -i "$path" -f srt -i "$dir/subtitles/$file.srt" \
      -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy \
      -c:s "$subtitle_codec" "${dir}/${file}_fr.$ext" &&
      rm "$path" &&
      mv "${dir}/${file}_fr.$ext" "$path"
    fi
done

# for path in "$directory_path"/*.mkv; do
#     if [ -f "$path" ]; then
#       file=$(basename "$path" .mkv)
#       dir=$(dirname "$path")
#       ffmpeg -i $path -f srt -i $dir/subtitles/$file.srt \
#       -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy \
#       -c:s srt "${dir}/${file}_fr.mkv" &&
#       rm $path &&
#       mv "${dir}/${file}_fr.mkv" "$path"
#     fi
# done

echo "All conversions completed."
