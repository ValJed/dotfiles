{pkgs}: let
  url = "git@github.com:apostrophecms/assembly-cloud-tools";
in {
  pkgs.stdenv.mkDerivation {
    name = "act";
    src = builtins.fetchGit { 
      url = url; 
      ref = "main"; 
      rev = "8530f7eeb7db056e5d6a9806ea3629293930eff7"; 
    };
    buildPhase = ''
      npm install
    '';
    installPhase = ''
      cp -r ./* $out
    '';
  };
}

