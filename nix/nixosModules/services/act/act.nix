{pkgs ? import <nixpkgs> {}, lib}:   
  pkgs.buildNpmPackage {
    name = "act";
    src = builtins.fetchGit { 
      url = "ssh://git@github.com/apostrophecms/assembly-cloud-tools.git"; 
      ref = "main"; 
      rev = "8530f7eeb7db056e5d6a9806ea3629293930eff7";
    };
    npmDepsHash = "sha256-YJOxJXqLIaNYgrGQct7bXhVQXpggAzOpXfrByrQ2RdQ=";
    npmFlags = [ "--legacy-peer-deps" ];
    makeCacheWritable = true;
    buildInputs = [
      pkgs.nodejs_20
    ];
    # buildPhase = ''
    #   npm install
    # '';
    installPhase = ''
      cp -r ./* $out
    '';
    meta = {
      description = "Assembly cloud tools";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [];
    };
  }
  # pkgs.stdenv.mkDerivation {
  #   name = "act";
  #   src = builtins.fetchGit { 
  #     url = "ssh://git@github.com/apostrophecms/assembly-cloud-tools.git"; 
  #     ref = "main"; 
  #     rev = "8530f7eeb7db056e5d6a9806ea3629293930eff7";
  #   };
  #  buildInputs = [
  #     pkgs.nodejs_20
  #   ];
  #   buildPhase = ''
  #     npm install
  #   '';
  #   installPhase = ''
  #     cp -r ./* $out
  #   '';
  # }

