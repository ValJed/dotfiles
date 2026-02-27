{config, ...}: {
  stylix.targets.waybar.enable = true;
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        spacing = 10;
        height = 43;
        reload_style_on_change = true;

        modules-left = [
          "clock"
          "hyprland/workspaces"
        ];

        modules-center = [
          "hyprland/window"
        ];

        modules-right = [
          "pulseaudio"
          "disk"
          "cpu"
          "memory"
          "temperature"
          "battery"
          "tray"
          "custom/power"
        ];

        # Modules configuration
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
          };
        };

        tray = {
          spacing = 10;
        };

        clock = {
          format = " {:%H:%M    %d/%m}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#${config.lib.stylix.colors.base05}'><b>{}</b></span>";
              days = "<span color='#${config.lib.stylix.colors.base0D}'><b>{}</b></span>";
              weeks = "<span color='#${config.lib.stylix.colors.base0C}'><b>W{}</b></span>";
              weekdays = "<span color='#${config.lib.stylix.colors.base09}'><b>{}</b></span>";
              today = "<span color='#${config.lib.stylix.colors.base08}'><b><u>{}</u></b></span>";
            };
          };
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}%";
          format-bluetooth-muted = "󰟎";
          format-muted = "󰟎";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        disk = {
          path = "/";
          interval = 30;
          format = " {percentage_used}%";
        };

        cpu = {
          format = " {usage}%";
          tooltip = false;
        };

        memory = {
          format = " {}%";
        };

        temperature = {
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = ["" "" ""];
        };

        backlight = {
          # device = "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        battery = {
          states = {
            good = 90;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        "custom/power" = {
          format = "⏻ ";
          tooltip = false;
          on-click = "poweroff";
        };
      };
    };

    style = ''
      window#waybar.hidden {
        opacity: 0.2;
      }

      .modules-left #workspaces button {
          border: none;
          border-radius: 0px;
      }
      .modules-left #workspaces button.focused,
      .modules-left #workspaces button.active {
          border: none;
      }

      .modules-left #workspaces button:hover {
        color: @base05;
        background: inherit;
      }

      #workspaces {
        margin-top: 5px;
        padding: 5px;
      }

      #workspaces button {
        color: @base03;
      }

      #workspaces button.active {
        color: @base05;
      }

      #clock,
      #battery,
      #cpu,
      #sdisk,
      #memory,
      #temperature,
      #network,
      #pulseaudio,
      #tray {
        padding: 0 7px 0 7px;
      }

      #clock {
        color: @base0E;
        padding: 0 7px 0 7px;
        margin-left: 5px;
      }

      #pulseaudio {
        color: @base08;
      }

      #disk {
        color: @base0B;
      }

      #cpu {
        color: @base0E;
      }

      #memory {
        color: @base0D;
      }

      #temperature {
        color: @base0A;
      }

      #battery {
        color: @base0B;
      }

      #custom-kanata {
        color: @base0A;
      }

      @keyframes blink {
          to {
              background-color: transparent;
              color: @base0B;
          }
      }

      /* Using steps() instead of linear as a timing function to limit cpu usage */
      #battery.critical:not(.charging) {
        background-color: @base08;
        color: @base05;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #wireplumber.muted {
        background-color: @base08;
      }

      #temperature.critical {
        background-color: @base08;
      }

      #custom-power {
        margin-right: 10px;
      }
    '';
  };
}
