{pkgs ? import <nixpkgs>}:
pkgs.writeShellScriptBin "record" ''
  record_process="$(pgrep -x "wf-recorder")"
  if [[ -n $record_process ]]; then
    pkill -INT -x wf-recorder
    notify-send -h string:wf-recorder:record -t 1000 "Finished Recording"
    exit 0
  fi

  echo "Record is starting"
  dateTime=$(date +%m-%d-%Y-%H:%M:%S)
  wf-recorder -g "$(slurp)" -f $HOME/Videos/$dateTime.mp4
''
