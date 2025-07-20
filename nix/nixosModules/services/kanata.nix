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
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    ret
            caps a    s    d    f    g    h    j    k    l    ;    '    \
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rmet rctl
          )
          (defvar
            hold-time 100
            chord-s 30
            chord-m 50
          )
          (defalias
            caps (tap-hold 100 100 esc lctl)
            d_shft (tap-hold 200 200 d lsft)
            k_shft (tap-hold 200 200 k lsft)
            f_meta (tap-hold 200 200 f lmeta)
            j_meta (tap-hold 200 200 j lmeta)

            nums (layer-switch nums)
            default (layer-switch default)
            game (layer-switch game)
            nums_toggle (switch
              ((layer-active default)) (layer-switch num) break
              () (layer-switch default) break)
            game_toggle (switch
              ((layer-active default)) (layer-switch game) break
              () (layer-switch default) break)
          )
          (defchordsv2
            ;; Left Hand
            (a s) @nums_toggle $chord-s all-released (game)
            (z x c) @game_toggle $chord-s all-released ()
          )

          (deflayer default
            grv   1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab   q    w    e    r    t    y    u    i    o    p    [    ]    ret
            @caps a    s    @d_shft  @f_meta    g    h    @j_meta    @k_shft    l    ;    '    \
            lsft  z    x    c    v    b    n    m    ,    .    /    rsft
            lctl  lmet lalt           spc            ralt rmet rctl
          )

          (deflayer game
            grv   1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab   q    w    e    r    t    y    u    i    o    p    [    ]    ret
            caps  a    s    d    f    g    h    @j_meta    k_meta    l    ;    '    \
            lsft  z    x    c    v    b    n    m    ,    .    /    rsft
            lctl  lmet lalt           spc            ralt rmet rctl
          )

          (deflayer nums
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _ 1    2    3    4    5    6    7    8    9    0    [    ]    ret
            _ a    s    @d_shft  @f_meta    g    h    @j_meta    @k_shft    l    ;    '    \
            _ z    x    c    v    b    n    m    ,    .    /    rsft
            _ lmet lalt           spc            ralt rmet rctl
          )
        '';
      };
    };
  };
}
# ;TEST
# Variable solution
# (defvar nav-active false)
#
# (defchords
#   (j k) @chord-toggle 500)
#
# (defalias
#   chord-toggle (cmd-button
#     (if-equal $nav-active false
#       (do (setq nav-active true) (layer-switch navigation))
#       (do (setq nav-active false) (layer-switch base)))))
# (defsrc
#   caps a s d f j k l ;
# )
# (defvar
#   hold-time 100
#   chord-s 30
#   chord-m 50
# )
# (defalias
#   caps (tap-hold 100 100 esc lctl)
# )
# (deflayer default
#   @caps _ _ _ _ _ _ _ _
# )
# (defchordsv2
#   ;; Left Hand
#   (a s) ralt $chord-s all-released ()
#   (s d) lshft $chord-s all-released ()
#   (d f) lmeta $chord-s all-released ()
#
#   ;; Right Hand
#   (j k) lmeta $chord-s all-released ()
#   (k l) lshft $chord-s all-released ()
#   (l ;) ralt $chord-s all-released ()
# )

