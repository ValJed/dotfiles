function br
  set --local brightness $argv[1]

  # if $brightness == ""
  #   echo "Set a brightness value"
  #   return 1
  # end

  set --local connected_screens (command xrandr -q | grep ' connected')

  for conn_screen in $connected_screens
    set --local screen (command echo $conn_screen | cut -d ' ' -f1)

    command xrandr --output
    echo $screen
  end

end
