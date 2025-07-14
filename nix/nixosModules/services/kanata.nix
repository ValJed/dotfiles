{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.kanata
  ];

  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        extraDefCfg = ''
          process-unmapped-keys yes
          concurrent-tap-hold yes
        '';
        config = ''
          (defsrc
            q s
          )
          (defvar
            hold-time 100
          )

          (deflayer default
            q s
          )

          (defchordsv2
            (q s) esc 50 all-released ()
          )
        '';
      };
    };
  };

  users.users.jed.extraGroups = ["input"];
}
