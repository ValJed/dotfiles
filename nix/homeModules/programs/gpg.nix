{...}: {
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    defaultCacheTtl = 3600; # 1 hour
    maxCacheTtl = 7200; # 2 hours
  };
}
