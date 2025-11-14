{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Jed";
        email = "vjeudy@protonmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      merge = {
        tool = "nvimdiff";
      };
    };
  };
}
