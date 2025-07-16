{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.kanata
  ];

  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        devices = [
          "/dev/input/by-id/usb-SONiX_USB_Keyboard-event-kbd"
        ];
        extraDefCfg = ''
          process-unmapped-keys yes
          concurrent-tap-hold yes
        '';
        config = ''
          (defsrc
            caps a s d f j k l ;
          )
          (defvar
            hold-time 100
            chord-s 30
            chord-m 50
          )
          (defalias
            caps (tap-hold 100 100 esc lctl)
          )
          (deflayer default
            @caps _ _ _ _ _ _ _ _
          )
          (defchordsv2
            ;; Left Hand
            (a s) ralt $chord-s all-released ()
            (s d) lshft $chord-s all-released ()
            (d f) lmeta $chord-s all-released ()

            ;; Right Hand
            (j k) lmeta $chord-s all-released ()
            (k l) lshft $chord-s all-released ()
            (l ;) ralt $chord-s all-released ()
          )
        '';
      };
    };
  };
}
