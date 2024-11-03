{ pkgs, lib }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "task";
  version = "main";

  src = pkgs.fetchFromGitHub {
    owner = "ValJed";
    repo = pname;
    rev = version;
    hash = "sha256-FI2iNYD5ytXSEx+SrMXDYnFc1uz7XX/xNS1AT7McCu4=";
  };

  cargoHash = "sha256-iM/ZuEqS/dxmG+f1h34LP9Nc7RGlmL4JdFPrAocTNJ0=";

  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.openssl
  ];

  PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";

  meta = {
    description = "Task manager";
    homepage = "https://github.com/ValJed/task";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
}
