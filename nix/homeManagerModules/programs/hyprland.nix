{...}: {
  stylix.targets.hyprland.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    # Use global package
    package = null;
    portalPackage = null;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun -show-icons ";
      "$menu-clipboard" = "cliphist list | rofi -dmenu | cliphist decode | wl-copy ";
      "$menu-emoji" = "rofi -modi emoji -show emoji";
      "$browser" = "firefox";

      exec-once = [
        "wbg ~/dotfiles/assets/wallpaper.png"
        "dunst"
        "waybar"
        "nm-applet --indicator"
        "wl-paste --type text --watch cliphist store # Stores only text data"
        "wl-paste --type image --watch cliphist store # Stores only image data"
        "[workspace 1 silent] $browser "
        "[workspace 2 silent] kitty -e tmux new -s main "
        "[workspace 3 silent] kitty -e tmux new -s code "
        "[workspace 5 silent] spotify"
      ];

      env = [
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        # Test with stylix instead
        # col.active_border = rgb(eb6f92);
        # col.inactive_border = rgb(191724)

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;
        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        # Test Master layout
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = "rgba (1 a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      master = {
        new_status = "master";
      };

      input = {
        kb_layout = "us,";
        kb_variant = "altgr-intl,";
        follow_mouse = 1;

        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      bind = [
        "$mod, Q, killactive"
        "$mod SHIFT, M, exit,"
        "$mod, V, togglefloating,"
        "$mod, D, exec, $menu"
        "$mod, C, exec, $menu-clipboard"
        "$mod, S, exec, ~/dotfiles/scripts/rofi-sink.py"
        "$mod, N, togglesplit, # dwindle"
        "$mod, W, fullscreen, 1"
        "$mod, A, fullscreen,"
        ''$mod, \, exec, hyprlock''
        "$mod, E, exec, $menu-emoji"

        # Apps
        "$mod, RETURN, exec, $terminal"
        "$mod, F, exec, $fileManager"
        "$mod, O, exec, obsidian"
        "$mod, B, exec, $browser"

        # Move focus
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod CTRL, H, cyclenext, prev"
        "$mod CTRL, L, cyclenext"

        # Move windows
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"

        # Resize mode
        "$mod, R, submap, resize"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Screenshot screen
        ", PRINT, exec, grim - | swappy -f -"

        # Screenshot region
        "SHIFT, PRINT, exec, grim -g \"$(slurp -w 0)\" - | wl-copy "
        "CTRL SHIFT, PRINT, exec, grim -g \"$(slurp -w 0)\" - | swappy -f -"

        # Setup screencast wf-recorder
        "$mod, PRINT, exec, record"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # Media Player
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "workspace 4, class:discord"
        "workspace 4, class:Slack"
        "workspace 5, class:spotify"
        "workspace 3, class:^steam_app"
        "fullscreenstate 3, class:cs2"
        "fullscreenstate 3, class:^steam_app"
        "suppressevent maximize, class:.*"
      ];
    };

    extraConfig = ''
      submap = resize

      binde = , right, resizeactive, 30 0
      binde = , left, resizeactive, -30 0
      binde = , up, resizeactive, 0 -30
      binde = , down, resizeactive, 0 30
      bind = , escape, submap, reset

      submap = reset
    '';
  };
}
