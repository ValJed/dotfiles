{
  pkgs,
  lib,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "tomato";
  version = "v1.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "ValJed";
    repo = pname;
    rev = version;
    hash = "sha256-2ERqEtTQ25muKjoJgMPb9wjpPkoof5yBptgAmOTpItc=";
  };

  cargoHash = "sha256-pGX8CdkVZu+XYUIfiU21BxVGP36yv5fwZ0MNm4QSl+M=";

  meta = {
    description = "Task manager";
    homepage = "https://github.com/ValJed/task";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
