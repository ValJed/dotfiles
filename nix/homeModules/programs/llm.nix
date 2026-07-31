{pkgs, ...}: {
  programs.opencode = {
    enable = true;
    package = pkgs.llm-agents.opencode;
  };

  programs.pi-coding-agent = {
    enable = true;
  };
}
