{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.mongosh
    pkgs.dig
    pkgs.alejandra
    pkgs.kitty
    pkgs.python3
    pkgs.gcc14
    pkgs.nodejs_20
    pkgs.mongodb-tools
    pkgs.typescript
    pkgs.vscode-js-debug
    pkgs.pnpm_10

    # Amazon
    pkgs.awscli2
    pkgs.ssm-session-manager-plugin

    # Rust
    pkgs.pkg-config
    pkgs.rustc
    pkgs.cargo
    pkgs.cargo-watch
    pkgs.openssl

    # Gleam
    pkgs.gleam
    pkgs.erlang

    # DB
    pkgs.sqlite
    pkgs.gnumake

    # Tests
    pkgs.cypress

    # Tools
    pkgs.imagemagick
  ];

  environment.variables = {
    CYPRESS_INSTALL_BINARY = 0;
    CYPRESS_RUN_BINARY = "${pkgs.cypress}/bin/Cypress";
  };

  # Dynamic libraries for unpackaged programs
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    glibc
    libcxx
  ];

  virtualisation.docker.enable = true;

  # Setup mongodb container
  virtualisation.oci-containers.containers.mdb = {
    autoStart = true;
    image = "mongo:5";
    ports = ["27017:27017"];
    volumes = [
      "/var/lib/mongodb:/data/db"
    ];
  };
}
