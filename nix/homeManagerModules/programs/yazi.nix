{pkgs, ...}: {
  stylix.targets.yazi.enable = true;

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    plugins = {
      toggle-pane = pkgs.yaziPlugins.toggle-pane;
    };
    settings = {
      mgr = {
        show_hidden = true;
      };
      opener = {
        play = [
          {
            run = ''vlc "$@"'';
            orphan = true;
          }
        ];
        pdf = [
          {
            run = ''zathura "$@"'';
            desc = "Zathura";
          }
        ];
        zip = [
          {
            run = ''unzip "$1" -d "\$\{1%.*}"'';
            desc = "Extract to folder";
          }
        ];
        tar_gz = [
          {
            run = ''tar -xzf "$1"'';
            desc = "Extract here";
          }
        ];
        image = [
          {
            run = ''gthumb "$1"'';
            desc = "Gthumb";
          }
          {
            run = ''pinta "$@"'';
            desc = "Pinta";
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            name = "*.pdf";
            use = "pdf";
          }
          {
            name = "*.zip";
            use = "zip";
          }
          {
            name = "*.tar.gz";
            use = "tar_gz";
          }
          {
            mime = "image/*";
            use = "image";
          }
        ];
      };
    };
    keymap = {
      help.prepend_keymap = [
        {
          on = "/";
          run = "filter";
        }
      ];
      mgr.prepend_keymap = [
        {
          on = "Y";
          run = "shell 'for path in \"$@\"; do echo \"file://$path\"; done | wl-copy -t text/uri-list'";
          desc = "wl copy selected files";
        }
        {
          on = "b";
          run = "back";
        }
        {
          on = ["g" "/"];
          run = "cd /";
          desc = "root";
        }
        {
          on = ["g" "p"];
          run = "cd ~/workspace/projects";
          desc = "Projects";
        }
        {
          on = ["g" "a"];
          run = "cd ~/workspace/apo";
          desc = "Apos";
        }
        {
          on = ["g" "d"];
          run = "cd ~/Documents";
          desc = "Documents";
        }
        {
          on = ["g" "D"];
          run = "cd ~/Downloads";
          desc = "Downloads";
        }
        {
          on = ["g" "P"];
          run = "cd ~/Pictures";
          desc = "Pictures";
        }
        {
          on = ["g" "v"];
          run = "cd ~/Videos";
          desc = "Videos";
        }
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
      ];
    };
  };
}
