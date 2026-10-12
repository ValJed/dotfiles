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
      oopener = {
        play = [
          {
            run = ''vlc %s'';
            orphan = true;
          }
        ];
        pdf = [
          {
            run = ''zathura %s'';
            desc = "Zathura";
            orphan = true;
          }
          {
            run = ''firefox %s'';
            desc = "Firefox";
            orphan = true;
          }
        ];
        zip = [
          {
            run = ''f=%s1; unzip "$f" -d "''${f%%.*}"'';
            desc = "Extract to folder";
          }
        ];
        tar_gz = [
          {
            run = ''tar -xzf %s1'';
            desc = "Extract here";
          }
        ];
        image = [
          {
            run = ''gthumb %s1'';
            desc = "Gthumb";
          }
          {
            run = ''pinta %s'';
            desc = "Pinta";
          }
        ];
      };
      pen = {
        prepend_rules = [
          {
            mime = "application/pdf";
            use = "pdf";
          }
          {
            url = "*.zip";
            use = "zip";
          }
          {
            url = "*.tar.gz";
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
