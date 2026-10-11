{...}: {
  services.caddy = {
    enable = true;
    virtualHosts."cloud.valjed.dev".extraConfig = ''
      redir /task-api /task-api/

      handle_path /task-api/* {
        reverse_proxy 127.0.0.1:3000
      }

      reverse_proxy 127.0.0.1:5984
    '';
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
