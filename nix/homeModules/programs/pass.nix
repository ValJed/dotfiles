{
  pkgs,
  user,
  ...
}: {
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [exts.pass-otp]);
    settings = {
      PASSWORD_STORE_DIR = "/home/${user}/.password-store";
    };
  };
}
