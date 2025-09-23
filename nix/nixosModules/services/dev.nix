{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.openssl
    pkgs.gcc14
    pkgs.dig
    pkgs.mongodb-tools
    pkgs.python3
    pkgs.sqlite
    pkgs.gnumake
  ];

  # Dynamic libraries for unpackaged programs
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    glibc
    libcxx
  ];
}
