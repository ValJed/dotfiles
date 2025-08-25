{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    kanata.enable = lib.mkEnableOption "enables kanata";
  };

  config = lib.mkIf config.kanata.enable {
    environment.systemPackages = [
      pkgs.kanata
    ];
    # platform-i8042-serio-0-event-kbd
    services.kanata = {
      enable = true;
      keyboards = {
        default = {
          devices = [
            "dev/input/by-path/platform-i8042-serio-0-event-kbd"
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
              tap-time 200
              hold-time 150
              chord-s 30
              chord-m 50
            )
            (defalias
              caps esc
              d_shft (tap-hold $tap-time $hold-time d lsft)
              k_shft (tap-hold $tap-time $hold-time k lsft)
              f_meta (tap-hold $tap-time $hold-time f lmeta)
              s_alt (tap-hold $tap-time $hold-time s ralt)
              l_alt (tap-hold $tap-time $hold-time l ralt)

              z_alt (tap-hold $tap-time $hold-time z lalt)
              /_alt (tap-hold $tap-time $hold-time / ralt)

              ;; Layouts
              spc_mod (tap-hold $tap-time $hold-time spc (layer-while-held special))
              caps_mod (tap-hold $tap-time $hold-time esc (layer-while-held media))
              game_toggle (switch
                ((layer game)) (layer-switch base) break
                () (layer-switch game) break)
            )

            (defchordsv2
              ;; Left Hand
              (x c v) @game_toggle $chord-s all-released ()

              (d f) lctrl $chord-s all-released (game)
              (s d) lshft $chord-s all-released (game)
              (s d f) (multi lshft lctrl) $chord-s all-released (game)
              (a s) ralt $chord-s all-released (game)

              ;; Right Hand
              (j k) rctrl $chord-s all-released (game)
              (k l) rshft $chord-s all-released (game)
              (j k l) (multi lshft lctrl) $chord-s all-released (game)
              (l ;) ralt $chord-s all-released (game)
            )

            (deflayer base
              grv   1      2     3    4    5    6    7    8    9     0       -    =    bspc    ;; 14
              tab   q      w     e    r    t    y    u    i    o     p       \    ]    ret     ;; 14
              @caps_mod    a     s    d    f    g    h    j    k     l  ;  '       bspc    ;; 13
              lsft  @z_alt x     c    v    b    n    m    ,    .     @/_alt  rsft    ;; 12
              lctl  lalt   lmet             @spc_mod            rmet  ralt    rctl    ;; 7
            )

            (deflayer special
              _          f1   f2   f3   f4   f5   f6    f7    f8   f9   f10  f11   f12    _
              S-prtsc    1    2    3    4    5    6     7     8    9    0    =     S-=    ret
              caps       S-1  S-2  S-3  S-4  S-5  AG-6  S-9   S-0  S-7  S-8  S-7   bspc
              C-S-prtsc  S-`  S-=  =    [    ]    AG-`  S-[   S-]  -    S--        rsft
              _          _    _         @spc_mod         ralt rmet            rctl
            )

            (deflayer media
              _          _          _     bldn       blup    _      _      _      _      _      _       _    _   _
              _          prtsc      _     mute       pp      _      home   pgdn   pgup   end    C-S-v   _    _   ret
              _          S-prtsc    C-b   voldwn     volu    _      left   down   up     rght   _       _    _
              _          C-S-prtsc  _     next prev  next    volu   _      S--    S-7    S-8       rsft
              _          lmet lalt        @spc_mod           ralt   rmet          rctl
            )

            (deflayer game
              grv   1    2    3    4    5    6    7    8    9    0    -    =    bspc
              tab   q    w    e    r    t    y    u    i    o    p    [    ]    ret
              caps  a    s    d    f    g    h    j    k    l    ;    '    \
              lsft  z    x    c    v    b    n    m    ,    .    /    rsft
              lctl  lmet lalt           spc            ralt rmet rctl
            )
          '';
        };
      };
    };
  };
}
# Better tmux key, another layout for arrows and page up / down using space + another key
# Remove too much shortcut for print replace with useful stuff

