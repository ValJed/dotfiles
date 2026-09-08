{
  pkgs,
  config,
  ...
}: {
  services.couchdb = {
    enable = true;
    package = pkgs.couchdb3;
    bindAddress = "127.0.0.1";
    port = 5984;

    extraConfig = {
      couchdb.single_node = true;
      chttpd.require_valid_user = true;
    };

    extraConfigFiles = [config.sops.secrets.couchdb-admins-ini.path];
  };

  environment.systemPackages = with pkgs; [
    couchdb-dump
  ];

  sops.secrets.couchdb-admins-ini = {
    owner = config.services.couchdb.user;
    group = config.services.couchdb.group;
    mode = "0400";
  };
}
