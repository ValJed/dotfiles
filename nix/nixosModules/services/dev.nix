
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mongosh
    docker-compose
    dig
    awscli2
  ];

  virtualisation.docker.enable = true;

  # Setup mongodb container
  # virtualisation.oci-containers = {
  #   containers.mdb = {
  #     autoStart = true;
  #     image = "mongo:5";
  #     ports = [ "27017:27017" ];
  #     volumes = [ "mdb:/data/db" ];
  #   };
  # };

  # Install ACT
  # pkgs.stdenv.mkDerivation = {
  #   name = "act";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "apostrophecms";
  #     repo = "apostrophe";
  #     rev = "6a01b763ea6bdfcf12d992fe012d1a5bd52eb623";
  #     fetchSubmodules = true;
  #     hash = "";
  #   };
  #   # src = builtins.fetchGit {
  #   #   # url = "git+ssh://git@https://github.com/apostrophecms/assembly-cloud-tools.git";
  #   #   # url = "git@github.com:apostrophecms/apostrophe.git";
  #   #   url = "ssh://git@github.com/apostrophecms/apostrophe.git";
  #   #   ref = "main";
  #   #   rev = "6a01b763ea6bdfcf12d992fe012d1a5bd52eb623";
  #   #   # rev = "8530f7eeb7db056e5d6a9806ea3629293930eff7";       
  #   #   # sha256 = "sha256-42cd1277c2b45aa6b4eb648cb1d425be8b1c9c3996f63787f69b2bfb0aa574c6";
  #   #   # sha256 = pkgs.lib.fakeHash;
  #   # };
  #   buildPhase = ''
  #     npm install
  #   '';
  #   # installPhase = ''
  #   #   cp -r ./* $out
  #   # '';
  # };
}

