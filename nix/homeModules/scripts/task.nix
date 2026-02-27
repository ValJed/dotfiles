{
  pkgs,
  lib,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "task";
  version = "main";
  src = pkgs.fetchFromGitHub {
    owner = "ValJed";
    repo = pname;
    rev = version;
    hash = "sha256-eU+c5rU14+gTk9I60o39gqOq2nKlFjdqJBTGIz8gjYw=";
  };

  cargoHash = "sha256-9p6ZdevqsnDvcamA85PNHHzYcLJ79Zt+CyAE++FPdDw=";

  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.openssl
  ];

  PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";

  meta = {
    description = "Task manager";
    homepage = "https://github.com/ValJed/task";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
