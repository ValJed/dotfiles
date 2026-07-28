{...}: {
  programs.herdr = {
    enable = true;
    settings = {
      keys = {
        prefix = "ctrl+b";

        focus_pane_left = ["ctrl+h"];
        focus_pane_down = ["ctrl+j"];
        focus_pane_up = ["ctrl+k"];
        focus_pane_right = ["ctrl+l"];
        previous_tab = ["prefix+h"];
        next_tab = ["prefix+l"];
      };
      onboarding = false;
      terminal = {
        default_shell = "zsh";
        new_cwd = "follow";
        shell_mode = "auto";
      };
      theme = {
        auto_switch = false;
        dark_name = "rose-pine";
        light_name = "rose-pine-dawn";
        name = "rose-pine";
      };
      ui = {
        agent_panel_sort = "priority";
        sidebar_width = 25;
        sound = {
          enabled = true;
        };
        toast = {
          delivery = "herdr";
        };
      };
    };
  };
}
