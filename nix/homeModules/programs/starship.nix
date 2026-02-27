{...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;

      directory = {
        style = "bold cyan";
        read_only = " ";
        truncation_length = 4;
      };
      package.disabled = true;
      nodejs.format = "via [$symbol]($style)";
      rust.format = "via [⚙️](red bold)";
    };
  };
}
