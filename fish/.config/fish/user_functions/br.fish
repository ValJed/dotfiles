function br
  set --local screens xrandr -q | grep " connected"
  echo $screens
end
