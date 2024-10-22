
{ config, pkgs, ... }:

{
  services.mongodb = {
    enable = true;
    package = "mongodb-5_0";
    enableAuth = true;
    initialRootPassword = "root";
  };
}
