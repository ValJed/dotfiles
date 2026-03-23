{
  pkgs,
  lib,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "tomato";
  version = "v1.1.0";
  src = pkgs.fetchFromGitHub {
    owner = "ValJed";
    repo = pname;
    rev = version;
    hash = "sha256-0a8RRqIHsgorY+esUGf4h76JbFDM7EO9XzTGe3/jaa4=";
  };
  cargoHash = "sha256-Gyb6lxnamfsL7X+KHRlDKhSKIJ/UaPe5Rlfd7VvItk0=";
  meta = {
    description = "Task manager";
    homepage = "https://github.com/ValJed/tomato";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
