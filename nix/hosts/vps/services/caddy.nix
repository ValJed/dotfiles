{
  config,
  pkgs,
  ...
}: {
  services.caddy = {
    enable = true;
    virtualHosts."cloud.valjed.dev".extraConfig = ''
      reverse_proxy 127.0.0.1:5984
    '';
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
